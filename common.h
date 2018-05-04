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
	block_ptr direct[12];
	block_ptr indirect;
	block_ptr double_indirect;
} inode;

//functions
void create(char* name);
void import(char* new_name, char* unix_name);
void cat(char* name);
void erase(char* name);
void write_ssfs(char* name, char input, int start_byte, int num_bytes, char* buffer);
void read_ssfs(char* name, int start_byte, int num_bytes);
void list();
void shutdown();
//not command functions
int find_file(char* name); //find the index of the inode of the file with the given name, or -1 if not found
void request(block_ptr block, void* buffer, char read_write); //put a disk schedule request into the buffer

int take_request();
void write_request();
void read_request();
void* runner();
void shutdown();




//global variables shared between threads
#define max_requests (30)
#define max_files (256)
int num_requests; //variables now nitialized in ssfs.c
int next_free_request;
int next_to_do;
disk_request pending[max_requests];
inode inodes[max_files];
int num_files;
int block_size;
int free_space;
pthread_cond_t request_empty;
pthread_cond_t request_fill; 
pthread_mutex_t request_condition_mutex;
pthread_mutex_t inode_list;
pthread_mutex_t free_block_list;
pthread_mutex_t request_fufilled_mutex;
pthread_cond_t request_fufilled[max_requests]; //one condition variable for each of the possible indexes. Each thread takes the variable corresponding to the index it inserted a request at. 
char* free_bitfield; //needs dynamic allocation, b/c its of variable size
int diskFile; //file descriptor
int writeFd;
int readFd;
int num_blocks;


//free block list type to come
