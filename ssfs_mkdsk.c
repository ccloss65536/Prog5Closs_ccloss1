#include <stdlib.h>
#include <stdio.h>
#include <math.h>

#include <unistd.h>
#include <sys/stat.h>
#include <fcntl.h>

const int MIN_BLOCK_SIZE = 128;
const int MAX_BLOCK_SIZE = 512;
const int MIN_BLOCKS = 1024;
const int MAX_BLOCKS = 128*1024;
const int MAX_NUM_FILES = 256;



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
	int disk_fd = open(name,O_WRONLY | O_CREAT);
	// TODO: intialize free block list, block and block size data and inodes...
	int sizes[] = {blocks, block_size};
	write(disk_fd, sizes, sizeof(sizes));
	int negone = -1;
	int zero = 0;
	int one = 1;
	int i;
	for(i = 0; i < 256; i++){
		write(disk_fd, &negone, 4);
	}
	for(i = 0; i < blocks/8; i++){
		double numBlocksInUse = ceil((1032 + blocks/8.0) / block_size);
		if(i < ((int)numBlocksInUse/8*8))
			write(disk_fd, &negone, 1);
		else if(i > (int)numBlocksInUse/8*8)
			write(disk_fd, &zero, 1);
		else{
			char partial = 0;
			char j = 0;
			for(;j < i % 8; j++) partial &= (1 << j);
			write(disk_fd, &partial, 1);
		}
	}

	for(i = 0; i < total_size - 8 - 1024 - blocks/8; i++){
				write(disk_fd,"\7",1);
	}

	return 0;
}
