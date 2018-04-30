#include <stdlib.h>
#include <pthread.h>
#include "common.h"


void startup(){
	int disk_fd = open(name, O_RDWR);
	lseek(disk_fd, 4);
	read(disk_fd, &block_size, 4);

	//TODO: load from disk...
	//TODO: initialize undefined inodes in the array, and set their sizes to -1 to indicate invalidity
}
int find_file(char* name){
	for(int i = 0; i < num_files; i++){
		if( strcmp(inodes[i].name, name) == 0) return i;
	}
	return -1;
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
	char* data = malloc( (num_bytes + 1) / block_size * block_size); //not an exacct ceil, but memory is cheap and floatng point ops are not
	int* indirect = malloc(block_size);
	if(!data || !indirect){
		perror("Allocation for read_ssfs failed!: ");
		exit(-1);
	}
	int start_block_ind = start_byte/block_size
	int curr_block_ind = start_block_ind
	int end_block_ind = (start_byte + num_bytes)/block_size
	for(; i < 12 && i <= end_block_ind; curr_block_ind++){
		request(inode.direct[i], data + i*block_size, 'r');
	}
	if(){
		//TODO: finish indirect
	}
	if(){
		//TODO: finish double indirect
	}	
}
void list(){
	}
void shutdown(){}


