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
	//fprintf(stderr, "%d %p %c\n: ", block, buffer, read_write);
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
		//printf("%dth block, bits %d\n", i, free_bitfield[i/8]);
		if((free_bitfield[i/8] & (1 << (i % 8))) == 0){
			free_block = i;
			free_bitfield[i/8] |= (1 << (i % 8));
			break;
		}
	}
	if(i == num_blocks) free_block = -1;
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
	pthread_mutex_lock(&num_files_mut);
	if(num_files == max_files){
		printf("Error: max number of files reached\n");
		return;
	}
	pthread_mutex_unlock(&num_files_mut);

	//Moved to avoid holding the mutex and returning if there are 256 files
	pthread_mutex_lock(&inode_list);//another thread could be creating a file and editting the inode list

	for(int i =0; i < max_files; i++){
		if(inodes[i].size == -1){
			int freeb = find_free_block();
			inodes[i].direct[0] = freeb;
			strcpy(inodes[i].name, name);
			inodes[i].size = 0;
			//inodes[i].direct[0] = find_free_block(); //Make sure every file has some splace to write into, even if it's curretly empty
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
		return;
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
	pthread_mutex_lock(&inode_list);
	int index = find_file(name);
	if(index < 0) {
		printf("File \"%s\" not found!\n",name);
		pthread_mutex_lock(&inode_list);
		return;
	}

	//printf("File is of size: %d!!!!\n", inodes[index].size);
	read_ssfs(name, 0, inodes[index].size, NULL);
	pthread_mutex_unlock(&inode_list);
}
void erase(char* name){
	pthread_mutex_lock(&inode_list);
	int index = find_file(name);
	inode n;
	if(index > -1){

		n = inodes[index];
	} else {
			printf("File %s not found!\n",name);
			pthread_mutex_unlock(&inode_list);
			return;

	}
	pthread_mutex_unlock(&inode_list);

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
	pthread_mutex_lock(&inode_list);
	int index = find_file(name);
	if(index < 0 || start_byte > inodes[index].size) {


		printf("File \"%s\" not found or is smaller than start byte!\n",name);

		pthread_mutex_unlock(&inode_list);
		return;
	}
	//printf("%d\n, Why isn't this 4????", inodes[index].direct[0] + '0');

	char* data = (buffer)?buffer:malloc( (num_bytes / block_size + 1) * block_size);  //not an exact ceil, but memory is cheap and floatng point ops are not

	int i;
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
	int old_end_copy = old_end_block;
	int new_end_block = (start_byte + num_bytes) / block_size;
	for(;old_end_block <  new_end_block && old_end_block < 12; old_end_block++){
		if(inodes[index].direct[old_end_block + 1] < 0){
			inodes[index].direct[old_end_block + 1] = find_free_block();
		}
	}
	if(old_end_copy < 12 && new_end_block >= 12){
		//printf("Do we get an indirect block?\n");
		inodes[index].indirect = find_free_block();
		//exit(0);
	}
	if( (old_end_block >= 12) && (old_end_copy < 12 + ptrs_per_block) ){
		request(inodes[index].indirect, indirect, 'r'); //We need to keep the old data
		for(;old_end_block < new_end_block && old_end_block < 12 + ptrs_per_block;old_end_block++){
			indirect[old_end_block - 12] = find_free_block();
		}
		request(inodes[index].indirect, indirect, 'w');
	}

	//fprintf(stderr, "Single indirects complete!\n");
	if( (new_end_block >= 12 + ptrs_per_block) && (old_end_copy < 12  + ptrs_per_block) ){
		inodes[index].double_indirect = find_free_block();
	}
	if(old_end_block >= 12 + ptrs_per_block){
		fprintf(stderr, "Please go here!!!\n");
		request(inodes[index].double_indirect, double_indirect, 'r');
		int new_dbl_blk = (new_end_block - 12 - ptrs_per_block)/block_size;
		int old_dbl_blk = (old_end_block - 12 - ptrs_per_block)/block_size;
		int k = old_dbl_blk;
		for(;k < new_dbl_blk; k++){
			double_indirect[k] = find_free_block();
			fprintf(stderr, "%d is an indirect allocated block\n", double_indirect[k]);
		}
		request(inodes[index].double_indirect, double_indirect, 'w');
		while(old_dbl_blk < new_dbl_blk){
			int m;
			for(m = 0; m < ptrs_per_block && old_end_block < new_end_block; m++){
				old_end_block++;
				indirect[m] = find_free_block();
				fprintf(stderr, "%d is an direct allocated block\n", indirect[m]);
			}
			request(double_indirect[old_dbl_blk], indirect, 'w');
			old_dbl_blk++;
		}

	}
	if(!buffer){
		int g;
		read_ssfs(name, start_byte, num_bytes, data);
		for(g = 0; g < num_bytes; g++){
			data[g + start_byte] = input;
		}
	}
	int start_block_ind = start_byte/block_size; //The start byte is in the file's start_block_indth data block
	int curr_block_ind = start_block_ind;//keep track of which block we need to read from
	int end_block_ind = (start_byte + num_bytes)/block_size;

	for(; (curr_block_ind < 12) && (curr_block_ind <= end_block_ind); curr_block_ind++){
		request(inodes[index].direct[curr_block_ind], data + curr_block_ind*block_size, 'w');
	}

	if(curr_block_ind == 12){//the 0th through 11th blocks are direct blocks
		request(inodes[index].indirect, indirect, 'r');
		for(; curr_block_ind < 12 + ptrs_per_block  && curr_block_ind < end_block_ind; curr_block_ind++){
		request(indirect[curr_block_ind - 12], data + curr_block_ind*block_size, 'w');

		}
	}
	int indirect_end_block = 12 + ptrs_per_block;
	if(curr_block_ind == indirect_end_block) {
		request(inodes[index].double_indirect, double_indirect, 'r');
		while(curr_block_ind < indirect_end_block + ptrs_per_block*ptrs_per_block){
			request(double_indirect[(curr_block_ind - indirect_end_block) / block_size], indirect, 'r');
			for(i = 0; i < block_size; i++){
				//fprintf(stderr, "%d\n ", curr_block_ind - 12);
				request(indirect[curr_block_ind - 12], data + curr_block_ind*block_size, 'w'); \
				curr_block_ind++;
			}
		}
	}
	inodes[index].size = (start_byte + num_bytes < inodes[index].size)?inodes[index].size:( num_bytes + start_byte);
	pthread_mutex_unlock(&inode_list);

	//write(1 ,data + start_byte, num_bytes);
	free(data);
	free(indirect);

}
void read_ssfs(char* name, int start_byte, int num_bytes, char* buffer){
	pthread_mutex_lock(&inode_list);
	int index = find_file(name);
	if(index < 0) {
		printf("File \"%s\" not found!\n",name);
		return;
	}

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
	for(; curr_block_ind < 12 && curr_block_ind < end_block_ind; curr_block_ind++){
		request(file_inode.direct[curr_block_ind], data + curr_block_ind*block_size, 'r');
	}
	int ptrs_per_block = block_size/sizeof(block_ptr);

	if(curr_block_ind == 12){//the 0th through 11th blocks are direct blocks
		request(file_inode.indirect, indirect, 'r');
		for(; curr_block_ind < 12 + ptrs_per_block  && curr_block_ind < end_block_ind; curr_block_ind++){
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
	if (!buffer) write(1 ,data + start_byte, num_bytes);
	int j = 0;
	for(j = 0; buffer && j < (num_bytes / block_size + 1) * block_size; j++){
		buffer[j] = data[j];
	}
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
	1. get inode block pointers (1 per)
	2. for each inode, zero it out (including the indirect and double indirect pointers), then zero out free block list bit for that block
	3. for each file in the memory, create an inode and store the data there
	*/

	pthread_mutex_lock(&inode_list);
	pthread_mutex_lock(&free_block_list);

	char* zero = malloc(block_size);
	*zero = '0';

	block_ptr* inodelist = malloc(block_size);
	int bytes_read = 0;
	//number of bytes allocated before free bit list
	int bytes_end = 1032;
	int z = 0; //keep track of how many inodes so far
	for(int m = 0; m < ((1032 / block_size)); m++){
		request(m , inodelist, 'r');
		/*for(int f = 0; f < block_size/sizeof(block_ptr); f++){
			printf("Disk[%d] = %d\n",f,inodelist[f]);
		}*/
		block_ptr* currentNodePtr = inodelist;
		if(m == 0){
			currentNodePtr++;
			currentNodePtr++;
			bytes_read += 2*sizeof(block_ptr);
			for(unsigned int i = 0; i < (block_size/sizeof(block_ptr) - 2) && bytes_read < bytes_end; i++){
				if( (*currentNodePtr) > -1){
					free_bitfield[(*currentNodePtr)/8] &= ~(1 << ((*currentNodePtr) % 8)); //take the original pointer, translate that into the bit for the free block list, zero out that bit

				}
				inodelist[z + 2] = find_free_block();
				inode* buffer = (inode*) malloc(block_size);
				*buffer = inodes[z];
		//printf("Problem here?\n");
				request(inodelist[z + 2], (void*) buffer, 'w');
				free_bitfield[inodelist[z + 2] / 8] |= (1 << (inodelist[z + 2] % 8));
				currentNodePtr++;
				bytes_read += sizeof(block_ptr);
				z++;

			}
		} else{
			for(unsigned int i = 0; i < block_size/sizeof(block_ptr) && bytes_read < bytes_end; i++){
				//printf("%d %d@%p %p %p\n", i, (*currentNodePtr), currentNodePtr, inodelist, free_bitfield);
				if( (*currentNodePtr) > -1){
					free_bitfield[(*currentNodePtr)/8] &= ~(1 << ((*currentNodePtr) % 8)); //take the original pointer, translate that into the bit for the free block list, zero out that bit
				}
				inodelist[z % block_size/sizeof(block_ptr)] = find_free_block();
				inode* buffer = (inode*) malloc(block_size);
				*buffer = inodes[z];
		//printf("Problem here?\n");
				request(inodelist[z% block_size/sizeof(block_ptr)], (void*) buffer, 'w');
				free_bitfield[inodelist[z % block_size/sizeof(block_ptr)] / 8] |= (1 << (inodelist[z% block_size/sizeof(block_ptr)] % 8));
				z++;
				currentNodePtr++;
				bytes_read += sizeof(block_ptr);
			}
		}
		request(m,inodelist, 'w');
	}
	//printf("Do we even get here???????\n");
	//printf("How about here?\n");
	//write the new bitfield to disk
	char* buffer = (char*) malloc(block_size);
	block_ptr bitfield_start_block = 1032 / block_size;
	int bitfield_curr_byte = 1032;
	request(bitfield_start_block, buffer, 'r'); //get the entire block the bitfield starts at so we don't overwrite it with uninitialized data from buffer
	for(int i = 0; i < num_blocks/8; i++){
		//printf("%d oh no\n", i);
		buffer[bitfield_curr_byte % block_size] = free_bitfield[i];
		bitfield_curr_byte++;
		if( (bitfield_curr_byte % block_size == 0) || (i == num_blocks/8 -1)){
			//printf("Or here?\n");
			request(bitfield_start_block, buffer, 'w');
			bitfield_start_block++;
			request(bitfield_start_block, buffer, 'r');
		}
	}

	pthread_mutex_unlock(&free_block_list);
	pthread_mutex_unlock(&inode_list);

	//sleep(1);
	//printf("Are we requesting shutdown\n");
	request(0, NULL, 's');
}
