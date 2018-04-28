#pragma once
#include <pthread.h>

typedef int block_ptr;
typedef struct{
	block_ptr requested;
	void* buffer;
	char read_write;
} disk_request;

/*typedef struct {
	char* ssfs_filename;
	char* unix_filename;
	int start_byte;
	int num_bytes;
	char repeat;
} thread_args; //argument struct for pthread_create
*/
typedef struct {
	char name[32];
	int size;
	block_ptr[12] direct;
	block_ptr indirect;
	block_ptr double_indirect;
} inode;


int create(char* name);
int import(char* new_name, char* unix_name);
void cat(char* name);
void erase(char* name);
int write_ssfs(char* name, char input, int start_byte, int num_bytes);
void read_ssfs(char* name, int start_byte, int num_bytes);
void list();
void shutdown();

disk_request pending[30];

