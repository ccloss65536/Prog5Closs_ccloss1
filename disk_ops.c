#include <stdlib.h>
#include <pthread.h>
#include "common.h"


void request(block_ptr block, char* buffer, char read_write){
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
	lseek(disk_fd, 4);
	read(disk_fd, &block_size, 4);

	//TODO: load from disk...
	//TODO: initialize undefined inodes in the array, and set their sizes to -1 to indicate invalidity...
	// or switch to linked list format if needed
}
int find_file(char* name){
	pthread_mutex_lock(&inode_list);
	int i;
	for(int i = 0; i < num_files; i++){
		if( strcmp(inodes[i].name, name) == 0) break;
	}
	if(i == num_files) i = -1;
	pthread_mutex_unlock(&inode_list);
	return i;
}
int create(char* name){
	}
int import(char* new_name, char* unix_name){}
void cat(char* name){
	int inode = find_file(name);
	if(inode < 0) {
		printf("File \"%s\" not found!\n",name);
		return;
	}
	read_ssfs(name, 0, inodes[inode].size);
}
void delete(char* name){}
int write_ssfs(char* name, char input, int start_byte, int num_bytes){}
void read_ssfs(char* name, int start_byte, int num_bytes){
	int inode = find_file(name);
	if(inode < 0) {
		printf("File \"%s\" not found!\n",name);
		return;
	}
	char* data = malloc( (num_bytes + 1) / block_size * block_size); //not an exact ceil, but memory is cheap and floatng point ops are not
	int* indirect = malloc(block_size);
	if(!data || !indirect){
		perror("Allocation for read_ssfs failed!: ");
		free(data);
		free(indirect);
		exit(-1);
	}
	int start_block_ind = start_byte/block_size
	int curr_block_ind = start_block_ind
	int end_block_ind = (start_byte + num_bytes)/block_size
	for(; curr_block_ind < 12 && curr_block_ind <= end_block_ind; curr_block_ind++){
		request(inode.direct[i], data + curr_block_ind*block_size, 'r');
	}
	if(curr_block_ind == 12){
		request(inode.indirect, indirect, 'r');
		int block;
			for(; curr_block_ind < 12 + block_size/sizeof(block_ptr)  && curr_block_ind <= end_block_ind; curr_block_ind++){ 
		request(indirect[curr_block_ind - 12], data + curr_block_ind*block_size, 'r');

	}
		//TODO: finish indirect
	}
	if(curr_block_ind == 12 + block_size/sizeof(block_ptr)){
		//TODO: finish double indirect
	}	
	write(stdout,data + start_byte, num_bytes);
	free(data);
	free(indirect);
}
void list(){
	}
void shutdown(){}

