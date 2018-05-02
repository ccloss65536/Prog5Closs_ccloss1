#include <stdlib.h>
#include <pthread.h>
#include "common.h"

void take_request(){
	pthread_mutex_lock(&request_condition_mutex);
	while(num_requests <= 0) pthread_cond_wait(&request_fill, &request_condition_mutex);
	//Peter's code here
	next_to_do = (next_to_do + 1) % max_requests;
	num_requests--; 
	pthread_cond_signal(&request_fill);
	pthread_mutex_unlock(&request_condition_mutex);
}


