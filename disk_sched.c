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
	sem_wait(&(empty[next_to_do]));
	
	disk_request next_consumed = pending[next_to_do];

	if (next_consumed.read_write == 's'){
		pthread_mutex_unlock(&request_condition_mutex);
		return 0; 
	}
	if (next_consumed.read_write == 'w') write_request(next_consumed.requested, next_consumed.buffer);
	if (next_consumed.read_write == 'r') read_request(next_consumed.requested, next_consumed.buffer);

	
	int oldnext = next_to_do;
	printf("Out: %d\n", oldnext);
	next_to_do = (next_to_do + 1) % max_requests;
	num_requests--; 
	sem_wait(&(full[oldnext]));
	//write(writeFd, &oldnext, sizeof(int));
	//pthread_cond_signal(&request_empty);
	pthread_cond_signal(&request_fufilled[oldnext]);
	pthread_mutex_unlock(&request_condition_mutex);
	return 1;
}

void write_request(block_ptr bp, void* buffer){
	lseek(diskFile, bp*block_size, SEEK_SET);
	write(diskFile, buffer, block_size);
}

void read_request(block_ptr bp, void* buffer){
	lseek(diskFile, bp*block_size, SEEK_SET);
	printf("It goes here\n");
	read(diskFile, buffer, block_size);
}

void* runner(){
	while(take_request());
	pthread_exit(0);
}
