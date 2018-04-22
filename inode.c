typedef struct inode{
	char* file_name;
	int file_size;
	int*[12] direct_block_pointers;
	int* indirect_block_pointer;
	int* double_indirect_block_pointer;
} inode;
