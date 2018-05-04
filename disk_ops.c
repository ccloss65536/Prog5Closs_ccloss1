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
	pthread_mutex_lock(&request_condition_mutex);
	while(num_requests >= max_requests) pthread_cond_wait(&request_empty, &request_condition_mutex);
	num_requests++;

	int oldrequest = next_free_request;

	disk_request newRequest;
	newRequest.requested = block;
	newRequest.buffer = buffer;
	newRequest.read_write = read_write;

	pending[next_free_request] = newRequest;
	next_free_request = (next_free_request + 1) % max_requests;

	pthread_cond_signal(&request_fill);
	pthread_mutex_unlock(&request_condition_mutex);

	pthread_mutex_lock(&request_fufilled_mutex);
	pthread_cond_wait(&request_fufilled[oldrequest], &request_fufilled_mutex);
	pthread_mutex_unlock(&request_fufilled_mutex);

}


int find_free_block(){
	pthread_mutex_lock(&free_block_list);
	int i = 0;
	int free_block;
	for(; i < num_blocks/8; i++){
		if((free_bitfield[num_blocks/8] & (1 << (i % 8))) == 0){
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
		if( inodes[i].size >= 0 && strcmp(inodes[i].name, name) == 0) break; //strcmp rdeturns zero if the two strings are equal
	}
	if(i == max_files) i = -1; //If not found, return -1
	pthread_mutex_unlock(&inode_list);
	return i;
}

void create(char* name){
	pthread_mutex_lock(&inode_list);//another thread could be creating a file and editting the inode list

	inode newFileInode;
	strcpy(newFileInode.name, name);
	newFileInode.size = 0;

	if(num_files == max_files){
		printf("Error: max number of files reached\n");
		return;
	}

	for(int i =0; i < max_files; i++){
		if(inodes[i].size == -1){
			inodes[i] = newFileInode;
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
		perror("Allocation for read_ssfs failed!: ");
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
	free(indirect);
	free(double_indirect);
	inodes[index].size = -1;
}



void write_ssfs(char* name, char input, int start_byte, int num_bytes, char* buffer){

	int index = find_file(name);
	pthread_mutex_lock(&inode_list);
	if(index < 0 || start_byte >= inodes[index].size) {
		printf("File \"%s\" not found!\n",name);
		pthread_mutex_unlock(&inode_list);
		return;
	}

	char* data = (buffer)?buffer:malloc( (num_bytes + 1) / block_size * block_size);  //not an exact ceil, but memory is cheap and floatng point ops are not

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
		request(inodes[index].direct[i], data + curr_block_ind*block_size, 'r');
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
	char* data = malloc( (num_bytes + 1) / block_size * block_size); //not an exact ceil, but memory is cheap and floatng point ops are not
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
	request(0, NULL, 's');
}
