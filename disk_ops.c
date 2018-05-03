#include <stdlib.h>
#include <pthread.h>
#include "common.h"


//Puts a request for the disk scheduler into the array
void request(block_ptr block, void* buffer, char read_write){
	pthread_mutex_lock(&request_condition_mutex);
	while(num_requests >= max_requests) pthread_cond_wait(&request_empty, &request_condition_mutex);
	num_requests++;
	pending[next_free_request] = {block, buffer, read_write};
	next_free_request = (next_free_request + 1) % max_requests;
	pthread_cond_signal(&request_fill);
	pthread_mutex_unlock(&request_condition_mutex);
}
void startup(){
	int disk_fd = open(name, O_RDWR);

	//TODO: load from disk...
	//TODO: initialize undefined inodes in the array, and set their sizes to -1 to indicate invalidity...
	// or switch to linked list format if needed
}
int find_file(char* name){
	pthread_mutex_lock(&inode_list);//We need to lock here because some thread could make a new file while we traverse the list
	int i;
	for(int i = 0; i < max_files; i++){
		if( inodes[i].size >= 0 && strcmp(inodes[i].name, name) == 0) break; //strcmp rdeturns zero if the two strings are equal
	}
	if(i == max_files) i = -1; //If not found, return -1
	pthread_mutex_unlock(&inode_list);
	return i;
}
int create(char* name){
	pthread_mutex_lock(&inode_list);//another thread could be creating a file and editting the inode list
	//fopen to write creates a new file
	inode newFileInode;
	strcpy(newFileInode.name, name);

	pthread_mutex_unlock(&inode_list);
}
int import(char* new_name, char* unix_name){}
void cat(char* name){
	int index = find_file(name)
	if(index < 0) {
		printf("File \"%s\" not found!\n",name);
		return;
	}
	read_ssfs(name, 0, inodes[inode].size);
}
void erase(char* name){}
int write_ssfs(char* name, char input, int start_byte, int num_bytes){}
void read_ssfs(char* name, int start_byte, int num_bytes){
	int index = find_file(name)
	if(index < 0) {
		printf("File \"%s\" not found!\n",name);
		return;
	}
	inode file_inode = inodes[index];
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
		request(file_inode.direct[i], data + curr_block_ind*block_size, 'r');
	}
	int ptrs_per_block = block_size/sizeof(block_ptr);

	if(curr_block_ind == 12){//the 0th through 11th blocks are direct blocks
		request(file_inode.indirect, indirect, 'r');
		block_ptr block;
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
				request(indirect[curr_block_ind - 12], data + curr_block_ind*block_size, 'r'); \
				curr_block_ind++;
			}
		}
	}
	write(stdout,data + start_byte, num_bytes);
	free(data);
	free(indirect);
}
void list(){
	}
void shutdown(){}
