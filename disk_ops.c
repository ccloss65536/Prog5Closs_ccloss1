#include <stdlib.h>
#include <pthread.h>
#include "common.h"
#include <string.h>
#include <fcntl.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <stdio.h>
#include <unistd.h>

//Puts a request for the disk scheduler into the array
void request(block_ptr block, void* buffer, char read_write){
	//pthread_mutex_lock(&request_condition_mutex);
	//while(num_requests >= max_requests) pthread_cond_wait(&request_empty, &request_condition_mutex);
	sem_wait(&request_empty);
	//printf("Uhhhhhhhhhhh...\n");
	sem_wait(&request_condition_mutex);
	//printf("Why does this not work!?!?!?!?\n");

	int oldrequest = next_free_request;
	//printf("In: %d\n", oldrequest); 

	disk_request newRequest;
	newRequest.requested = block;
	newRequest.buffer = buffer;
	newRequest.read_write = read_write;
	pending[next_free_request] = newRequest;
	//printf("Write to array\n");
	next_free_request = (next_free_request + 1) % max_requests;
	
	sem_post(&request_condition_mutex);
	sem_post(&request_full);
	//printf("We signaled\n");
	//pthread_mutex_unlock(&request_condition_mutex);
	//printf("Number of requests: %d\n",num_requests); 
	pthread_mutex_lock(&request_fufilled_mutex);
	while(wakeup_arr[oldrequest] < 1) pthread_cond_wait(&request_fufilled[oldrequest], &request_fufilled_mutex);
	wakeup_arr[oldrequest] = 0;
	pthread_mutex_unlock(&request_fufilled_mutex);

}


int find_free_block(){
	pthread_mutex_lock(&free_block_list);
	int i = 0;
	int free_block;
	for(; i < num_blocks; i++){
		if((free_bitfield[i/8] & (1 << (i % 8))) == 0){
			free_block = i;
			free_bitfield[num_blocks/8] |= (1 << (i % 8));
		}
	}
	if(i == num_blocks/8) free_block = -1;
	pthread_mutex_unlock(&free_block_list);
	return free_block;
}

int find_file(char* name){
	pthread_mutex_lock(&inode_list);//We need to lock here because some thread could make a new file while we traverse the list
	int i = 0;//Please do not change this! if i is initalized in ther for loop, gcc complains that i is uninitalized at the if statement
	for(; i < max_files; i++){
		//if(inodes[i].size >= 0){
			//printf("%s<end>\n%s<end>\n", inodes[i].name, name);
		//}
		if( inodes[i].size >= 0 && (strcmp(inodes[i].name, name) == 0)) break; //strcmp rdeturns zero if the two strings are equal
	}
	if(i == max_files) i = -1; //If not found, return -1
	pthread_mutex_unlock(&inode_list);
	return i;
}

void create(char* name){

	inode newFileInode;
	strcpy(newFileInode.name, name);
	newFileInode.size = 0;

	if(num_files == max_files){
		printf("Error: max number of files reached\n");
		return;
	}
	//Moved to avoid holding the mutex and returning if there are 256 files
	pthread_mutex_lock(&inode_list);//another thread could be creating a file and editting the inode list

	for(int i =0; i < max_files; i++){
		if(inodes[i].size == -1){
			inodes[i] = newFileInode;
			inodes[i].direct[0] = find_free_block(); //Make sure every file has some space to write into, even if it's curretly empty
			num_files++;
			break;
		}
	}
	pthread_mutex_unlock(&inode_list);
}

void import(char* new_name, char* unix_name){
	int unixFile = open(unix_name, O_RDONLY);
	if(unixFile == -1){
		perror("Error: Unix file does not exist");
		exit(1);
	}
	//if file does not exist create it
	if(find_file(new_name) == -1){
		create(new_name);
	}

	//this char array allows us to read a block at a time
	char fileBuffer[block_size];
	int i = 0;
	int bytesRead = read(unixFile, fileBuffer, block_size);
	while(bytesRead){

		//that way the location is updated based on how much input was taken
		//if it was a whole block it will add block_size
		//else it will just add the amount of bytes read
		write_ssfs(new_name, 'a', i*block_size, bytesRead, fileBuffer);
		i++;
		bytesRead = read(unixFile, fileBuffer, block_size);
	}

	close(unixFile);
}

void cat(char* name){
	int index = find_file(name);
	if(index < 0) {
		printf("File \"%s\" not found!\n",name);
		return;
	}
	read_ssfs(name, 0, inodes[index].size);
}
void erase(char* name){
	int index = find_file(name);
	inode n;
	if(index > -1){
		n = inodes[index];
	} else {
		printf("File %s not found!\n",name);
	}
	int* indirect = malloc(block_size);
	int* double_indirect = malloc(block_size);
	if(!indirect || !double_indirect){
		perror("Allocation for erase failed!: ");
		free(indirect);
		free(double_indirect);
		exit(-1);
	}
	unsigned int i;
	pthread_mutex_lock(&free_block_list);
	for(i = 0; i < 12 && i < (unsigned)n.size/block_size; i++){
		int block_num = indirect[i - 12];
		free_bitfield[block_num/8] &= ~(1 << (block_num % 8));
	}
	if(i == 12){
		request(n.indirect, indirect, 'r');
		for(; i < 12 + block_size/sizeof(int); i++){
			int block_num = n.direct[i];
			free_bitfield[block_num/8] &= ~(1 << (block_num % 8));
		}
	}
	if(i == 12 + block_size/sizeof(int)){
		request(n.double_indirect, double_indirect, 'r');
		while(i < 12 + block_size/sizeof(int) + (block_size/sizeof(int)) * (block_size/sizeof(int)) ){
			request(double_indirect[(i - 12 + block_size/sizeof(int)) / block_size], indirect, 'r');
			int j = 0;
			for(; j < block_size; j++){
				int block_num = indirect[j];
				free_bitfield[block_num/8] &= ~(1 << (block_num % 8));
			}
		}
	}
	pthread_mutex_unlock(&free_block_list);
	num_files--;
	free(indirect);
	free(double_indirect);
	inodes[index].size = -1;
}



void write_ssfs(char* name, char input, int start_byte, int num_bytes, char* buffer){

	int index = find_file(name);
	pthread_mutex_lock(&inode_list);
	if(index < 0 || start_byte > inodes[index].size) {
		printf("File \"%s\" not found!\n",name);
		pthread_mutex_unlock(&inode_list);
		return;
	}

	char* data = (buffer)?buffer:malloc( (num_bytes / block_size + 1) * block_size);  //not an exact ceil, but memory is cheap and floatng point ops are not

	int i;
	if(!buffer){
		for(i = 0; i < num_bytes; i++) data[i] = input;
	}
	int* indirect = malloc(block_size);
	int* double_indirect = malloc(block_size);
	if(!data || !indirect || !double_indirect){
		perror("Allocation for read_ssfs failed!: ");
		free(data);
		free(indirect);
		free(double_indirect);
		pthread_mutex_unlock(&inode_list);
		exit(-1);
	}
	 //allocate new blocks if necessary
	inode file_inode = inodes[index];
	int ptrs_per_block = block_size/sizeof(block_ptr);
	int old_end_block = file_inode.size / block_size;
	int new_end_block = (start_byte + num_bytes) / block_size;
	for(;old_end_block < new_end_block && old_end_block < 12; old_end_block++){
		inodes[index].direct[old_end_block] = find_free_block();
	}
	if(new_end_block >= 12 && new_end_block < 12 + ptrs_per_block ){ //no point in editing the indirect block if it doesn't have the end of the file
		request(inodes[index].indirect, indirect, 'r'); //We need to keep the old data
		for(;old_end_block < new_end_block;old_end_block++){
			indirect[old_end_block - 12] = find_free_block();
		}
		request(inodes[index].indirect, indirect, 'w');
	}
	if(old_end_block >= 12 + ptrs_per_block){
		request(inodes[index].double_indirect, double_indirect, 'r');
		int new_dbl_blk = (new_end_block - 12 - ptrs_per_block)/block_size/block_size;
		int old_dbl_blk = (old_end_block - 12 - ptrs_per_block)/block_size/block_size;
		int k = old_dbl_blk;
		for(;k < new_dbl_blk; k++){
			double_indirect[k] = find_free_block();
		}
		request(inodes[index].double_indirect, double_indirect, 'w');
		while(old_dbl_blk < new_dbl_blk){
			int m;
			for(m = 0; m < ptrs_per_block && old_end_block < new_end_block; m++){
				old_end_block++;
				indirect[m] = find_free_block();
			}
			request(double_indirect[old_dbl_blk], indirect, 'w');
			old_dbl_blk++;
		}

	}

	int start_block_ind = start_byte/block_size; //The start byte is in the file's start_block_indth data block
	int curr_block_ind = start_block_ind;//keep track of which block we need to read from
	int end_block_ind = (start_byte + num_bytes)/block_size;
	for(; curr_block_ind < 12 && curr_block_ind <= end_block_ind; curr_block_ind++){
		request(inodes[index].direct[i], data + curr_block_ind*block_size, 'w');
	}

	if(curr_block_ind == 12){//the 0th through 11th blocks are direct blocks
		request(inodes[index].indirect, indirect, 'r');
		for(; curr_block_ind < 12 + ptrs_per_block  && curr_block_ind <= end_block_ind; curr_block_ind++){
		request(indirect[curr_block_ind - 12], data + curr_block_ind*block_size, 'w');

		}
	}
	int indirect_end_block = 12 + ptrs_per_block;
	if(curr_block_ind == indirect_end_block) {
		request(inodes[index].double_indirect, double_indirect, 'r');
		while(curr_block_ind < indirect_end_block + ptrs_per_block*ptrs_per_block){
			request(double_indirect[(curr_block_ind - indirect_end_block) / block_size], indirect, 'r');
			for(int i = 0; i < block_size; i++){
				request(indirect[curr_block_ind - 12], data + curr_block_ind*block_size, 'w'); \
				curr_block_ind++;
			}
		}
	}
	pthread_mutex_unlock(&inode_list);
	write(1 ,data + start_byte, num_bytes);
	free(data);
	free(indirect);

}
void read_ssfs(char* name, int start_byte, int num_bytes){
	int index = find_file(name);
	if(index < 0) {
		printf("File \"%s\" not found!\n",name);
		return;
	}
	pthread_mutex_lock(&inode_list);
	inode file_inode = inodes[index];
	pthread_mutex_unlock(&inode_list);
	char* data = malloc( (num_bytes / block_size + 1) * block_size); //not an exact ceil, but memory is cheap and floatng point ops are not
	int* indirect = malloc(block_size);
	int* double_indirect = malloc(block_size);
	if(!data || !indirect || !double_indirect){
		perror("Allocation for read_ssfs failed!: ");
		free(data);
		free(indirect);
		free(double_indirect);
		exit(-1);
	}
	int start_block_ind = start_byte/block_size; //The start byte is in the file's start_block_indth data block
	int curr_block_ind = start_block_ind;//keep track of which block we need to read from
	int end_block_ind = (start_byte + num_bytes)/block_size;
	for(; curr_block_ind < 12 && curr_block_ind <= end_block_ind; curr_block_ind++){
		request(file_inode.direct[curr_block_ind], data + curr_block_ind*block_size, 'r');
	}
	int ptrs_per_block = block_size/sizeof(block_ptr);

	if(curr_block_ind == 12){//the 0th through 11th blocks are direct blocks
		request(file_inode.indirect, indirect, 'r');
		for(; curr_block_ind < 12 + ptrs_per_block  && curr_block_ind <= end_block_ind; curr_block_ind++){
		request(indirect[curr_block_ind - 12], data + curr_block_ind*block_size, 'r');

		}
	}
	int indirect_end_block = 12 + ptrs_per_block;
	if(curr_block_ind == indirect_end_block) {
		request(file_inode.double_indirect, double_indirect, 'r');
		while(curr_block_ind < indirect_end_block + ptrs_per_block*ptrs_per_block){
			request(double_indirect[(curr_block_ind - indirect_end_block) / block_size], indirect, 'r');
			for(int i = 0; i < block_size; i++){
				request(indirect[(curr_block_ind - 12) % ptrs_per_block], data + curr_block_ind*block_size, 'r'); \
				curr_block_ind++;
			}
		}
	}
	write(1 ,data + start_byte, num_bytes);
	free(data);
	free(indirect);
}

void list(){
	pthread_mutex_lock(&inode_list);
	for(int i = 0; i < max_files; i++){
		if(inodes[i].size >= 0){
			printf("Name: %s Size: %d\n",inodes[i].name,inodes[i].size);
		}
	}
	pthread_mutex_unlock(&inode_list);
}

void shutdown(){

	/* STEPS:
	1. get inode map pointers
	2. for each file, check each pointer, to find the pointer that corresponds to that exact file
	3. if no inode exists with the same name, then create one
	4. store the data about the inode (which comes from memory) in that inode (on the disk)
	*/

	/*char fileBuffer[block_size];
	int i = 0;
	int bytesRead = read(unixFile, fileBuffer, block_size);
	while(bytesRead){

		//that way the location is updated based on how much input was taken
		//if it was a whole block it will add block_size
		//else it will just add the amount of bytes read
		write_ssfs(new_name, 'a', i*block_size, bytesRead, fileBuffer);
		i++;
		bytesRead = read(unixFile, fileBuffer, block_size);
	}*/

	char* inodelist = (char*) malloc(((1032/block_size)*block_size) + block_size);
	char* inodelist2 = (char*) malloc(block_size);
	char* actualInodeList = (char*) malloc(((1024/block_size)*block_size) + block_size);

	for(int m = 0; m < (1032/block_size) +1; m++){ //grab first block of inode pointers, and examine them to see if this certain inode is here
		request(m, inodelist2, 'r');
		strcat(inodelist, inodelist2);
	}

	strcpy(actualInodeList, inodelist+2);
	block_ptr** inodemap = (blockptr**) actualInodeList;

	//inodemap contains pointers to each inode

	for(int i = 0; i < 256; i++){	//for every file...
		if(inodes[i].size != -1){	//if the file exists (in memory)

			for(int j = 0; j < 256; j++){ 

				block_ptr currentInodeBlockPtr = *(inodemap[j]);

				char* currentInodeData = malloc(block_size); //grab one block of inode pointers at a time
				request(currentInodeBlockPtr, currentInodeData, 'r');
				inode currentInode = *((inode*) currentInodeData);

				if(currentInode.size != 0){ //if the block for the file exists on disk

					if(strcmp(inodes[i].name, currentInode.name) == 0){ //if the inode pointer matches the file that we're storing
						char* dataBuffer = malloc(block_size);				//store the data about the file
						
						char* ptr1 = malloc(32);
						ptr1 = &inodes[i].name[0];
						strcat(dataBuffer, ptr1);

						int* ptr2 = malloc(4);					
						for(int k = 0; k < 12; k++){
							*ptr2 = inodes[i].direct[k];
							strcat(dataBuffer, (char*)ptr2);
						}

						int* ptr3 = malloc(4);
						*ptr3 = inodes[i].indirect;

						int* ptr4 = malloc(4);
						*ptr4 = inodes[i].double_indirect;

						strcat(dataBuffer, (char*)ptr3);
						strcat(dataBuffer, (char*)ptr4);

						request(currentInodeBlockPtr, (void*) dataBuffer, 'w'); //write said data to the actual inode pointer on the disk
					}
				}

				else{ //if no block on the disk exists for the file, create one and save it and the file's data to the disk
					int freeblock = find_free_block();
					int free_block_num = freeblock / block_size;
					free_bitfield[free_block_num/8 + free_block_num % 8] = 1; //store in the free bit field that this block is in use	

					char* dataBuffer = malloc(block_size);				//store the data about the file
						
					char* ptr1 = malloc(32);
					ptr1 = &inodes[i].name[0];
					strcat(dataBuffer, ptr1);

					int* ptr2 = malloc(4);					
					for(int k = 0; k < 12; k++){
						*ptr2 = inodes[i].direct[k];
						strcat(dataBuffer, (char*)ptr2);
					}

					int* ptr3 = malloc(4);
					*ptr3 = inodes[i].indirect;

					int* ptr4 = malloc(4);
					*ptr4 = inodes[i].double_indirect;

					strcat(dataBuffer, (char*)ptr3);
					strcat(dataBuffer, (char*)ptr4);		
					
					request((block_ptr) freeblock, (void*) dataBuffer, 'w'); 
				}
			}
		}
	}

	char* buffer = (char*) malloc(block_size);
	block_ptr bitfieldcopy = (block_ptr) atoi(free_bitfield);
	for(int i = 0; i < num_blocks/8; i++){
		buffer = free_bitfield + i*block_size;
		bitfieldcopy += i*block_size;
		request(bitfieldcopy, buffer, 'w');

	}

	sleep(1);

	request(0, NULL, 's');
}
