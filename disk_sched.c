#include <stdlib.h>
#include <pthread.h>
#include "common.h"
#include <unistd.h>
#include <stdio.h>
#include <fcntl.h>

void take_request(){
	pthread_mutex_lock(&request_condition_mutex);
	while(num_requests <= 0) pthread_cond_wait(&request_fill, &request_condition_mutex);

	disk_request next_consumed = pending[next_to_do]; 

	if (next_consumed.read_write == 'w') write_request(next_consumed.requested, next_consumed.buffer);
	if (next_consumed.read_write == 'r') read_request(next_consumed.requested, next_consumed.buffer);

	
	int oldnext = next_to_do;
	next_to_do = (next_to_do + 1) % max_requests;
	num_requests--; 
	write(writeFd, &oldnext, sizeof(int));
	pthread_cond_signal(&request_fill);
	pthread_mutex_unlock(&request_condition_mutex);
}

void write_request(block_ptr bp, void* buffer){
	lseek(diskFile, bp*block_size, SEEK_SET);
	write(diskFile, buffer, block_size);
}

void read_request(block_ptr bp, void* buffer){
	lseek(diskFile, bp*block_size, SEEK_SET);
	read(diskFile, buffer, block_size);
}

void* runner(){
	while() take_request();
	pthread_exit();
}
