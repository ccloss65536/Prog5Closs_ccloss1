#pragma once
#include <pthread.h>

//types
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

//functions
int create(char* name);
int import(char* new_name, char* unix_name);
void cat(char* name);
void erase(char* name);
int write_ssfs(char* name, char input, int start_byte, int num_bytes);
void read_ssfs(char* name, int start_byte, int num_bytes);
void list();
void shutdown();
//not command functions
int find_file(char* name); //find the index of the inode of the file with the given name, or -1 if not found
void request(block_ptr block, void* buffer, char_read_write); //put a disk schedule request into the buffer



//global variables shared between threads
const int max_requests = 30;
const int max_files = 256
int num_requests = 0;
int next_free_request = 0;
int next_to_do = 0;
disk_request pending[max_requests];
inode files[max_files];
int num_files = 0;
int block_size;
int free_space; 
pthread_cond_t request_empty = PTHREAD_COND_INITIALIZER;
pthread_cond_t request_fill = PTHREAD_COND_INITIALIZER;
pthread_mutex_t receive_request_mutex = PTHREAD_MUTEX_INITIALIZER;
pthread_mutex_t request_condition_mutex = PTHREAD_MUTEX_INITIALIZER;
pthread_mutex_t inode_list = PTHREAD_MUTEX_INITIALIZER;
char* free_bitfield; //needs dynamic allocation, b/c its of variable size
int diskFile; //file descriptor


//free block list type to come

