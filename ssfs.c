#include <stdlib.h>
#include <stdio.h>
#include <pthread.h>
#include <string.h>
#include "common.h"

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
  threadOps = fopen(threadName, "r");
  if(threadOps == NULL){
    perror("Error: Could not open threadOps file\n");
    exit(1);
  }

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
      char* writeFileName = strstr(lineBuff, " ");
      char* writeChar = strstr(writeFileName, " ");
      char* startByte = strstr(writeChar, " ");
      char* numBytes = strstr(startByte, " ");
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
      write_ssfs(writeFileName, writeChar, startByte, numBytes);


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
      read_ssfs(writeFileName, writeChar, startByte, numBytes);


    } else if(strcmp(lineBuff, "LIST") != 0){
      list();

    } else if(strcmp(lineBuff, "SHUTDOWN") != 0){
      shutdown();

    }

  }

}

int main(int argc, char** argv){

  char* thread1ops[100];
  char* thread2ops[100];
  char* thread3ops[100];
  char* thread4ops[100];

  string usage = "ssfs <disk file name> thread1ops.txt thread2ops.txt thread3ops.txt thread4ops.txt\n";

  if(argc > 6){
    printf("Too many arguments\n%s\n", usage);
    exit(1);
  } else if(argc < 2){
    printf("Missing arguments\n%s\n", usage);
    exit(1);
  }

  //store argv[1] as the disk file name
  string diskName = argv[1];
  if(argc >= 3){ //create one thread
    pthread_t opThread1;
    strcpy(thread1ops, argv[2]);
    pthread_create(&opThread1, NULL, &readThreadOps, (void*) thread1ops);
  }
  if(argc >= 4){ //create another thread
    pthread_t opThread2;
    strcpy(thread2ops, argv[3]);
    pthread_create(&opThread2, NULL, &readThreadOps, (void*) thread2ops);
  }
  if(argc >= 5){ //create another thread
    pthread_t opThread3;
    strcpy(thread3ops, argv[4]);
    pthread_create(&opThread3, NULL, &readThreadOps, (void*) thread3ops);
  }
  if(argc == 6){ //create another thread
    pthread_t opThread4;
    strcpy(thread4ops, argv[5]);
    pthread_create(&opThread4, NULL, &readThreadOps, (void*) thread4ops);
  }

  //Open file for reading and writing

  int diskFile = open(diskName);
	//make disk file if not there, read sizes//int test
	//if( read(diskFile, &num_blocks, 4) < 0){//file does not exist
	//	sts;

	read(diskFiles, &block_size, 4);
	free_bitfield = malloc(blocks/8);
	for(int i = 0; i < max_files; i++){
		inodes[i].size = -1;
	}


	read(diskFile, &free_bitfield,blocks/8);

  fclose(diskFile);
  return 0;
}
