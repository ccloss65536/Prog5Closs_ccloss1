
ssfs.o:     file format elf64-x86-64


Disassembly of section .text:

0000000000000000 <readThreadOps>:
//     perror("Error: Could not create file.\n");
//     exit(1);
//   }
// }

void* readThreadOps(void* threadName){
   0:	55                   	push   %rbp
   1:	48 89 e5             	mov    %rsp,%rbp
   4:	48 81 ec c0 04 00 00 	sub    $0x4c0,%rsp
   b:	48 89 bd 48 fb ff ff 	mov    %rdi,-0x4b8(%rbp)
  FILE* threadOps;
  char lineBuff[1024];
  //string* operations = {"CREATE","IMPORT","CAT","DELETE","WRITE","READ","LIST","SHUTDOWN"};
  //converts the thread name to a string and opens it for reading
  char* nameOfThread = (char*) threadName;
  12:	48 8b 85 48 fb ff ff 	mov    -0x4b8(%rbp),%rax
  19:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  threadOps = fopen(nameOfThread, "r");
  1d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  21:	48 8d 35 00 00 00 00 	lea    0x0(%rip),%rsi        # 28 <readThreadOps+0x28>
  28:	48 89 c7             	mov    %rax,%rdi
  2b:	e8 00 00 00 00       	callq  30 <readThreadOps+0x30>
  30:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  if(threadOps == NULL){
  34:	48 83 7d f0 00       	cmpq   $0x0,-0x10(%rbp)
  39:	0f 85 e6 02 00 00    	jne    325 <readThreadOps+0x325>
    perror("Error: Could not open threadOps file\n");
  3f:	48 8d 3d 00 00 00 00 	lea    0x0(%rip),%rdi        # 46 <readThreadOps+0x46>
  46:	e8 00 00 00 00       	callq  4b <readThreadOps+0x4b>
    exit(1);
  4b:	bf 01 00 00 00       	mov    $0x1,%edi
  50:	e8 00 00 00 00       	callq  55 <readThreadOps+0x55>
  //the function strstr finds a string within another string
  //gets a line from the the threadOps file we opened
  //fgets(lineBuff, sizeof(lineBuff), threadOps)
  while(fscanf(threadOps, "%s", commands)){
    //checks if the command is create
    if(strcmp(commands, "CREATE") == 0){
  55:	48 8d 85 a0 fb ff ff 	lea    -0x460(%rbp),%rax
  5c:	48 8d 35 00 00 00 00 	lea    0x0(%rip),%rsi        # 63 <readThreadOps+0x63>
  63:	48 89 c7             	mov    %rax,%rdi
  66:	e8 00 00 00 00       	callq  6b <readThreadOps+0x6b>
  6b:	85 c0                	test   %eax,%eax
  6d:	75 5d                	jne    cc <readThreadOps+0xcc>
      //Get File Name, returns a pointer to right after the space
      //of the line buffer
      char newFileName[32];
      fscanf(threadOps, " %s", newFileName);
  6f:	48 8d 95 70 fb ff ff 	lea    -0x490(%rbp),%rdx
  76:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  7a:	48 8d 35 00 00 00 00 	lea    0x0(%rip),%rsi        # 81 <readThreadOps+0x81>
  81:	48 89 c7             	mov    %rax,%rdi
  84:	b8 00 00 00 00       	mov    $0x0,%eax
  89:	e8 00 00 00 00       	callq  8e <readThreadOps+0x8e>
      //makes sure file does not exist
      //-1 when file does not exist
      if(find_file(newFileName) != -1){
  8e:	48 8d 85 70 fb ff ff 	lea    -0x490(%rbp),%rax
  95:	48 89 c7             	mov    %rax,%rdi
  98:	e8 00 00 00 00       	callq  9d <readThreadOps+0x9d>
  9d:	83 f8 ff             	cmp    $0xffffffff,%eax
  a0:	74 16                	je     b8 <readThreadOps+0xb8>
        perror("Error: Could not create file because file already exists.\n");
  a2:	48 8d 3d 00 00 00 00 	lea    0x0(%rip),%rdi        # a9 <readThreadOps+0xa9>
  a9:	e8 00 00 00 00       	callq  ae <readThreadOps+0xae>
        exit(1);
  ae:	bf 01 00 00 00       	mov    $0x1,%edi
  b3:	e8 00 00 00 00       	callq  b8 <readThreadOps+0xb8>
      //if it reaches this point then the file is not on disk so create it


      //create() function from common.h found in disk_ops.c
      //should we lock before calling to the function?
      create(newFileName);
  b8:	48 8d 85 70 fb ff ff 	lea    -0x490(%rbp),%rax
  bf:	48 89 c7             	mov    %rax,%rdi
  c2:	e8 00 00 00 00       	callq  c7 <readThreadOps+0xc7>
  c7:	e9 59 02 00 00       	jmpq   325 <readThreadOps+0x325>

    } else if(strcmp(commands, "IMPORT") == 0){
  cc:	48 8d 85 a0 fb ff ff 	lea    -0x460(%rbp),%rax
  d3:	48 8d 35 00 00 00 00 	lea    0x0(%rip),%rsi        # da <readThreadOps+0xda>
  da:	48 89 c7             	mov    %rax,%rdi
  dd:	e8 00 00 00 00       	callq  e2 <readThreadOps+0xe2>
  e2:	85 c0                	test   %eax,%eax
  e4:	75 44                	jne    12a <readThreadOps+0x12a>
      char importFileName[32];
      char unixFileName[32];

      fscanf(threadOps, " %s %s", importFileName, unixFileName);
  e6:	48 8d 8d 70 fb ff ff 	lea    -0x490(%rbp),%rcx
  ed:	48 8d 95 50 fb ff ff 	lea    -0x4b0(%rbp),%rdx
  f4:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  f8:	48 8d 35 00 00 00 00 	lea    0x0(%rip),%rsi        # ff <readThreadOps+0xff>
  ff:	48 89 c7             	mov    %rax,%rdi
 102:	b8 00 00 00 00       	mov    $0x0,%eax
 107:	e8 00 00 00 00       	callq  10c <readThreadOps+0x10c>
      //now both variables contain what they should have

      //import() function from common.h found in disk_ops.c
      //should we lock before calling to the function?
      import(importFileName, unixFileName);
 10c:	48 8d 95 70 fb ff ff 	lea    -0x490(%rbp),%rdx
 113:	48 8d 85 50 fb ff ff 	lea    -0x4b0(%rbp),%rax
 11a:	48 89 d6             	mov    %rdx,%rsi
 11d:	48 89 c7             	mov    %rax,%rdi
 120:	e8 00 00 00 00       	callq  125 <readThreadOps+0x125>
 125:	e9 fb 01 00 00       	jmpq   325 <readThreadOps+0x325>


    } else if(strcmp(commands, "CAT") == 0){
 12a:	48 8d 85 a0 fb ff ff 	lea    -0x460(%rbp),%rax
 131:	48 8d 35 00 00 00 00 	lea    0x0(%rip),%rsi        # 138 <readThreadOps+0x138>
 138:	48 89 c7             	mov    %rax,%rdi
 13b:	e8 00 00 00 00       	callq  140 <readThreadOps+0x140>
 140:	85 c0                	test   %eax,%eax
 142:	75 33                	jne    177 <readThreadOps+0x177>
      //gets name of the file
      char catFileName[32];
      fscanf(threadOps, " %s", catFileName);
 144:	48 8d 95 70 fb ff ff 	lea    -0x490(%rbp),%rdx
 14b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
 14f:	48 8d 35 00 00 00 00 	lea    0x0(%rip),%rsi        # 156 <readThreadOps+0x156>
 156:	48 89 c7             	mov    %rax,%rdi
 159:	b8 00 00 00 00       	mov    $0x0,%eax
 15e:	e8 00 00 00 00       	callq  163 <readThreadOps+0x163>

      //cat() function from common.h found in disk_ops.c
      //should we lock before calling to the function?
      cat(catFileName);
 163:	48 8d 85 70 fb ff ff 	lea    -0x490(%rbp),%rax
 16a:	48 89 c7             	mov    %rax,%rdi
 16d:	e8 00 00 00 00       	callq  172 <readThreadOps+0x172>
 172:	e9 ae 01 00 00       	jmpq   325 <readThreadOps+0x325>


    } else if(strcmp(commands, "DELETE") == 0){
 177:	48 8d 85 a0 fb ff ff 	lea    -0x460(%rbp),%rax
 17e:	48 8d 35 00 00 00 00 	lea    0x0(%rip),%rsi        # 185 <readThreadOps+0x185>
 185:	48 89 c7             	mov    %rax,%rdi
 188:	e8 00 00 00 00       	callq  18d <readThreadOps+0x18d>
 18d:	85 c0                	test   %eax,%eax
 18f:	75 33                	jne    1c4 <readThreadOps+0x1c4>
      //gets name of file to delete
      char deleteFileName[32];
      fscanf(threadOps, " %s", deleteFileName);
 191:	48 8d 95 70 fb ff ff 	lea    -0x490(%rbp),%rdx
 198:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
 19c:	48 8d 35 00 00 00 00 	lea    0x0(%rip),%rsi        # 1a3 <readThreadOps+0x1a3>
 1a3:	48 89 c7             	mov    %rax,%rdi
 1a6:	b8 00 00 00 00       	mov    $0x0,%eax
 1ab:	e8 00 00 00 00       	callq  1b0 <readThreadOps+0x1b0>

      //erase() function from common.h found in disk_ops.c
      //should we lock before calling to the function?
      erase(deleteFileName);
 1b0:	48 8d 85 70 fb ff ff 	lea    -0x490(%rbp),%rax
 1b7:	48 89 c7             	mov    %rax,%rdi
 1ba:	e8 00 00 00 00       	callq  1bf <readThreadOps+0x1bf>
 1bf:	e9 61 01 00 00       	jmpq   325 <readThreadOps+0x325>


    } else if(strcmp(commands, "WRITE") == 0){
 1c4:	48 8d 85 a0 fb ff ff 	lea    -0x460(%rbp),%rax
 1cb:	48 8d 35 00 00 00 00 	lea    0x0(%rip),%rsi        # 1d2 <readThreadOps+0x1d2>
 1d2:	48 89 c7             	mov    %rax,%rdi
 1d5:	e8 00 00 00 00       	callq  1da <readThreadOps+0x1da>
 1da:	85 c0                	test   %eax,%eax
 1dc:	75 6a                	jne    248 <readThreadOps+0x248>
      //changes the spaces for null terminators

      fscanf(threadOps, " %s %c %d %d", writeFileName, &writeChar, &startByte, &numBytes);
 1de:	48 8d bd c4 fb ff ff 	lea    -0x43c(%rbp),%rdi
 1e5:	48 8d b5 c8 fb ff ff 	lea    -0x438(%rbp),%rsi
 1ec:	48 8d 8d cf fb ff ff 	lea    -0x431(%rbp),%rcx
 1f3:	48 8d 95 d0 fb ff ff 	lea    -0x430(%rbp),%rdx
 1fa:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
 1fe:	49 89 f9             	mov    %rdi,%r9
 201:	49 89 f0             	mov    %rsi,%r8
 204:	48 8d 35 00 00 00 00 	lea    0x0(%rip),%rsi        # 20b <readThreadOps+0x20b>
 20b:	48 89 c7             	mov    %rax,%rdi
 20e:	b8 00 00 00 00       	mov    $0x0,%eax
 213:	e8 00 00 00 00       	callq  218 <readThreadOps+0x218>

      //write_ssfs() function from common.h found in disk_ops.c
      //should we lock before calling to the function?
      write_ssfs(writeFileName, writeChar, startByte, numBytes, NULL);
 218:	8b 8d c4 fb ff ff    	mov    -0x43c(%rbp),%ecx
 21e:	8b 95 c8 fb ff ff    	mov    -0x438(%rbp),%edx
 224:	0f b6 85 cf fb ff ff 	movzbl -0x431(%rbp),%eax
 22b:	0f be f0             	movsbl %al,%esi
 22e:	48 8d 85 d0 fb ff ff 	lea    -0x430(%rbp),%rax
 235:	41 b8 00 00 00 00    	mov    $0x0,%r8d
 23b:	48 89 c7             	mov    %rax,%rdi
 23e:	e8 00 00 00 00       	callq  243 <readThreadOps+0x243>
 243:	e9 dd 00 00 00       	jmpq   325 <readThreadOps+0x325>


    } else if(strcmp(commands, "READ") == 0){
 248:	48 8d 85 a0 fb ff ff 	lea    -0x460(%rbp),%rax
 24f:	48 8d 35 00 00 00 00 	lea    0x0(%rip),%rsi        # 256 <readThreadOps+0x256>
 256:	48 89 c7             	mov    %rax,%rdi
 259:	e8 00 00 00 00       	callq  25e <readThreadOps+0x25e>
 25e:	85 c0                	test   %eax,%eax
 260:	75 63                	jne    2c5 <readThreadOps+0x2c5>
      char readFileName[32];
      int startByte = -1;
 262:	c7 85 9c fb ff ff ff 	movl   $0xffffffff,-0x464(%rbp)
 269:	ff ff ff 
      int numBytes = -1;
 26c:	c7 85 98 fb ff ff ff 	movl   $0xffffffff,-0x468(%rbp)
 273:	ff ff ff 

      //changes the spaces for null terminators
      fscanf(threadOps, " %s %d %d", readFileName, &startByte, &numBytes);
 276:	48 8d b5 98 fb ff ff 	lea    -0x468(%rbp),%rsi
 27d:	48 8d 8d 9c fb ff ff 	lea    -0x464(%rbp),%rcx
 284:	48 8d 95 70 fb ff ff 	lea    -0x490(%rbp),%rdx
 28b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
 28f:	49 89 f0             	mov    %rsi,%r8
 292:	48 8d 35 00 00 00 00 	lea    0x0(%rip),%rsi        # 299 <readThreadOps+0x299>
 299:	48 89 c7             	mov    %rax,%rdi
 29c:	b8 00 00 00 00       	mov    $0x0,%eax
 2a1:	e8 00 00 00 00       	callq  2a6 <readThreadOps+0x2a6>

      //write_ssfs() function from common.h found in disk_ops.c
      //should we lock before calling to the function?
      read_ssfs(writeFileName, startByte, numBytes);
 2a6:	8b 95 98 fb ff ff    	mov    -0x468(%rbp),%edx
 2ac:	8b 8d 9c fb ff ff    	mov    -0x464(%rbp),%ecx
 2b2:	48 8d 85 d0 fb ff ff 	lea    -0x430(%rbp),%rax
 2b9:	89 ce                	mov    %ecx,%esi
 2bb:	48 89 c7             	mov    %rax,%rdi
 2be:	e8 00 00 00 00       	callq  2c3 <readThreadOps+0x2c3>
 2c3:	eb 60                	jmp    325 <readThreadOps+0x325>


    } else if(strcmp(commands, "LIST") == 0){
 2c5:	48 8d 85 a0 fb ff ff 	lea    -0x460(%rbp),%rax
 2cc:	48 8d 35 00 00 00 00 	lea    0x0(%rip),%rsi        # 2d3 <readThreadOps+0x2d3>
 2d3:	48 89 c7             	mov    %rax,%rdi
 2d6:	e8 00 00 00 00       	callq  2db <readThreadOps+0x2db>
 2db:	85 c0                	test   %eax,%eax
 2dd:	75 0c                	jne    2eb <readThreadOps+0x2eb>
      list();
 2df:	b8 00 00 00 00       	mov    $0x0,%eax
 2e4:	e8 00 00 00 00       	callq  2e9 <readThreadOps+0x2e9>
 2e9:	eb 3a                	jmp    325 <readThreadOps+0x325>

    } else if(strcmp(lineBuff, "SHUTDOWN") != 0){
 2eb:	48 8d 85 f0 fb ff ff 	lea    -0x410(%rbp),%rax
 2f2:	48 8d 35 00 00 00 00 	lea    0x0(%rip),%rsi        # 2f9 <readThreadOps+0x2f9>
 2f9:	48 89 c7             	mov    %rax,%rdi
 2fc:	e8 00 00 00 00       	callq  301 <readThreadOps+0x301>
 301:	85 c0                	test   %eax,%eax
 303:	74 20                	je     325 <readThreadOps+0x325>
      shutdown();
 305:	b8 00 00 00 00       	mov    $0x0,%eax
 30a:	e8 00 00 00 00       	callq  30f <readThreadOps+0x30f>
      fclose(threadOps);
 30f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
 313:	48 89 c7             	mov    %rax,%rdi
 316:	e8 00 00 00 00       	callq  31b <readThreadOps+0x31b>
      pthread_exit(0);
 31b:	bf 00 00 00 00       	mov    $0x0,%edi
 320:	e8 00 00 00 00       	callq  325 <readThreadOps+0x325>
  while(fscanf(threadOps, "%s", commands)){
 325:	48 8d 95 a0 fb ff ff 	lea    -0x460(%rbp),%rdx
 32c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
 330:	48 8d 35 00 00 00 00 	lea    0x0(%rip),%rsi        # 337 <readThreadOps+0x337>
 337:	48 89 c7             	mov    %rax,%rdi
 33a:	b8 00 00 00 00       	mov    $0x0,%eax
 33f:	e8 00 00 00 00       	callq  344 <readThreadOps+0x344>
 344:	85 c0                	test   %eax,%eax
 346:	0f 85 09 fd ff ff    	jne    55 <readThreadOps+0x55>
    }


  }

  fclose(threadOps);
 34c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
 350:	48 89 c7             	mov    %rax,%rdi
 353:	e8 00 00 00 00       	callq  358 <readThreadOps+0x358>
  pthread_exit(0);
 358:	bf 00 00 00 00       	mov    $0x0,%edi
 35d:	e8 00 00 00 00       	callq  362 <main>

0000000000000362 <main>:


}

int main(int argc, char** argv){
 362:	55                   	push   %rbp
 363:	48 89 e5             	mov    %rsp,%rbp
 366:	48 81 ec 40 04 00 00 	sub    $0x440,%rsp
 36d:	89 bd cc fb ff ff    	mov    %edi,-0x434(%rbp)
 373:	48 89 b5 c0 fb ff ff 	mov    %rsi,-0x440(%rbp)
	//initialize globals

	num_requests = 0;
 37a:	c7 05 00 00 00 00 00 	movl   $0x0,0x0(%rip)        # 384 <main+0x22>
 381:	00 00 00 
	next_free_request = 0;
 384:	c7 05 00 00 00 00 00 	movl   $0x0,0x0(%rip)        # 38e <main+0x2c>
 38b:	00 00 00 
	next_to_do = 0;
 38e:	c7 05 00 00 00 00 00 	movl   $0x0,0x0(%rip)        # 398 <main+0x36>
 395:	00 00 00 
	sem_init(&request_empty, 0, max_requests);
 398:	ba 1e 00 00 00       	mov    $0x1e,%edx
 39d:	be 00 00 00 00       	mov    $0x0,%esi
 3a2:	48 8d 3d 00 00 00 00 	lea    0x0(%rip),%rdi        # 3a9 <main+0x47>
 3a9:	e8 00 00 00 00       	callq  3ae <main+0x4c>
	sem_init(&request_full, 0, 0);
 3ae:	ba 00 00 00 00       	mov    $0x0,%edx
 3b3:	be 00 00 00 00       	mov    $0x0,%esi
 3b8:	48 8d 3d 00 00 00 00 	lea    0x0(%rip),%rdi        # 3bf <main+0x5d>
 3bf:	e8 00 00 00 00       	callq  3c4 <main+0x62>
	sem_init(&request_condition_mutex, 0 , 2);
 3c4:	ba 02 00 00 00       	mov    $0x2,%edx
 3c9:	be 00 00 00 00       	mov    $0x0,%esi
 3ce:	48 8d 3d 00 00 00 00 	lea    0x0(%rip),%rdi        # 3d5 <main+0x73>
 3d5:	e8 00 00 00 00       	callq  3da <main+0x78>
	pthread_mutex_init(&inode_list, NULL);
 3da:	be 00 00 00 00       	mov    $0x0,%esi
 3df:	48 8d 3d 00 00 00 00 	lea    0x0(%rip),%rdi        # 3e6 <main+0x84>
 3e6:	e8 00 00 00 00       	callq  3eb <main+0x89>
	pthread_mutex_init(&free_block_list, NULL);;
 3eb:	be 00 00 00 00       	mov    $0x0,%esi
 3f0:	48 8d 3d 00 00 00 00 	lea    0x0(%rip),%rdi        # 3f7 <main+0x95>
 3f7:	e8 00 00 00 00       	callq  3fc <main+0x9a>
	pthread_mutex_init(&request_fufilled_mutex, NULL);
 3fc:	be 00 00 00 00       	mov    $0x0,%esi
 401:	48 8d 3d 00 00 00 00 	lea    0x0(%rip),%rdi        # 408 <main+0xa6>
 408:	e8 00 00 00 00       	callq  40d <main+0xab>
	pthread_mutex_init(&request_end_mutex, NULL);
 40d:	be 00 00 00 00       	mov    $0x0,%esi
 412:	48 8d 3d 00 00 00 00 	lea    0x0(%rip),%rdi        # 419 <main+0xb7>
 419:	e8 00 00 00 00       	callq  41e <main+0xbc>
	pthread_cond_init(&request_end, NULL);
 41e:	be 00 00 00 00       	mov    $0x0,%esi
 423:	48 8d 3d 00 00 00 00 	lea    0x0(%rip),%rdi        # 42a <main+0xc8>
 42a:	e8 00 00 00 00       	callq  42f <main+0xcd>
	int p;
	for(p = 0; p < max_requests;p++){
 42f:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
 436:	eb 3f                	jmp    477 <main+0x115>
		pthread_cond_init(&(request_fufilled[p]), NULL); 
 438:	8b 45 fc             	mov    -0x4(%rbp),%eax
 43b:	48 63 d0             	movslq %eax,%rdx
 43e:	48 89 d0             	mov    %rdx,%rax
 441:	48 01 c0             	add    %rax,%rax
 444:	48 01 d0             	add    %rdx,%rax
 447:	48 c1 e0 04          	shl    $0x4,%rax
 44b:	48 8d 15 00 00 00 00 	lea    0x0(%rip),%rdx        # 452 <main+0xf0>
 452:	48 01 d0             	add    %rdx,%rax
 455:	be 00 00 00 00       	mov    $0x0,%esi
 45a:	48 89 c7             	mov    %rax,%rdi
 45d:	e8 00 00 00 00       	callq  462 <main+0x100>
		wakeup_arr[p] = 0;//PTHREAD_COND_INITIALIZER can only be used when declaring a variable
 462:	8b 45 fc             	mov    -0x4(%rbp),%eax
 465:	48 63 d0             	movslq %eax,%rdx
 468:	48 8d 05 00 00 00 00 	lea    0x0(%rip),%rax        # 46f <main+0x10d>
 46f:	c6 04 02 00          	movb   $0x0,(%rdx,%rax,1)
	for(p = 0; p < max_requests;p++){
 473:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
 477:	83 7d fc 1d          	cmpl   $0x1d,-0x4(%rbp)
 47b:	7e bb                	jle    438 <main+0xd6>
  char thread1ops[256];
  char thread2ops[256];
  char thread3ops[256];
  char thread4ops[256];

  pthread_create(&schedThread, NULL, &runner, NULL);
 47d:	b9 00 00 00 00       	mov    $0x0,%ecx
 482:	48 8b 05 00 00 00 00 	mov    0x0(%rip),%rax        # 489 <main+0x127>
 489:	48 89 c2             	mov    %rax,%rdx
 48c:	be 00 00 00 00       	mov    $0x0,%esi
 491:	48 8d 3d 00 00 00 00 	lea    0x0(%rip),%rdi        # 498 <main+0x136>
 498:	e8 00 00 00 00       	callq  49d <main+0x13b>

  char* usage = "ssfs <disk file name> thread1ops.txt thread2ops.txt thread3ops.txt thread4ops.txt\n";
 49d:	48 8d 05 00 00 00 00 	lea    0x0(%rip),%rax        # 4a4 <main+0x142>
 4a4:	48 89 45 e8          	mov    %rax,-0x18(%rbp)

  if(argc > 6){
 4a8:	83 bd cc fb ff ff 06 	cmpl   $0x6,-0x434(%rbp)
 4af:	7e 22                	jle    4d3 <main+0x171>
    printf("Too many arguments\n%s\n", usage);
 4b1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 4b5:	48 89 c6             	mov    %rax,%rsi
 4b8:	48 8d 3d 00 00 00 00 	lea    0x0(%rip),%rdi        # 4bf <main+0x15d>
 4bf:	b8 00 00 00 00       	mov    $0x0,%eax
 4c4:	e8 00 00 00 00       	callq  4c9 <main+0x167>
    exit(1);
 4c9:	bf 01 00 00 00       	mov    $0x1,%edi
 4ce:	e8 00 00 00 00       	callq  4d3 <main+0x171>
  } else if(argc < 2){
 4d3:	83 bd cc fb ff ff 01 	cmpl   $0x1,-0x434(%rbp)
 4da:	7f 22                	jg     4fe <main+0x19c>
    printf("Missing arguments\n%s\n", usage);
 4dc:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 4e0:	48 89 c6             	mov    %rax,%rsi
 4e3:	48 8d 3d 00 00 00 00 	lea    0x0(%rip),%rdi        # 4ea <main+0x188>
 4ea:	b8 00 00 00 00       	mov    $0x0,%eax
 4ef:	e8 00 00 00 00       	callq  4f4 <main+0x192>
    exit(1);
 4f4:	bf 01 00 00 00       	mov    $0x1,%edi
 4f9:	e8 00 00 00 00       	callq  4fe <main+0x19c>




  //store argv[1] as the disk file name
  char* diskName = argv[1];
 4fe:	48 8b 85 c0 fb ff ff 	mov    -0x440(%rbp),%rax
 505:	48 8b 40 08          	mov    0x8(%rax),%rax
 509:	48 89 45 e0          	mov    %rax,-0x20(%rbp)


  //Open file for reading and writing


  diskFile = open(diskName, O_RDWR);
 50d:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
 511:	be 02 00 00 00       	mov    $0x2,%esi
 516:	48 89 c7             	mov    %rax,%rdi
 519:	b8 00 00 00 00       	mov    $0x0,%eax
 51e:	e8 00 00 00 00       	callq  523 <main+0x1c1>
 523:	89 05 00 00 00 00    	mov    %eax,0x0(%rip)        # 529 <main+0x1c7>

	//make disk file if not there, read sizes//int test
	//if( read(diskFile, &num_blocks, 4) < 0){//file does not exist
	//	sts;

  read(diskFile, &num_blocks, 4);
 529:	8b 05 00 00 00 00    	mov    0x0(%rip),%eax        # 52f <main+0x1cd>
 52f:	ba 04 00 00 00       	mov    $0x4,%edx
 534:	48 8d 35 00 00 00 00 	lea    0x0(%rip),%rsi        # 53b <main+0x1d9>
 53b:	89 c7                	mov    %eax,%edi
 53d:	e8 00 00 00 00       	callq  542 <main+0x1e0>
	read(diskFile, &block_size, 4);
 542:	8b 05 00 00 00 00    	mov    0x0(%rip),%eax        # 548 <main+0x1e6>
 548:	ba 04 00 00 00       	mov    $0x4,%edx
 54d:	48 8d 35 00 00 00 00 	lea    0x0(%rip),%rsi        # 554 <main+0x1f2>
 554:	89 c7                	mov    %eax,%edi
 556:	e8 00 00 00 00       	callq  55b <main+0x1f9>
	free_bitfield = malloc(num_blocks/8);
 55b:	8b 05 00 00 00 00    	mov    0x0(%rip),%eax        # 561 <main+0x1ff>
 561:	8d 50 07             	lea    0x7(%rax),%edx
 564:	85 c0                	test   %eax,%eax
 566:	0f 48 c2             	cmovs  %edx,%eax
 569:	c1 f8 03             	sar    $0x3,%eax
 56c:	48 98                	cltq   
 56e:	48 89 c7             	mov    %rax,%rdi
 571:	e8 00 00 00 00       	callq  576 <main+0x214>
 576:	48 89 05 00 00 00 00 	mov    %rax,0x0(%rip)        # 57d <main+0x21b>
	for(int i = 0; i < max_files; i++){
 57d:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%rbp)
 584:	eb 1b                	jmp    5a1 <main+0x23f>
      inodes[i].size = -1;
 586:	8b 45 f8             	mov    -0x8(%rbp),%eax
 589:	48 98                	cltq   
 58b:	48 6b d0 5c          	imul   $0x5c,%rax,%rdx
 58f:	48 8d 05 00 00 00 00 	lea    0x0(%rip),%rax        # 596 <main+0x234>
 596:	c7 04 02 ff ff ff ff 	movl   $0xffffffff,(%rdx,%rax,1)
	for(int i = 0; i < max_files; i++){
 59d:	83 45 f8 01          	addl   $0x1,-0x8(%rbp)
 5a1:	81 7d f8 ff 00 00 00 	cmpl   $0xff,-0x8(%rbp)
 5a8:	7e dc                	jle    586 <main+0x224>
	}

	int q = 0;
 5aa:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)
	block_ptr block_num;
	for(;q < max_files; q++){
 5b1:	eb 7a                	jmp    62d <main+0x2cb>
		read(diskFile, &block_num, 4);
 5b3:	8b 05 00 00 00 00    	mov    0x0(%rip),%eax        # 5b9 <main+0x257>
 5b9:	48 8d 8d dc fb ff ff 	lea    -0x424(%rbp),%rcx
 5c0:	ba 04 00 00 00       	mov    $0x4,%edx
 5c5:	48 89 ce             	mov    %rcx,%rsi
 5c8:	89 c7                	mov    %eax,%edi
 5ca:	e8 00 00 00 00       	callq  5cf <main+0x26d>
		if(block_num > 0){
 5cf:	8b 85 dc fb ff ff    	mov    -0x424(%rbp),%eax
 5d5:	85 c0                	test   %eax,%eax
 5d7:	7e 50                	jle    629 <main+0x2c7>
			lseek(diskFile, block_num * block_size, SEEK_SET);
 5d9:	8b 95 dc fb ff ff    	mov    -0x424(%rbp),%edx
 5df:	8b 05 00 00 00 00    	mov    0x0(%rip),%eax        # 5e5 <main+0x283>
 5e5:	0f af c2             	imul   %edx,%eax
 5e8:	48 63 c8             	movslq %eax,%rcx
 5eb:	8b 05 00 00 00 00    	mov    0x0(%rip),%eax        # 5f1 <main+0x28f>
 5f1:	ba 00 00 00 00       	mov    $0x0,%edx
 5f6:	48 89 ce             	mov    %rcx,%rsi
 5f9:	89 c7                	mov    %eax,%edi
 5fb:	e8 00 00 00 00       	callq  600 <main+0x29e>
			read(diskFile, &inodes[q], sizeof(inode));
 600:	8b 45 f4             	mov    -0xc(%rbp),%eax
 603:	48 98                	cltq   
 605:	48 6b d0 5c          	imul   $0x5c,%rax,%rdx
 609:	48 8d 05 00 00 00 00 	lea    0x0(%rip),%rax        # 610 <main+0x2ae>
 610:	48 8d 0c 02          	lea    (%rdx,%rax,1),%rcx
 614:	8b 05 00 00 00 00    	mov    0x0(%rip),%eax        # 61a <main+0x2b8>
 61a:	ba 5c 00 00 00       	mov    $0x5c,%edx
 61f:	48 89 ce             	mov    %rcx,%rsi
 622:	89 c7                	mov    %eax,%edi
 624:	e8 00 00 00 00       	callq  629 <main+0x2c7>
	for(;q < max_files; q++){
 629:	83 45 f4 01          	addl   $0x1,-0xc(%rbp)
 62d:	81 7d f4 ff 00 00 00 	cmpl   $0xff,-0xc(%rbp)
 634:	0f 8e 79 ff ff ff    	jle    5b3 <main+0x251>
		}
	}
	lseek(diskFile, 1032, SEEK_SET);
 63a:	8b 05 00 00 00 00    	mov    0x0(%rip),%eax        # 640 <main+0x2de>
 640:	ba 00 00 00 00       	mov    $0x0,%edx
 645:	be 08 04 00 00       	mov    $0x408,%esi
 64a:	89 c7                	mov    %eax,%edi
 64c:	e8 00 00 00 00       	callq  651 <main+0x2ef>
	read(diskFile, free_bitfield,num_blocks/8);
 651:	8b 05 00 00 00 00    	mov    0x0(%rip),%eax        # 657 <main+0x2f5>
 657:	8d 50 07             	lea    0x7(%rax),%edx
 65a:	85 c0                	test   %eax,%eax
 65c:	0f 48 c2             	cmovs  %edx,%eax
 65f:	c1 f8 03             	sar    $0x3,%eax
 662:	48 63 d0             	movslq %eax,%rdx
 665:	48 8b 0d 00 00 00 00 	mov    0x0(%rip),%rcx        # 66c <main+0x30a>
 66c:	8b 05 00 00 00 00    	mov    0x0(%rip),%eax        # 672 <main+0x310>
 672:	48 89 ce             	mov    %rcx,%rsi
 675:	89 c7                	mov    %eax,%edi
 677:	e8 00 00 00 00       	callq  67c <main+0x31a>

	if(argc >= 3){ //create one thread
 67c:	83 bd cc fb ff ff 02 	cmpl   $0x2,-0x434(%rbp)
 683:	7e 42                	jle    6c7 <main+0x365>
    strcpy(thread1ops, argv[2]);
 685:	48 8b 85 c0 fb ff ff 	mov    -0x440(%rbp),%rax
 68c:	48 83 c0 10          	add    $0x10,%rax
 690:	48 8b 10             	mov    (%rax),%rdx
 693:	48 8d 85 e0 fe ff ff 	lea    -0x120(%rbp),%rax
 69a:	48 89 d6             	mov    %rdx,%rsi
 69d:	48 89 c7             	mov    %rax,%rdi
 6a0:	e8 00 00 00 00       	callq  6a5 <main+0x343>
    pthread_create(&opThread1, NULL, &readThreadOps, (void*) thread1ops);
 6a5:	48 8d 85 e0 fe ff ff 	lea    -0x120(%rbp),%rax
 6ac:	48 89 c1             	mov    %rax,%rcx
 6af:	48 8d 15 00 00 00 00 	lea    0x0(%rip),%rdx        # 6b6 <main+0x354>
 6b6:	be 00 00 00 00       	mov    $0x0,%esi
 6bb:	48 8d 3d 00 00 00 00 	lea    0x0(%rip),%rdi        # 6c2 <main+0x360>
 6c2:	e8 00 00 00 00       	callq  6c7 <main+0x365>
  }
  if(argc >= 4){ //create another thread
 6c7:	83 bd cc fb ff ff 03 	cmpl   $0x3,-0x434(%rbp)
 6ce:	7e 42                	jle    712 <main+0x3b0>
    strcpy(thread2ops, argv[3]);
 6d0:	48 8b 85 c0 fb ff ff 	mov    -0x440(%rbp),%rax
 6d7:	48 83 c0 18          	add    $0x18,%rax
 6db:	48 8b 10             	mov    (%rax),%rdx
 6de:	48 8d 85 e0 fd ff ff 	lea    -0x220(%rbp),%rax
 6e5:	48 89 d6             	mov    %rdx,%rsi
 6e8:	48 89 c7             	mov    %rax,%rdi
 6eb:	e8 00 00 00 00       	callq  6f0 <main+0x38e>
    pthread_create(&opThread2, NULL, &readThreadOps, (void*) thread2ops);
 6f0:	48 8d 85 e0 fd ff ff 	lea    -0x220(%rbp),%rax
 6f7:	48 89 c1             	mov    %rax,%rcx
 6fa:	48 8d 15 00 00 00 00 	lea    0x0(%rip),%rdx        # 701 <main+0x39f>
 701:	be 00 00 00 00       	mov    $0x0,%esi
 706:	48 8d 3d 00 00 00 00 	lea    0x0(%rip),%rdi        # 70d <main+0x3ab>
 70d:	e8 00 00 00 00       	callq  712 <main+0x3b0>
  }
  if(argc >= 5){ //create another thread
 712:	83 bd cc fb ff ff 04 	cmpl   $0x4,-0x434(%rbp)
 719:	7e 42                	jle    75d <main+0x3fb>
    strcpy(thread3ops, argv[4]);
 71b:	48 8b 85 c0 fb ff ff 	mov    -0x440(%rbp),%rax
 722:	48 83 c0 20          	add    $0x20,%rax
 726:	48 8b 10             	mov    (%rax),%rdx
 729:	48 8d 85 e0 fc ff ff 	lea    -0x320(%rbp),%rax
 730:	48 89 d6             	mov    %rdx,%rsi
 733:	48 89 c7             	mov    %rax,%rdi
 736:	e8 00 00 00 00       	callq  73b <main+0x3d9>
    pthread_create(&opThread3, NULL, &readThreadOps, (void*) thread3ops);
 73b:	48 8d 85 e0 fc ff ff 	lea    -0x320(%rbp),%rax
 742:	48 89 c1             	mov    %rax,%rcx
 745:	48 8d 15 00 00 00 00 	lea    0x0(%rip),%rdx        # 74c <main+0x3ea>
 74c:	be 00 00 00 00       	mov    $0x0,%esi
 751:	48 8d 3d 00 00 00 00 	lea    0x0(%rip),%rdi        # 758 <main+0x3f6>
 758:	e8 00 00 00 00       	callq  75d <main+0x3fb>
  }
  if(argc == 6){ //create another thread
 75d:	83 bd cc fb ff ff 06 	cmpl   $0x6,-0x434(%rbp)
 764:	75 42                	jne    7a8 <main+0x446>
    strcpy(thread4ops, argv[5]);
 766:	48 8b 85 c0 fb ff ff 	mov    -0x440(%rbp),%rax
 76d:	48 83 c0 28          	add    $0x28,%rax
 771:	48 8b 10             	mov    (%rax),%rdx
 774:	48 8d 85 e0 fb ff ff 	lea    -0x420(%rbp),%rax
 77b:	48 89 d6             	mov    %rdx,%rsi
 77e:	48 89 c7             	mov    %rax,%rdi
 781:	e8 00 00 00 00       	callq  786 <main+0x424>
    pthread_create(&opThread4, NULL, &readThreadOps, (void*) thread4ops);
 786:	48 8d 85 e0 fb ff ff 	lea    -0x420(%rbp),%rax
 78d:	48 89 c1             	mov    %rax,%rcx
 790:	48 8d 15 00 00 00 00 	lea    0x0(%rip),%rdx        # 797 <main+0x435>
 797:	be 00 00 00 00       	mov    $0x0,%esi
 79c:	48 8d 3d 00 00 00 00 	lea    0x0(%rip),%rdi        # 7a3 <main+0x441>
 7a3:	e8 00 00 00 00       	callq  7a8 <main+0x446>
  }
  close(diskFile);
 7a8:	8b 05 00 00 00 00    	mov    0x0(%rip),%eax        # 7ae <main+0x44c>
 7ae:	89 c7                	mov    %eax,%edi
 7b0:	e8 00 00 00 00       	callq  7b5 <main+0x453>

  pthread_mutex_lock(&request_end_mutex);
 7b5:	48 8d 3d 00 00 00 00 	lea    0x0(%rip),%rdi        # 7bc <main+0x45a>
 7bc:	e8 00 00 00 00       	callq  7c1 <main+0x45f>
  pthread_cond_wait(&request_end, &request_end_mutex);
 7c1:	48 8d 35 00 00 00 00 	lea    0x0(%rip),%rsi        # 7c8 <main+0x466>
 7c8:	48 8d 3d 00 00 00 00 	lea    0x0(%rip),%rdi        # 7cf <main+0x46d>
 7cf:	e8 00 00 00 00       	callq  7d4 <main+0x472>

  if(argc >= 3){
 7d4:	83 bd cc fb ff ff 02 	cmpl   $0x2,-0x434(%rbp)
 7db:	0f 8e 9e 00 00 00    	jle    87f <main+0x51d>
    pthread_join(opThread1, NULL);
 7e1:	48 8b 05 00 00 00 00 	mov    0x0(%rip),%rax        # 7e8 <main+0x486>
 7e8:	be 00 00 00 00       	mov    $0x0,%esi
 7ed:	48 89 c7             	mov    %rax,%rdi
 7f0:	e8 00 00 00 00       	callq  7f5 <main+0x493>
    if(argc >= 4){ //only join a thread if we created it earlier{
 7f5:	83 bd cc fb ff ff 03 	cmpl   $0x3,-0x434(%rbp)
 7fc:	0f 8e 93 00 00 00    	jle    895 <main+0x533>
      pthread_cancel(opThread2);
 802:	48 8b 05 00 00 00 00 	mov    0x0(%rip),%rax        # 809 <main+0x4a7>
 809:	48 89 c7             	mov    %rax,%rdi
 80c:	e8 00 00 00 00       	callq  811 <main+0x4af>
    	pthread_join(opThread2, NULL);
 811:	48 8b 05 00 00 00 00 	mov    0x0(%rip),%rax        # 818 <main+0x4b6>
 818:	be 00 00 00 00       	mov    $0x0,%esi
 81d:	48 89 c7             	mov    %rax,%rdi
 820:	e8 00 00 00 00       	callq  825 <main+0x4c3>
    	if(argc>= 5){
 825:	83 bd cc fb ff ff 04 	cmpl   $0x4,-0x434(%rbp)
 82c:	7e 67                	jle    895 <main+0x533>
        pthread_cancel(opThread3);
 82e:	48 8b 05 00 00 00 00 	mov    0x0(%rip),%rax        # 835 <main+0x4d3>
 835:	48 89 c7             	mov    %rax,%rdi
 838:	e8 00 00 00 00       	callq  83d <main+0x4db>
    		pthread_join(opThread3, NULL);
 83d:	48 8b 05 00 00 00 00 	mov    0x0(%rip),%rax        # 844 <main+0x4e2>
 844:	be 00 00 00 00       	mov    $0x0,%esi
 849:	48 89 c7             	mov    %rax,%rdi
 84c:	e8 00 00 00 00       	callq  851 <main+0x4ef>
    		if(argc >= 6){
 851:	83 bd cc fb ff ff 05 	cmpl   $0x5,-0x434(%rbp)
 858:	7e 3b                	jle    895 <main+0x533>
          pthread_cancel(opThread4);
 85a:	48 8b 05 00 00 00 00 	mov    0x0(%rip),%rax        # 861 <main+0x4ff>
 861:	48 89 c7             	mov    %rax,%rdi
 864:	e8 00 00 00 00       	callq  869 <main+0x507>
    			pthread_join(opThread4, NULL);
 869:	48 8b 05 00 00 00 00 	mov    0x0(%rip),%rax        # 870 <main+0x50e>
 870:	be 00 00 00 00       	mov    $0x0,%esi
 875:	48 89 c7             	mov    %rax,%rdi
 878:	e8 00 00 00 00       	callq  87d <main+0x51b>
 87d:	eb 16                	jmp    895 <main+0x533>
    		}
    	}
    }
  } else{
    perror("Error: No threads have been requested\n");
 87f:	48 8d 3d 00 00 00 00 	lea    0x0(%rip),%rdi        # 886 <main+0x524>
 886:	e8 00 00 00 00       	callq  88b <main+0x529>
    exit(1);
 88b:	bf 01 00 00 00       	mov    $0x1,%edi
 890:	e8 00 00 00 00       	callq  895 <main+0x533>
  }
  pthread_join(schedThread, NULL);
 895:	48 8b 05 00 00 00 00 	mov    0x0(%rip),%rax        # 89c <main+0x53a>
 89c:	be 00 00 00 00       	mov    $0x0,%esi
 8a1:	48 89 c7             	mov    %rax,%rdi
 8a4:	e8 00 00 00 00       	callq  8a9 <main+0x547>
  return 0;
 8a9:	b8 00 00 00 00       	mov    $0x0,%eax
}
 8ae:	c9                   	leaveq 
 8af:	c3                   	retq   
