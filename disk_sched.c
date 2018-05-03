#include <stdlib.h>
#include <pthread.h>
#include "common.h"

void take_request(){
	pthread_mutex_lock(&request_condition_mutex);
	while(num_requests <= 0) pthread_cond_wait(&request_fill, &request_condition_mutex);
		
		pthread_mutex_lock(&receive_request_mutex);

		next_consumed = buffer[next_to_do]; 
		next_to_do = (next_to_do + 1) % max_requests;
		num_requests--;
		if(num_requests +1 >= max_requests) pthread_cond_signal(&request_empty);

		pthread_mutex_unlock(&receive_request_mutex);

		if (next_consumed.read_write == 'w') write_request(next_consumed.requested, next_consumed.buffer);
		if (next_consumed.read_write == 'r') read_request(next_consumed.requested, next_consumed.buffer);

	//Peter's code here
	next_to_do = (next_to_do + 1) % max_requests;
	num_requests--; 
	pthread_cond_signal(&request_fill);
	pthread_mutex_unlock(&request_condition_mutex);
}

	

void write_request(block_ptr bp, void* buffer){
	lseek(disk_fd_sched, bp*block_size);
	write(disk_fd, buffer, block_size);
}

void read_request(block_ptr bp, void* buffer){
	lseek(disk_fd_sched, bp*block_size);
	read(disk_fd, buffer, block_size);
}