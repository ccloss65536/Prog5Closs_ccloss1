#include <stdlib.h>
#include <stdio.h>
#include <pthread.h>
#include <string.h>
#include "common.h"
#include <sys/types.h>
#include <sys/stat.h>
#include <unistd.h>
#include <fcntl.h>

//CREATE
// threadOps = fopen(threadName, "r");
// if(threadOps != NULL){
//   perror("Error: Could not create file because file already exists.\n");
//   exit(1);
// } else{
//   //CREATES file for reading and writing
//   threadOps = fopen(threadName, "w+");
//   if(threadOps == NULL){
//     perror("Error: Could not create file.\n");
//     exit(1);
//   }
// }

void* readThreadOps(void* threadName){
  FILE* threadOps;
  char lineBuff[1024];
  //string* operations = {"CREATE","IMPORT","CAT","DELETE","WRITE","READ","LIST","SHUTDOWN"};
  //converts the thread name to a string and opens it for reading
  char* nameOfThread = (char*) threadName;
  threadOps = fopen(nameOfThread, "r");
  if(threadOps == NULL){
    perror("Error: Could not open threadOps file\n");
    exit(1);
  }

  char writeFileName[32];
  char writeChar;
  int startByte;
  int numBytes;

  char commands[32];

  //after this point the file should be open

  //the function strstr finds a string within another string
  //gets a line from the the threadOps file we opened
  //fgets(lineBuff, sizeof(lineBuff), threadOps)
  while(fscanf(threadOps, "%s", commands)){
    //checks if the command is create
    if(strcmp(commands, "CREATE") == 0){
      //Get File Name, returns a pointer to right after the space
      //of the line buffer
      char newFileName[32];
      fscanf(threadOps, " %s", newFileName);
      //makes sure file does not exist
      //-1 when file does not exist
      if(find_file(newFileName) != -1){
        perror("Error: Could not create file because file already exists.\n");
        continue;
      }
      //if it reaches this point then the file is not on disk so create it


      //create() function from common.h found in disk_ops.c
      //should we lock before calling to the function?
      create(newFileName);

    } else if(strcmp(commands, "IMPORT") == 0){
      char importFileName[32];
      char unixFileName[32];

      fscanf(threadOps, " %s %s", importFileName, unixFileName);
      //now both variables contain what they should have

      //import() function from common.h found in disk_ops.c
      //should we lock before calling to the function?
      import(importFileName, unixFileName);


    } else if(strcmp(commands, "CAT") == 0){
      //gets name of the file
      char catFileName[32];
      fscanf(threadOps, " %s", catFileName);

      //cat() function from common.h found in disk_ops.c
      //should we lock before calling to the function?
      cat(catFileName);


    } else if(strcmp(commands, "DELETE") == 0){
      //gets name of file to delete
      char deleteFileName[32];
      fscanf(threadOps, " %s", deleteFileName);

      //erase() function from common.h found in disk_ops.c
      //should we lock before calling to the function?
      erase(deleteFileName);


    } else if(strcmp(commands, "WRITE") == 0){
      //changes the spaces for null terminators

      fscanf(threadOps, " %s %c %d %d", writeFileName, &writeChar, &startByte, &numBytes);

      //write_ssfs() function from common.h found in disk_ops.c
      //should we lock before calling to the function?
      write_ssfs(writeFileName, writeChar, startByte, numBytes, NULL);


    } else if(strcmp(commands, "READ") == 0){
      char readFileName[32];
      int startByte = -1;
      int numBytes = -1;

      //changes the spaces for null terminators
      fscanf(threadOps, " %s %d %d", readFileName, &startByte, &numBytes);

      //write_ssfs() function from common.h found in disk_ops.c
      //should we lock before calling to the function?
      read_ssfs(writeFileName, startByte, numBytes);


    } else if(strcmp(commands, "LIST") == 0){
      list();

    } else if(strcmp(commands, "SHUTDOWN") == 0){
      shutdown();
      fclose(threadOps);
      pthread_exit(0);

      //shut down after queue of requests is finished
      //exit this process


    }


  }

  fclose(threadOps);
  pthread_exit(0);


}

int main(int argc, char** argv){
	//initialize globals

	num_requests = 0;
	next_free_request = 0;
	next_to_do = 0;
	sem_init(&request_empty, 0, max_requests);
	sem_init(&request_full, 0, 0);
	sem_init(&request_condition_mutex, 0 , 2);
	pthread_mutex_init(&inode_list, NULL);
	pthread_mutex_init(&free_block_list, NULL);;
	pthread_mutex_init(&request_fufilled_mutex, NULL);
	pthread_mutex_init(&request_end_mutex, NULL);
	pthread_cond_init(&request_end, NULL);
	int p;
	for(p = 0; p < max_requests;p++){
		pthread_cond_init(&(request_fufilled[p]), NULL); 
		wakeup_arr[p] = 0;//PTHREAD_COND_INITIALIZER can only be used when declaring a variable
	}

  char thread1ops[256];
  char thread2ops[256];
  char thread3ops[256];
  char thread4ops[256];


  pthread_create(&schedThread, NULL, &runner, NULL);

  char* usage = "ssfs <disk file name> thread1ops.txt thread2ops.txt thread3ops.txt thread4ops.txt\n";

  if(argc > 6){
    printf("Too many arguments\n%s\n", usage);
    exit(1);
  } else if(argc < 2){
    printf("Missing arguments\n%s\n", usage);
    exit(1);
  }




  //store argv[1] as the disk file name
  char* diskName = argv[1];


  //Open file for reading and writing


  diskFile = open(diskName, O_RDWR);


	//make disk file if not there, read sizes//int test
	//if( read(diskFile, &num_blocks, 4) < 0){//file does not exist
	//	sts;

  read(diskFile, &num_blocks, 4);
	read(diskFile, &block_size, 4);
	for(int i = 0; i < max_files; i++){
      inodes[i].size = -1;
	}

	int q = 0;
	block_ptr block_num;
	for(;q < max_files; q++){
		read(diskFile, &block_num, 4);
		if(block_num > 0){
			lseek(diskFile, block_num * block_size, SEEK_SET);
			read(diskFile, &inodes[q], sizeof(inode));
		}
	}
	lseek(diskFile, 1032, SEEK_SET);
	free_bitfield = malloc(num_blocks/8 + 1);
	if(!free_bitfield){
		perror("Allocation for free block list failed! : ");
		return -1;
	}

	read(diskFile, free_bitfield,num_blocks/8);

	if(argc >= 3){ //create one thread
    strcpy(thread1ops, argv[2]);
    pthread_create(&opThread1, NULL, &readThreadOps, (void*) thread1ops);
  }
  if(argc >= 4){ //create another thread
    strcpy(thread2ops, argv[3]);
    pthread_create(&opThread2, NULL, &readThreadOps, (void*) thread2ops);
  }
  if(argc >= 5){ //create another thread
    strcpy(thread3ops, argv[4]);
    pthread_create(&opThread3, NULL, &readThreadOps, (void*) thread3ops);
  }
  if(argc == 6){ //create another thread
    strcpy(thread4ops, argv[5]);
    pthread_create(&opThread4, NULL, &readThreadOps, (void*) thread4ops);
  }
  close(diskFile);

  pthread_mutex_lock(&request_end_mutex);
  pthread_cond_wait(&request_end, &request_end_mutex);

  if(argc >= 3){
    pthread_cancel(opThread1);
    pthread_join(opThread1, NULL);
    if(argc >= 4){ //only join a thread if we created it earlier{
      pthread_cancel(opThread2);
    	pthread_join(opThread2, NULL);
    	if(argc>= 5){
        pthread_cancel(opThread3);
    		pthread_join(opThread3, NULL);
    		if(argc >= 6){
          pthread_cancel(opThread4);
    			pthread_join(opThread4, NULL);
    		}
    	}
    }
  } else{
    perror("Error: No threads have been requested\n");
    exit(1);
  }
  pthread_join(schedThread, NULL);
  printf("Successfully shutdown\n");
  return 0;
}
