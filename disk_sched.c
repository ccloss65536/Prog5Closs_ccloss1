#include <stdlib.h>
#include <pthread.h>
#include "common.h"
#include <unistd.h>
#include <stdio.h>
#include <fcntl.h>

int take_request(){
	//sleep(1);
	//pthread_mutex_lock(&request_condition_mutex);
	//printf("Do we hold the lock? %d\n", num_requests);
	//while(num_requests <= 0) pthread_cond_wait(&request_fill, &request_condition_mutex);
	//printf("We escaped the wait\n");
	//printf("??????\n");
	//sleep(99999);
	sem_wait(&request_full);
	//printf("Is sched here?\n");
	sem_wait(&request_condition_mutex);
	disk_request next_consumed = pending[next_to_do];

	if (next_consumed.read_write == 's'){
		//sem_post(&request_condition_mutex);
		//sem_post(&request_empty);
		return 0; 
	}
	if (next_consumed.read_write == 'w') write_request(next_consumed.requested, next_consumed.buffer);
	if (next_consumed.read_write == 'r') read_request(next_consumed.requested, next_consumed.buffer);

	
	int oldnext = next_to_do;
	//printf("Out: %d\n", oldnext);
	next_to_do = (next_to_do + 1) % max_requests;

	sem_post(&request_condition_mutex);
	sem_post(&request_empty);
	//write(writeFd, &oldnext, sizeof(int));
	//pthread_cond_signal(&request_empty);
	pthread_mutex_lock(&request_fufilled_mutex);
	wakeup_arr[oldnext] = 1;
	pthread_cond_signal(&request_fufilled[oldnext]);
	pthread_mutex_unlock(&request_fufilled_mutex);
	return 1;
}

void write_request(block_ptr bp, void* buffer){
	if(bp >= num_blocks){
		fprintf( stderr, "AAAAAAA!!: Block %d from %p\n", bp, buffer);
		exit(1);
	}
	lseek(diskFile, bp*block_size, SEEK_SET);
	write(diskFile, buffer, block_size);
}

void read_request(block_ptr bp, void* buffer){
	if(bp >= num_blocks){
		fprintf( stderr, "AAAAAAA!!: Block %d into %p\n", bp, buffer);
		exit(1);
	}
	lseek(diskFile, bp*block_size, SEEK_SET);
	//printf("It goes here\n");
	read(diskFile, buffer, block_size);
}

void* runner(){
	while(take_request());
	pthread_mutex_lock(&request_end_mutex);
	pthread_cond_signal(&request_end);
	pthread_mutex_unlock(&request_end_mutex);
	pthread_exit(0);
}
