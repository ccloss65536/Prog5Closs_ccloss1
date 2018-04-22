#include <stdlib.h>
#include <stdio.h>
#include "inode.c"

#include <unistd.h>
#include <sys/stat.h>
#include <fcntl.h>

const int MIN_BLOCK_SIZE = 128;
const int MAX_BLOCK_SIZE = 512;
const int MIN_BLOCKS = 1024;
const int MAX_BLOCKS = 128*1024;



int is_power2(int n){
	if(n == 0) return 0;
	while((n & 1) == 0){
		n >>= 1;
	}
	return n == 1;
}
int main(int argc, char** argv){
	if(argc != 4 && argc != 3){
		fprintf(stderr,"Usage: ssfs_mkdsk num_blocks block_size name(optional)\n");
		return 64;
	}
	int blocks = atoi(argv[1]);
	int block_size = atoi(argv[2]);
	char* name = argv[3]; //Do we need to support disk names with spaces?
	if(blocks < MIN_BLOCKS || blocks > MAX_BLOCKS || !is_power2(blocks)){
		fprintf(stderr, "num_blocks must be a power of 2 between %d and %d\n",MIN_BLOCKS,MAX_BLOCKS);
		return 64;
	}
	if(block_size < MIN_BLOCK_SIZE || block_size > MAX_BLOCK_SIZE || !is_power2(block_size)){
		fprintf(stderr, "block_size must be a power of 2 between %d and %d\n",MIN_BLOCK_SIZE, MAX_BLOCK_SIZE);
		return 64;
	}
	int total_size = blocks * block_size;
	if(!name) name = "DISK";
	//intialize free block list, block and block size data and inodes...
	
	int disk_fd = open(name,O_WRONLY | O_CREAT);
	// TODO: intialize free block list, block and block size data and inodes...
	for(int i = 0; i < (total_size - 0)/2; i++){ //write two at a time to go faster
		write(disk_fd,"\7\7",2);
	}
	return 0;
}


