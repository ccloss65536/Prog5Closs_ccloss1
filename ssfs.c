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

  char* writeFileName;
  char* writeChar;
  char* startByte;
  char* numBytes;

  //after this point the file should be open

  //the function strstr finds a string within another string
  //gets a line from the the threadOps file we opened
  while(fgets(lineBuff, sizeof(lineBuff), threadOps)){
    //checks if the command is create
    if(strstr(lineBuff, "CREATE") != NULL){
      //Get File Name, returns a pointer to right after the space
      //of the line buffer
      char* newFileName = strstr(lineBuff, " ");
      if(newFileName == NULL){
        //makes sure op was called properly formatted
        perror("Error: Wrong format for CREATE instruction\n");
        exit(1);
      }

      //makes sure file does not exist
      //-1 when file does not exist
      if(find_file(newFileName) != -1){
        perror("Error: Could not create file because file already exists.\n");
        exit(1);
      }
      //if it reaches this point then the file is not on disk so create it


      //create() function from common.h found in disk_ops.c
      //should we lock before calling to the function?
      create(newFileName);

    } else if(strstr(lineBuff, "IMPORT") != NULL){
      char* importFileName =  strstr(lineBuff, " ");
      char* unixFileName = strstr(importFileName, " ");

      if(importFileName == NULL || unixFileName == NULL){
        perror("Error: Wrong format for IMPORT instruction\n");
        exit(1);
      }

      //replaces space witha null terminator
      strncpy(unixFileName-1, "\0", 1);
      //now both variables contain what they should have

      //import() function from common.h found in disk_ops.c
      //should we lock before calling to the function?
      import(importFileName, unixFileName);


    } else if(strstr(lineBuff, "CAT") != NULL){
      //gets name of the file
      char* catFileName = strstr(lineBuff, " ");
      if(catFileName == NULL){
        perror("Error: Wrong format for CAT instruction\n");
        exit(1);
      }

      //cat() function from common.h found in disk_ops.c
      //should we lock before calling to the function?
      cat(catFileName);


    } else if(strstr(lineBuff, "DELETE") != NULL){
      //gets name of file to delete
      char* deleteFileName = strstr(lineBuff, " ");
      if(deleteFileName == NULL){
        perror("Error: Wrong format for DELETE instruction\n");
        exit(1);
      }

      //erase() function from common.h found in disk_ops.c
      //should we lock before calling to the function?
      erase(deleteFileName);


    } else if(strstr(lineBuff, "WRITE") != NULL){
      writeFileName = strstr(lineBuff, " ");
      writeChar = strstr(writeFileName, " ");
      startByte = strstr(writeChar, " ");
      numBytes = strstr(startByte, " ");
      //changes the spaces for null terminators

      if(writeFileName == NULL || writeChar == NULL || startByte == NULL || numBytes == NULL){
        perror("Error: Wrong format for WRITE instruction\n");
        exit(1);
      }

      strncpy(writeChar-1, "\0", 1);
      strncpy(startByte-1, "\0", 1);
      strncpy(numBytes-1, "\0", 1);

      //write_ssfs() function from common.h found in disk_ops.c
      //should we lock before calling to the function?
      write_ssfs(writeFileName, writeChar[0], atoi(startByte), atoi(numBytes), NULL);


    } else if(strstr(lineBuff, "READ") != NULL){
      char* readFileName = strstr(lineBuff, " ");
      char* startByte = strstr(readFileName, " ");
      char* numBytes = strstr(startByte, " ");

      if(readFileName == NULL || startByte == NULL || numBytes == NULL){
        perror("Error: Wrong format for READ instruction");
        exit(1);
      }

      //changes the spaces for null terminators
      strncpy(startByte-1, "\0", 1);
      strncpy(numBytes-1, "\0", 1);

      //write_ssfs() function from common.h found in disk_ops.c
      //should we lock before calling to the function?
      read_ssfs(writeFileName, atoi(startByte), atoi(numBytes));


    } else if(strcmp(lineBuff, "LIST") != 0){
      list();

    } else if(strcmp(lineBuff, "SHUTDOWN") != 0){
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
	pthread_cond_init(&request_empty, NULL);
	pthread_cond_init(&request_fill, NULL);
	pthread_mutex_init(&request_condition_mutex, NULL); 
	pthread_mutex_init(&inode_list, NULL);
	pthread_mutex_init(&free_block_list, NULL);;
	pthread_mutex_init(&request_fufilled_mutex, NULL);
	pthread_mutex_init(&request_end_mutex, NULL);
	pthread_cond_init(&request_end, NULL);
	int p;
	for(p = 0; p < max_requests;p++){
		pthread_cond_init(&(request_fufilled[p]), NULL); //PTHREAD_COND_INITIALIZER can only be used when declaring a variable
	}

  char thread1ops[256];
  char thread2ops[256];
  char thread3ops[256];
  char thread4ops[256];

  pthread_t opThread1;
  pthread_t opThread2;
  pthread_t opThread3;
  pthread_t opThread4;

  char* usage = "ssfs <disk file name> thread1ops.txt thread2ops.txt thread3ops.txt thread4ops.txt\n";

  if(argc > 6){
    printf("Too many arguments\n%s\n", usage);
    exit(1);
  } else if(argc < 2){
    printf("Missing arguments\n%s\n", usage);
    exit(1);
  }

  pthread_t schedThread;
  pthread_create(&schedThread, NULL, &runner, NULL);

  //store argv[1] as the disk file name
  char* diskName = argv[1];


  //Open file for reading and writing


  diskFile = open(diskName, O_RDWR);


	//make disk file if not there, read sizes//int test
	//if( read(diskFile, &num_blocks, 4) < 0){//file does not exist
	//	sts;

  read(diskFile, &num_blocks, 4);
	read(diskFile, &block_size, 4);
	free_bitfield = malloc(num_blocks/8);
	for(int i = 0; i < max_files; i++){
      inodes[i].size = -1;
	}

	int q = 0;
	block_ptr block_num;
	for(;q < max_files; q++){
		read(diskFile, &block_num, 4);
		if(block_num > 0){
			lseek(diskFile, block_num * block_size, SEEK_SET);
			read(diskFile, &inodes[q], 4);
		}
	}
	
	read(diskFile, &free_bitfield,num_blocks/8);

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
  pthread_join(schedThread, NULL);
  return 0;
}
