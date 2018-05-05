
ssfs:     file format elf64-x86-64


Disassembly of section .init:

0000000000000c68 <_init>:
 c68:	48 83 ec 08          	sub    $0x8,%rsp
 c6c:	48 8b 05 6d 33 20 00 	mov    0x20336d(%rip),%rax        # 203fe0 <__gmon_start__>
 c73:	48 85 c0             	test   %rax,%rax
 c76:	74 02                	je     c7a <_init+0x12>
 c78:	ff d0                	callq  *%rax
 c7a:	48 83 c4 08          	add    $0x8,%rsp
 c7e:	c3                   	retq   

Disassembly of section .plt:

0000000000000c80 <.plt>:
 c80:	ff 35 82 33 20 00    	pushq  0x203382(%rip)        # 204008 <_GLOBAL_OFFSET_TABLE_+0x8>
 c86:	ff 25 84 33 20 00    	jmpq   *0x203384(%rip)        # 204010 <_GLOBAL_OFFSET_TABLE_+0x10>
 c8c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000000c90 <free@plt>:
 c90:	ff 25 82 33 20 00    	jmpq   *0x203382(%rip)        # 204018 <free@GLIBC_2.2.5>
 c96:	68 00 00 00 00       	pushq  $0x0
 c9b:	e9 e0 ff ff ff       	jmpq   c80 <.plt>

0000000000000ca0 <pthread_create@plt>:
 ca0:	ff 25 7a 33 20 00    	jmpq   *0x20337a(%rip)        # 204020 <pthread_create@GLIBC_2.2.5>
 ca6:	68 01 00 00 00       	pushq  $0x1
 cab:	e9 d0 ff ff ff       	jmpq   c80 <.plt>

0000000000000cb0 <strcpy@plt>:
 cb0:	ff 25 72 33 20 00    	jmpq   *0x203372(%rip)        # 204028 <strcpy@GLIBC_2.2.5>
 cb6:	68 02 00 00 00       	pushq  $0x2
 cbb:	e9 c0 ff ff ff       	jmpq   c80 <.plt>

0000000000000cc0 <__isoc99_fscanf@plt>:
 cc0:	ff 25 6a 33 20 00    	jmpq   *0x20336a(%rip)        # 204030 <__isoc99_fscanf@GLIBC_2.7>
 cc6:	68 03 00 00 00       	pushq  $0x3
 ccb:	e9 b0 ff ff ff       	jmpq   c80 <.plt>

0000000000000cd0 <puts@plt>:
 cd0:	ff 25 62 33 20 00    	jmpq   *0x203362(%rip)        # 204038 <puts@GLIBC_2.2.5>
 cd6:	68 04 00 00 00       	pushq  $0x4
 cdb:	e9 a0 ff ff ff       	jmpq   c80 <.plt>

0000000000000ce0 <pthread_cancel@plt>:
 ce0:	ff 25 5a 33 20 00    	jmpq   *0x20335a(%rip)        # 204040 <pthread_cancel@GLIBC_2.2.5>
 ce6:	68 05 00 00 00       	pushq  $0x5
 ceb:	e9 90 ff ff ff       	jmpq   c80 <.plt>

0000000000000cf0 <write@plt>:
 cf0:	ff 25 52 33 20 00    	jmpq   *0x203352(%rip)        # 204048 <write@GLIBC_2.2.5>
 cf6:	68 06 00 00 00       	pushq  $0x6
 cfb:	e9 80 ff ff ff       	jmpq   c80 <.plt>

0000000000000d00 <pthread_cond_wait@plt>:
 d00:	ff 25 4a 33 20 00    	jmpq   *0x20334a(%rip)        # 204050 <pthread_cond_wait@GLIBC_2.3.2>
 d06:	68 07 00 00 00       	pushq  $0x7
 d0b:	e9 70 ff ff ff       	jmpq   c80 <.plt>

0000000000000d10 <fclose@plt>:
 d10:	ff 25 42 33 20 00    	jmpq   *0x203342(%rip)        # 204058 <fclose@GLIBC_2.2.5>
 d16:	68 08 00 00 00       	pushq  $0x8
 d1b:	e9 60 ff ff ff       	jmpq   c80 <.plt>

0000000000000d20 <printf@plt>:
 d20:	ff 25 3a 33 20 00    	jmpq   *0x20333a(%rip)        # 204060 <printf@GLIBC_2.2.5>
 d26:	68 09 00 00 00       	pushq  $0x9
 d2b:	e9 50 ff ff ff       	jmpq   c80 <.plt>

0000000000000d30 <lseek@plt>:
 d30:	ff 25 32 33 20 00    	jmpq   *0x203332(%rip)        # 204068 <lseek@GLIBC_2.2.5>
 d36:	68 0a 00 00 00       	pushq  $0xa
 d3b:	e9 40 ff ff ff       	jmpq   c80 <.plt>

0000000000000d40 <close@plt>:
 d40:	ff 25 2a 33 20 00    	jmpq   *0x20332a(%rip)        # 204070 <close@GLIBC_2.2.5>
 d46:	68 0b 00 00 00       	pushq  $0xb
 d4b:	e9 30 ff ff ff       	jmpq   c80 <.plt>

0000000000000d50 <read@plt>:
 d50:	ff 25 22 33 20 00    	jmpq   *0x203322(%rip)        # 204078 <read@GLIBC_2.2.5>
 d56:	68 0c 00 00 00       	pushq  $0xc
 d5b:	e9 20 ff ff ff       	jmpq   c80 <.plt>

0000000000000d60 <pthread_cond_signal@plt>:
 d60:	ff 25 1a 33 20 00    	jmpq   *0x20331a(%rip)        # 204080 <pthread_cond_signal@GLIBC_2.3.2>
 d66:	68 0d 00 00 00       	pushq  $0xd
 d6b:	e9 10 ff ff ff       	jmpq   c80 <.plt>

0000000000000d70 <strcmp@plt>:
 d70:	ff 25 12 33 20 00    	jmpq   *0x203312(%rip)        # 204088 <strcmp@GLIBC_2.2.5>
 d76:	68 0e 00 00 00       	pushq  $0xe
 d7b:	e9 00 ff ff ff       	jmpq   c80 <.plt>

0000000000000d80 <sem_wait@plt>:
 d80:	ff 25 0a 33 20 00    	jmpq   *0x20330a(%rip)        # 204090 <sem_wait@GLIBC_2.2.5>
 d86:	68 0f 00 00 00       	pushq  $0xf
 d8b:	e9 f0 fe ff ff       	jmpq   c80 <.plt>

0000000000000d90 <pthread_cond_init@plt>:
 d90:	ff 25 02 33 20 00    	jmpq   *0x203302(%rip)        # 204098 <pthread_cond_init@GLIBC_2.3.2>
 d96:	68 10 00 00 00       	pushq  $0x10
 d9b:	e9 e0 fe ff ff       	jmpq   c80 <.plt>

0000000000000da0 <pthread_mutex_unlock@plt>:
 da0:	ff 25 fa 32 20 00    	jmpq   *0x2032fa(%rip)        # 2040a0 <pthread_mutex_unlock@GLIBC_2.2.5>
 da6:	68 11 00 00 00       	pushq  $0x11
 dab:	e9 d0 fe ff ff       	jmpq   c80 <.plt>

0000000000000db0 <pthread_exit@plt>:
 db0:	ff 25 f2 32 20 00    	jmpq   *0x2032f2(%rip)        # 2040a8 <pthread_exit@GLIBC_2.2.5>
 db6:	68 12 00 00 00       	pushq  $0x12
 dbb:	e9 c0 fe ff ff       	jmpq   c80 <.plt>

0000000000000dc0 <malloc@plt>:
 dc0:	ff 25 ea 32 20 00    	jmpq   *0x2032ea(%rip)        # 2040b0 <malloc@GLIBC_2.2.5>
 dc6:	68 13 00 00 00       	pushq  $0x13
 dcb:	e9 b0 fe ff ff       	jmpq   c80 <.plt>

0000000000000dd0 <sem_post@plt>:
 dd0:	ff 25 e2 32 20 00    	jmpq   *0x2032e2(%rip)        # 2040b8 <sem_post@GLIBC_2.2.5>
 dd6:	68 14 00 00 00       	pushq  $0x14
 ddb:	e9 a0 fe ff ff       	jmpq   c80 <.plt>

0000000000000de0 <sem_init@plt>:
 de0:	ff 25 da 32 20 00    	jmpq   *0x2032da(%rip)        # 2040c0 <sem_init@GLIBC_2.2.5>
 de6:	68 15 00 00 00       	pushq  $0x15
 deb:	e9 90 fe ff ff       	jmpq   c80 <.plt>

0000000000000df0 <open@plt>:
 df0:	ff 25 d2 32 20 00    	jmpq   *0x2032d2(%rip)        # 2040c8 <open@GLIBC_2.2.5>
 df6:	68 16 00 00 00       	pushq  $0x16
 dfb:	e9 80 fe ff ff       	jmpq   c80 <.plt>

0000000000000e00 <fopen@plt>:
 e00:	ff 25 ca 32 20 00    	jmpq   *0x2032ca(%rip)        # 2040d0 <fopen@GLIBC_2.2.5>
 e06:	68 17 00 00 00       	pushq  $0x17
 e0b:	e9 70 fe ff ff       	jmpq   c80 <.plt>

0000000000000e10 <perror@plt>:
 e10:	ff 25 c2 32 20 00    	jmpq   *0x2032c2(%rip)        # 2040d8 <perror@GLIBC_2.2.5>
 e16:	68 18 00 00 00       	pushq  $0x18
 e1b:	e9 60 fe ff ff       	jmpq   c80 <.plt>

0000000000000e20 <pthread_join@plt>:
 e20:	ff 25 ba 32 20 00    	jmpq   *0x2032ba(%rip)        # 2040e0 <pthread_join@GLIBC_2.2.5>
 e26:	68 19 00 00 00       	pushq  $0x19
 e2b:	e9 50 fe ff ff       	jmpq   c80 <.plt>

0000000000000e30 <exit@plt>:
 e30:	ff 25 b2 32 20 00    	jmpq   *0x2032b2(%rip)        # 2040e8 <exit@GLIBC_2.2.5>
 e36:	68 1a 00 00 00       	pushq  $0x1a
 e3b:	e9 40 fe ff ff       	jmpq   c80 <.plt>

0000000000000e40 <pthread_mutex_init@plt>:
 e40:	ff 25 aa 32 20 00    	jmpq   *0x2032aa(%rip)        # 2040f0 <pthread_mutex_init@GLIBC_2.2.5>
 e46:	68 1b 00 00 00       	pushq  $0x1b
 e4b:	e9 30 fe ff ff       	jmpq   c80 <.plt>

0000000000000e50 <pthread_mutex_lock@plt>:
 e50:	ff 25 a2 32 20 00    	jmpq   *0x2032a2(%rip)        # 2040f8 <pthread_mutex_lock@GLIBC_2.2.5>
 e56:	68 1c 00 00 00       	pushq  $0x1c
 e5b:	e9 20 fe ff ff       	jmpq   c80 <.plt>

Disassembly of section .plt.got:

0000000000000e60 <.plt.got>:
 e60:	ff 25 92 31 20 00    	jmpq   *0x203192(%rip)        # 203ff8 <__cxa_finalize@GLIBC_2.2.5>
 e66:	66 90                	xchg   %ax,%ax

Disassembly of section .text:

0000000000000e70 <_start>:
     e70:	31 ed                	xor    %ebp,%ebp
     e72:	49 89 d1             	mov    %rdx,%r9
     e75:	5e                   	pop    %rsi
     e76:	48 89 e2             	mov    %rsp,%rdx
     e79:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
     e7d:	50                   	push   %rax
     e7e:	54                   	push   %rsp
     e7f:	4c 8d 05 5a 21 00 00 	lea    0x215a(%rip),%r8        # 2fe0 <__libc_csu_fini>
     e86:	48 8d 0d e3 20 00 00 	lea    0x20e3(%rip),%rcx        # 2f70 <__libc_csu_init>
     e8d:	48 8d 3d 6e 04 00 00 	lea    0x46e(%rip),%rdi        # 1302 <main>
     e94:	ff 15 3e 31 20 00    	callq  *0x20313e(%rip)        # 203fd8 <__libc_start_main@GLIBC_2.2.5>
     e9a:	f4                   	hlt    
     e9b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000000ea0 <deregister_tm_clones>:
     ea0:	48 8d 3d 69 32 20 00 	lea    0x203269(%rip),%rdi        # 204110 <__TMC_END__>
     ea7:	48 8d 05 69 32 20 00 	lea    0x203269(%rip),%rax        # 204117 <__TMC_END__+0x7>
     eae:	55                   	push   %rbp
     eaf:	48 29 f8             	sub    %rdi,%rax
     eb2:	48 89 e5             	mov    %rsp,%rbp
     eb5:	48 83 f8 0e          	cmp    $0xe,%rax
     eb9:	76 15                	jbe    ed0 <deregister_tm_clones+0x30>
     ebb:	48 8b 05 0e 31 20 00 	mov    0x20310e(%rip),%rax        # 203fd0 <_ITM_deregisterTMCloneTable>
     ec2:	48 85 c0             	test   %rax,%rax
     ec5:	74 09                	je     ed0 <deregister_tm_clones+0x30>
     ec7:	5d                   	pop    %rbp
     ec8:	ff e0                	jmpq   *%rax
     eca:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
     ed0:	5d                   	pop    %rbp
     ed1:	c3                   	retq   
     ed2:	0f 1f 40 00          	nopl   0x0(%rax)
     ed6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
     edd:	00 00 00 

0000000000000ee0 <register_tm_clones>:
     ee0:	48 8d 3d 29 32 20 00 	lea    0x203229(%rip),%rdi        # 204110 <__TMC_END__>
     ee7:	48 8d 35 22 32 20 00 	lea    0x203222(%rip),%rsi        # 204110 <__TMC_END__>
     eee:	55                   	push   %rbp
     eef:	48 29 fe             	sub    %rdi,%rsi
     ef2:	48 89 e5             	mov    %rsp,%rbp
     ef5:	48 c1 fe 03          	sar    $0x3,%rsi
     ef9:	48 89 f0             	mov    %rsi,%rax
     efc:	48 c1 e8 3f          	shr    $0x3f,%rax
     f00:	48 01 c6             	add    %rax,%rsi
     f03:	48 d1 fe             	sar    %rsi
     f06:	74 18                	je     f20 <register_tm_clones+0x40>
     f08:	48 8b 05 e1 30 20 00 	mov    0x2030e1(%rip),%rax        # 203ff0 <_ITM_registerTMCloneTable>
     f0f:	48 85 c0             	test   %rax,%rax
     f12:	74 0c                	je     f20 <register_tm_clones+0x40>
     f14:	5d                   	pop    %rbp
     f15:	ff e0                	jmpq   *%rax
     f17:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
     f1e:	00 00 
     f20:	5d                   	pop    %rbp
     f21:	c3                   	retq   
     f22:	0f 1f 40 00          	nopl   0x0(%rax)
     f26:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
     f2d:	00 00 00 

0000000000000f30 <__do_global_dtors_aux>:
     f30:	80 3d e9 31 20 00 00 	cmpb   $0x0,0x2031e9(%rip)        # 204120 <completed.6972>
     f37:	75 27                	jne    f60 <__do_global_dtors_aux+0x30>
     f39:	48 83 3d b7 30 20 00 	cmpq   $0x0,0x2030b7(%rip)        # 203ff8 <__cxa_finalize@GLIBC_2.2.5>
     f40:	00 
     f41:	55                   	push   %rbp
     f42:	48 89 e5             	mov    %rsp,%rbp
     f45:	74 0c                	je     f53 <__do_global_dtors_aux+0x23>
     f47:	48 8b 3d ba 31 20 00 	mov    0x2031ba(%rip),%rdi        # 204108 <__dso_handle>
     f4e:	e8 0d ff ff ff       	callq  e60 <.plt.got>
     f53:	e8 48 ff ff ff       	callq  ea0 <deregister_tm_clones>
     f58:	5d                   	pop    %rbp
     f59:	c6 05 c0 31 20 00 01 	movb   $0x1,0x2031c0(%rip)        # 204120 <completed.6972>
     f60:	f3 c3                	repz retq 
     f62:	0f 1f 40 00          	nopl   0x0(%rax)
     f66:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
     f6d:	00 00 00 

0000000000000f70 <frame_dummy>:
     f70:	48 8d 3d 41 2e 20 00 	lea    0x202e41(%rip),%rdi        # 203db8 <__JCR_END__>
     f77:	48 83 3f 00          	cmpq   $0x0,(%rdi)
     f7b:	75 0b                	jne    f88 <frame_dummy+0x18>
     f7d:	e9 5e ff ff ff       	jmpq   ee0 <register_tm_clones>
     f82:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
     f88:	48 8b 05 59 30 20 00 	mov    0x203059(%rip),%rax        # 203fe8 <_Jv_RegisterClasses>
     f8f:	48 85 c0             	test   %rax,%rax
     f92:	74 e9                	je     f7d <frame_dummy+0xd>
     f94:	55                   	push   %rbp
     f95:	48 89 e5             	mov    %rsp,%rbp
     f98:	ff d0                	callq  *%rax
     f9a:	5d                   	pop    %rbp
     f9b:	e9 40 ff ff ff       	jmpq   ee0 <register_tm_clones>

0000000000000fa0 <readThreadOps>:
//     perror("Error: Could not create file.\n");
//     exit(1);
//   }
// }

void* readThreadOps(void* threadName){
     fa0:	55                   	push   %rbp
     fa1:	48 89 e5             	mov    %rsp,%rbp
     fa4:	48 81 ec c0 04 00 00 	sub    $0x4c0,%rsp
     fab:	48 89 bd 48 fb ff ff 	mov    %rdi,-0x4b8(%rbp)
  FILE* threadOps;
  char lineBuff[1024];
  //string* operations = {"CREATE","IMPORT","CAT","DELETE","WRITE","READ","LIST","SHUTDOWN"};
  //converts the thread name to a string and opens it for reading
  char* nameOfThread = (char*) threadName;
     fb2:	48 8b 85 48 fb ff ff 	mov    -0x4b8(%rbp),%rax
     fb9:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  threadOps = fopen(nameOfThread, "r");
     fbd:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     fc1:	48 8d 35 30 20 00 00 	lea    0x2030(%rip),%rsi        # 2ff8 <_IO_stdin_used+0x8>
     fc8:	48 89 c7             	mov    %rax,%rdi
     fcb:	e8 30 fe ff ff       	callq  e00 <fopen@plt>
     fd0:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  if(threadOps == NULL){
     fd4:	48 83 7d f0 00       	cmpq   $0x0,-0x10(%rbp)
     fd9:	0f 85 e6 02 00 00    	jne    12c5 <readThreadOps+0x325>
    perror("Error: Could not open threadOps file\n");
     fdf:	48 8d 3d 1a 20 00 00 	lea    0x201a(%rip),%rdi        # 3000 <_IO_stdin_used+0x10>
     fe6:	e8 25 fe ff ff       	callq  e10 <perror@plt>
    exit(1);
     feb:	bf 01 00 00 00       	mov    $0x1,%edi
     ff0:	e8 3b fe ff ff       	callq  e30 <exit@plt>
  //the function strstr finds a string within another string
  //gets a line from the the threadOps file we opened
  //fgets(lineBuff, sizeof(lineBuff), threadOps)
  while(fscanf(threadOps, "%s", commands)){
    //checks if the command is create
    if(strcmp(commands, "CREATE") == 0){
     ff5:	48 8d 85 a0 fb ff ff 	lea    -0x460(%rbp),%rax
     ffc:	48 8d 35 23 20 00 00 	lea    0x2023(%rip),%rsi        # 3026 <_IO_stdin_used+0x36>
    1003:	48 89 c7             	mov    %rax,%rdi
    1006:	e8 65 fd ff ff       	callq  d70 <strcmp@plt>
    100b:	85 c0                	test   %eax,%eax
    100d:	75 5d                	jne    106c <readThreadOps+0xcc>
      //Get File Name, returns a pointer to right after the space
      //of the line buffer
      char newFileName[32];
      fscanf(threadOps, " %s", newFileName);
    100f:	48 8d 95 70 fb ff ff 	lea    -0x490(%rbp),%rdx
    1016:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    101a:	48 8d 35 0c 20 00 00 	lea    0x200c(%rip),%rsi        # 302d <_IO_stdin_used+0x3d>
    1021:	48 89 c7             	mov    %rax,%rdi
    1024:	b8 00 00 00 00       	mov    $0x0,%eax
    1029:	e8 92 fc ff ff       	callq  cc0 <__isoc99_fscanf@plt>
      //makes sure file does not exist
      //-1 when file does not exist
      if(find_file(newFileName) != -1){
    102e:	48 8d 85 70 fb ff ff 	lea    -0x490(%rbp),%rax
    1035:	48 89 c7             	mov    %rax,%rdi
    1038:	e8 8e 0a 00 00       	callq  1acb <find_file>
    103d:	83 f8 ff             	cmp    $0xffffffff,%eax
    1040:	74 16                	je     1058 <readThreadOps+0xb8>
        perror("Error: Could not create file because file already exists.\n");
    1042:	48 8d 3d ef 1f 00 00 	lea    0x1fef(%rip),%rdi        # 3038 <_IO_stdin_used+0x48>
    1049:	e8 c2 fd ff ff       	callq  e10 <perror@plt>
        exit(1);
    104e:	bf 01 00 00 00       	mov    $0x1,%edi
    1053:	e8 d8 fd ff ff       	callq  e30 <exit@plt>
      //if it reaches this point then the file is not on disk so create it


      //create() function from common.h found in disk_ops.c
      //should we lock before calling to the function?
      create(newFileName);
    1058:	48 8d 85 70 fb ff ff 	lea    -0x490(%rbp),%rax
    105f:	48 89 c7             	mov    %rax,%rdi
    1062:	e8 f3 0a 00 00       	callq  1b5a <create>
    1067:	e9 59 02 00 00       	jmpq   12c5 <readThreadOps+0x325>

    } else if(strcmp(commands, "IMPORT") == 0){
    106c:	48 8d 85 a0 fb ff ff 	lea    -0x460(%rbp),%rax
    1073:	48 8d 35 f9 1f 00 00 	lea    0x1ff9(%rip),%rsi        # 3073 <_IO_stdin_used+0x83>
    107a:	48 89 c7             	mov    %rax,%rdi
    107d:	e8 ee fc ff ff       	callq  d70 <strcmp@plt>
    1082:	85 c0                	test   %eax,%eax
    1084:	75 44                	jne    10ca <readThreadOps+0x12a>
      char importFileName[32];
      char unixFileName[32];

      fscanf(threadOps, " %s %s", importFileName, unixFileName);
    1086:	48 8d 8d 70 fb ff ff 	lea    -0x490(%rbp),%rcx
    108d:	48 8d 95 50 fb ff ff 	lea    -0x4b0(%rbp),%rdx
    1094:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    1098:	48 8d 35 db 1f 00 00 	lea    0x1fdb(%rip),%rsi        # 307a <_IO_stdin_used+0x8a>
    109f:	48 89 c7             	mov    %rax,%rdi
    10a2:	b8 00 00 00 00       	mov    $0x0,%eax
    10a7:	e8 14 fc ff ff       	callq  cc0 <__isoc99_fscanf@plt>
      //now both variables contain what they should have

      //import() function from common.h found in disk_ops.c
      //should we lock before calling to the function?
      import(importFileName, unixFileName);
    10ac:	48 8d 95 70 fb ff ff 	lea    -0x490(%rbp),%rdx
    10b3:	48 8d 85 50 fb ff ff 	lea    -0x4b0(%rbp),%rax
    10ba:	48 89 d6             	mov    %rdx,%rsi
    10bd:	48 89 c7             	mov    %rax,%rdi
    10c0:	e8 b6 0b 00 00       	callq  1c7b <import>
    10c5:	e9 fb 01 00 00       	jmpq   12c5 <readThreadOps+0x325>


    } else if(strcmp(commands, "CAT") == 0){
    10ca:	48 8d 85 a0 fb ff ff 	lea    -0x460(%rbp),%rax
    10d1:	48 8d 35 a9 1f 00 00 	lea    0x1fa9(%rip),%rsi        # 3081 <_IO_stdin_used+0x91>
    10d8:	48 89 c7             	mov    %rax,%rdi
    10db:	e8 90 fc ff ff       	callq  d70 <strcmp@plt>
    10e0:	85 c0                	test   %eax,%eax
    10e2:	75 33                	jne    1117 <readThreadOps+0x177>
      //gets name of the file
      char catFileName[32];
      fscanf(threadOps, " %s", catFileName);
    10e4:	48 8d 95 70 fb ff ff 	lea    -0x490(%rbp),%rdx
    10eb:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    10ef:	48 8d 35 37 1f 00 00 	lea    0x1f37(%rip),%rsi        # 302d <_IO_stdin_used+0x3d>
    10f6:	48 89 c7             	mov    %rax,%rdi
    10f9:	b8 00 00 00 00       	mov    $0x0,%eax
    10fe:	e8 bd fb ff ff       	callq  cc0 <__isoc99_fscanf@plt>

      //cat() function from common.h found in disk_ops.c
      //should we lock before calling to the function?
      cat(catFileName);
    1103:	48 8d 85 70 fb ff ff 	lea    -0x490(%rbp),%rax
    110a:	48 89 c7             	mov    %rax,%rdi
    110d:	e8 c1 0c 00 00       	callq  1dd3 <cat>
    1112:	e9 ae 01 00 00       	jmpq   12c5 <readThreadOps+0x325>


    } else if(strcmp(commands, "DELETE") == 0){
    1117:	48 8d 85 a0 fb ff ff 	lea    -0x460(%rbp),%rax
    111e:	48 8d 35 60 1f 00 00 	lea    0x1f60(%rip),%rsi        # 3085 <_IO_stdin_used+0x95>
    1125:	48 89 c7             	mov    %rax,%rdi
    1128:	e8 43 fc ff ff       	callq  d70 <strcmp@plt>
    112d:	85 c0                	test   %eax,%eax
    112f:	75 33                	jne    1164 <readThreadOps+0x1c4>
      //gets name of file to delete
      char deleteFileName[32];
      fscanf(threadOps, " %s", deleteFileName);
    1131:	48 8d 95 70 fb ff ff 	lea    -0x490(%rbp),%rdx
    1138:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    113c:	48 8d 35 ea 1e 00 00 	lea    0x1eea(%rip),%rsi        # 302d <_IO_stdin_used+0x3d>
    1143:	48 89 c7             	mov    %rax,%rdi
    1146:	b8 00 00 00 00       	mov    $0x0,%eax
    114b:	e8 70 fb ff ff       	callq  cc0 <__isoc99_fscanf@plt>

      //erase() function from common.h found in disk_ops.c
      //should we lock before calling to the function?
      erase(deleteFileName);
    1150:	48 8d 85 70 fb ff ff 	lea    -0x490(%rbp),%rax
    1157:	48 89 c7             	mov    %rax,%rdi
    115a:	e8 d5 0c 00 00       	callq  1e34 <erase>
    115f:	e9 61 01 00 00       	jmpq   12c5 <readThreadOps+0x325>


    } else if(strcmp(commands, "WRITE") == 0){
    1164:	48 8d 85 a0 fb ff ff 	lea    -0x460(%rbp),%rax
    116b:	48 8d 35 1a 1f 00 00 	lea    0x1f1a(%rip),%rsi        # 308c <_IO_stdin_used+0x9c>
    1172:	48 89 c7             	mov    %rax,%rdi
    1175:	e8 f6 fb ff ff       	callq  d70 <strcmp@plt>
    117a:	85 c0                	test   %eax,%eax
    117c:	75 6a                	jne    11e8 <readThreadOps+0x248>
      //changes the spaces for null terminators

      fscanf(threadOps, " %s %c %d %d", writeFileName, &writeChar, &startByte, &numBytes);
    117e:	48 8d bd c4 fb ff ff 	lea    -0x43c(%rbp),%rdi
    1185:	48 8d b5 c8 fb ff ff 	lea    -0x438(%rbp),%rsi
    118c:	48 8d 8d cf fb ff ff 	lea    -0x431(%rbp),%rcx
    1193:	48 8d 95 d0 fb ff ff 	lea    -0x430(%rbp),%rdx
    119a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    119e:	49 89 f9             	mov    %rdi,%r9
    11a1:	49 89 f0             	mov    %rsi,%r8
    11a4:	48 8d 35 e7 1e 00 00 	lea    0x1ee7(%rip),%rsi        # 3092 <_IO_stdin_used+0xa2>
    11ab:	48 89 c7             	mov    %rax,%rdi
    11ae:	b8 00 00 00 00       	mov    $0x0,%eax
    11b3:	e8 08 fb ff ff       	callq  cc0 <__isoc99_fscanf@plt>

      //write_ssfs() function from common.h found in disk_ops.c
      //should we lock before calling to the function?
      write_ssfs(writeFileName, writeChar, startByte, numBytes, NULL);
    11b8:	8b 8d c4 fb ff ff    	mov    -0x43c(%rbp),%ecx
    11be:	8b 95 c8 fb ff ff    	mov    -0x438(%rbp),%edx
    11c4:	0f b6 85 cf fb ff ff 	movzbl -0x431(%rbp),%eax
    11cb:	0f be f0             	movsbl %al,%esi
    11ce:	48 8d 85 d0 fb ff ff 	lea    -0x430(%rbp),%rax
    11d5:	41 b8 00 00 00 00    	mov    $0x0,%r8d
    11db:	48 89 c7             	mov    %rax,%rdi
    11de:	e8 2c 10 00 00       	callq  220f <write_ssfs>
    11e3:	e9 dd 00 00 00       	jmpq   12c5 <readThreadOps+0x325>


    } else if(strcmp(commands, "READ") == 0){
    11e8:	48 8d 85 a0 fb ff ff 	lea    -0x460(%rbp),%rax
    11ef:	48 8d 35 a9 1e 00 00 	lea    0x1ea9(%rip),%rsi        # 309f <_IO_stdin_used+0xaf>
    11f6:	48 89 c7             	mov    %rax,%rdi
    11f9:	e8 72 fb ff ff       	callq  d70 <strcmp@plt>
    11fe:	85 c0                	test   %eax,%eax
    1200:	75 63                	jne    1265 <readThreadOps+0x2c5>
      char readFileName[32];
      int startByte = -1;
    1202:	c7 85 9c fb ff ff ff 	movl   $0xffffffff,-0x464(%rbp)
    1209:	ff ff ff 
      int numBytes = -1;
    120c:	c7 85 98 fb ff ff ff 	movl   $0xffffffff,-0x468(%rbp)
    1213:	ff ff ff 

      //changes the spaces for null terminators
      fscanf(threadOps, " %s %d %d", readFileName, &startByte, &numBytes);
    1216:	48 8d b5 98 fb ff ff 	lea    -0x468(%rbp),%rsi
    121d:	48 8d 8d 9c fb ff ff 	lea    -0x464(%rbp),%rcx
    1224:	48 8d 95 70 fb ff ff 	lea    -0x490(%rbp),%rdx
    122b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    122f:	49 89 f0             	mov    %rsi,%r8
    1232:	48 8d 35 6b 1e 00 00 	lea    0x1e6b(%rip),%rsi        # 30a4 <_IO_stdin_used+0xb4>
    1239:	48 89 c7             	mov    %rax,%rdi
    123c:	b8 00 00 00 00       	mov    $0x0,%eax
    1241:	e8 7a fa ff ff       	callq  cc0 <__isoc99_fscanf@plt>

      //write_ssfs() function from common.h found in disk_ops.c
      //should we lock before calling to the function?
      read_ssfs(writeFileName, startByte, numBytes);
    1246:	8b 95 98 fb ff ff    	mov    -0x468(%rbp),%edx
    124c:	8b 8d 9c fb ff ff    	mov    -0x464(%rbp),%ecx
    1252:	48 8d 85 d0 fb ff ff 	lea    -0x430(%rbp),%rax
    1259:	89 ce                	mov    %ecx,%esi
    125b:	48 89 c7             	mov    %rax,%rdi
    125e:	e8 88 16 00 00       	callq  28eb <read_ssfs>
    1263:	eb 60                	jmp    12c5 <readThreadOps+0x325>


    } else if(strcmp(commands, "LIST") == 0){
    1265:	48 8d 85 a0 fb ff ff 	lea    -0x460(%rbp),%rax
    126c:	48 8d 35 3b 1e 00 00 	lea    0x1e3b(%rip),%rsi        # 30ae <_IO_stdin_used+0xbe>
    1273:	48 89 c7             	mov    %rax,%rdi
    1276:	e8 f5 fa ff ff       	callq  d70 <strcmp@plt>
    127b:	85 c0                	test   %eax,%eax
    127d:	75 0c                	jne    128b <readThreadOps+0x2eb>
      list();
    127f:	b8 00 00 00 00       	mov    $0x0,%eax
    1284:	e8 0c 1a 00 00       	callq  2c95 <list>
    1289:	eb 3a                	jmp    12c5 <readThreadOps+0x325>

    } else if(strcmp(lineBuff, "SHUTDOWN") != 0){
    128b:	48 8d 85 f0 fb ff ff 	lea    -0x410(%rbp),%rax
    1292:	48 8d 35 1a 1e 00 00 	lea    0x1e1a(%rip),%rsi        # 30b3 <_IO_stdin_used+0xc3>
    1299:	48 89 c7             	mov    %rax,%rdi
    129c:	e8 cf fa ff ff       	callq  d70 <strcmp@plt>
    12a1:	85 c0                	test   %eax,%eax
    12a3:	74 20                	je     12c5 <readThreadOps+0x325>
      shutdown();
    12a5:	b8 00 00 00 00       	mov    $0x0,%eax
    12aa:	e8 73 1a 00 00       	callq  2d22 <shutdown>
      fclose(threadOps);
    12af:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    12b3:	48 89 c7             	mov    %rax,%rdi
    12b6:	e8 55 fa ff ff       	callq  d10 <fclose@plt>
      pthread_exit(0);
    12bb:	bf 00 00 00 00       	mov    $0x0,%edi
    12c0:	e8 eb fa ff ff       	callq  db0 <pthread_exit@plt>
  while(fscanf(threadOps, "%s", commands)){
    12c5:	48 8d 95 a0 fb ff ff 	lea    -0x460(%rbp),%rdx
    12cc:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    12d0:	48 8d 35 e5 1d 00 00 	lea    0x1de5(%rip),%rsi        # 30bc <_IO_stdin_used+0xcc>
    12d7:	48 89 c7             	mov    %rax,%rdi
    12da:	b8 00 00 00 00       	mov    $0x0,%eax
    12df:	e8 dc f9 ff ff       	callq  cc0 <__isoc99_fscanf@plt>
    12e4:	85 c0                	test   %eax,%eax
    12e6:	0f 85 09 fd ff ff    	jne    ff5 <readThreadOps+0x55>
    }


  }

  fclose(threadOps);
    12ec:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    12f0:	48 89 c7             	mov    %rax,%rdi
    12f3:	e8 18 fa ff ff       	callq  d10 <fclose@plt>
  pthread_exit(0);
    12f8:	bf 00 00 00 00       	mov    $0x0,%edi
    12fd:	e8 ae fa ff ff       	callq  db0 <pthread_exit@plt>

0000000000001302 <main>:


}

int main(int argc, char** argv){
    1302:	55                   	push   %rbp
    1303:	48 89 e5             	mov    %rsp,%rbp
    1306:	48 81 ec 40 04 00 00 	sub    $0x440,%rsp
    130d:	89 bd cc fb ff ff    	mov    %edi,-0x434(%rbp)
    1313:	48 89 b5 c0 fb ff ff 	mov    %rsi,-0x440(%rbp)
	//initialize globals

	num_requests = 0;
    131a:	c7 05 44 94 20 00 00 	movl   $0x0,0x209444(%rip)        # 20a768 <num_requests>
    1321:	00 00 00 
	next_free_request = 0;
    1324:	c7 05 92 94 20 00 00 	movl   $0x0,0x209492(%rip)        # 20a7c0 <next_free_request>
    132b:	00 00 00 
	next_to_do = 0;
    132e:	c7 05 48 94 20 00 00 	movl   $0x0,0x209448(%rip)        # 20a780 <next_to_do>
    1335:	00 00 00 
	sem_init(&request_empty, 0, max_requests);
    1338:	ba 1e 00 00 00       	mov    $0x1e,%edx
    133d:	be 00 00 00 00       	mov    $0x0,%esi
    1342:	48 8d 3d 77 2e 20 00 	lea    0x202e77(%rip),%rdi        # 2041c0 <request_empty>
    1349:	e8 92 fa ff ff       	callq  de0 <sem_init@plt>
	sem_init(&request_full, 0, 0);
    134e:	ba 00 00 00 00       	mov    $0x0,%edx
    1353:	be 00 00 00 00       	mov    $0x0,%esi
    1358:	48 8d 3d a1 93 20 00 	lea    0x2093a1(%rip),%rdi        # 20a700 <request_full>
    135f:	e8 7c fa ff ff       	callq  de0 <sem_init@plt>
	sem_init(&request_condition_mutex, 0 , 2);
    1364:	ba 02 00 00 00       	mov    $0x2,%edx
    1369:	be 00 00 00 00       	mov    $0x0,%esi
    136e:	48 8d 3d 2b 94 20 00 	lea    0x20942b(%rip),%rdi        # 20a7a0 <request_condition_mutex>
    1375:	e8 66 fa ff ff       	callq  de0 <sem_init@plt>
	pthread_mutex_init(&inode_list, NULL);
    137a:	be 00 00 00 00       	mov    $0x0,%esi
    137f:	48 8d 3d 5a 94 20 00 	lea    0x20945a(%rip),%rdi        # 20a7e0 <inode_list>
    1386:	e8 b5 fa ff ff       	callq  e40 <pthread_mutex_init@plt>
	pthread_mutex_init(&free_block_list, NULL);;
    138b:	be 00 00 00 00       	mov    $0x0,%esi
    1390:	48 8d 3d a9 2d 20 00 	lea    0x202da9(%rip),%rdi        # 204140 <free_block_list>
    1397:	e8 a4 fa ff ff       	callq  e40 <pthread_mutex_init@plt>
	pthread_mutex_init(&request_fufilled_mutex, NULL);
    139c:	be 00 00 00 00       	mov    $0x0,%esi
    13a1:	48 8d 3d 98 93 20 00 	lea    0x209398(%rip),%rdi        # 20a740 <request_fufilled_mutex>
    13a8:	e8 93 fa ff ff       	callq  e40 <pthread_mutex_init@plt>
	pthread_mutex_init(&request_end_mutex, NULL);
    13ad:	be 00 00 00 00       	mov    $0x0,%esi
    13b2:	48 8d 3d 07 37 20 00 	lea    0x203707(%rip),%rdi        # 204ac0 <request_end_mutex>
    13b9:	e8 82 fa ff ff       	callq  e40 <pthread_mutex_init@plt>
	pthread_cond_init(&request_end, NULL);
    13be:	be 00 00 00 00       	mov    $0x0,%esi
    13c3:	48 8d 3d b6 2d 20 00 	lea    0x202db6(%rip),%rdi        # 204180 <request_end>
    13ca:	e8 c1 f9 ff ff       	callq  d90 <pthread_cond_init@plt>
	int p;
	for(p = 0; p < max_requests;p++){
    13cf:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
    13d6:	eb 3f                	jmp    1417 <main+0x115>
		pthread_cond_init(&(request_fufilled[p]), NULL); 
    13d8:	8b 45 fc             	mov    -0x4(%rbp),%eax
    13db:	48 63 d0             	movslq %eax,%rdx
    13de:	48 89 d0             	mov    %rdx,%rax
    13e1:	48 01 c0             	add    %rax,%rax
    13e4:	48 01 d0             	add    %rdx,%rax
    13e7:	48 c1 e0 04          	shl    $0x4,%rax
    13eb:	48 8d 15 0e 2e 20 00 	lea    0x202e0e(%rip),%rdx        # 204200 <request_fufilled>
    13f2:	48 01 d0             	add    %rdx,%rax
    13f5:	be 00 00 00 00       	mov    $0x0,%esi
    13fa:	48 89 c7             	mov    %rax,%rdi
    13fd:	e8 8e f9 ff ff       	callq  d90 <pthread_cond_init@plt>
		wakeup_arr[p] = 0;//PTHREAD_COND_INITIALIZER can only be used when declaring a variable
    1402:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1405:	48 63 d0             	movslq %eax,%rdx
    1408:	48 8d 05 91 33 20 00 	lea    0x203391(%rip),%rax        # 2047a0 <wakeup_arr>
    140f:	c6 04 02 00          	movb   $0x0,(%rdx,%rax,1)
	for(p = 0; p < max_requests;p++){
    1413:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
    1417:	83 7d fc 1d          	cmpl   $0x1d,-0x4(%rbp)
    141b:	7e bb                	jle    13d8 <main+0xd6>
  char thread1ops[256];
  char thread2ops[256];
  char thread3ops[256];
  char thread4ops[256];

  pthread_create(&schedThread, NULL, &runner, NULL);
    141d:	b9 00 00 00 00       	mov    $0x0,%ecx
    1422:	48 8d 05 1e 1b 00 00 	lea    0x1b1e(%rip),%rax        # 2f47 <runner>
    1429:	48 89 c2             	mov    %rax,%rdx
    142c:	be 00 00 00 00       	mov    $0x0,%esi
    1431:	48 8d 3d 50 93 20 00 	lea    0x209350(%rip),%rdi        # 20a788 <schedThread>
    1438:	e8 63 f8 ff ff       	callq  ca0 <pthread_create@plt>

  char* usage = "ssfs <disk file name> thread1ops.txt thread2ops.txt thread3ops.txt thread4ops.txt\n";
    143d:	48 8d 05 7c 1c 00 00 	lea    0x1c7c(%rip),%rax        # 30c0 <_IO_stdin_used+0xd0>
    1444:	48 89 45 e8          	mov    %rax,-0x18(%rbp)

  if(argc > 6){
    1448:	83 bd cc fb ff ff 06 	cmpl   $0x6,-0x434(%rbp)
    144f:	7e 22                	jle    1473 <main+0x171>
    printf("Too many arguments\n%s\n", usage);
    1451:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1455:	48 89 c6             	mov    %rax,%rsi
    1458:	48 8d 3d b4 1c 00 00 	lea    0x1cb4(%rip),%rdi        # 3113 <_IO_stdin_used+0x123>
    145f:	b8 00 00 00 00       	mov    $0x0,%eax
    1464:	e8 b7 f8 ff ff       	callq  d20 <printf@plt>
    exit(1);
    1469:	bf 01 00 00 00       	mov    $0x1,%edi
    146e:	e8 bd f9 ff ff       	callq  e30 <exit@plt>
  } else if(argc < 2){
    1473:	83 bd cc fb ff ff 01 	cmpl   $0x1,-0x434(%rbp)
    147a:	7f 22                	jg     149e <main+0x19c>
    printf("Missing arguments\n%s\n", usage);
    147c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1480:	48 89 c6             	mov    %rax,%rsi
    1483:	48 8d 3d a0 1c 00 00 	lea    0x1ca0(%rip),%rdi        # 312a <_IO_stdin_used+0x13a>
    148a:	b8 00 00 00 00       	mov    $0x0,%eax
    148f:	e8 8c f8 ff ff       	callq  d20 <printf@plt>
    exit(1);
    1494:	bf 01 00 00 00       	mov    $0x1,%edi
    1499:	e8 92 f9 ff ff       	callq  e30 <exit@plt>




  //store argv[1] as the disk file name
  char* diskName = argv[1];
    149e:	48 8b 85 c0 fb ff ff 	mov    -0x440(%rbp),%rax
    14a5:	48 8b 40 08          	mov    0x8(%rax),%rax
    14a9:	48 89 45 e0          	mov    %rax,-0x20(%rbp)


  //Open file for reading and writing


  diskFile = open(diskName, O_RDWR);
    14ad:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    14b1:	be 02 00 00 00       	mov    $0x2,%esi
    14b6:	48 89 c7             	mov    %rax,%rdi
    14b9:	b8 00 00 00 00       	mov    $0x0,%eax
    14be:	e8 2d f9 ff ff       	callq  df0 <open@plt>
    14c3:	89 05 57 92 20 00    	mov    %eax,0x209257(%rip)        # 20a720 <diskFile>

	//make disk file if not there, read sizes//int test
	//if( read(diskFile, &num_blocks, 4) < 0){//file does not exist
	//	sts;

  read(diskFile, &num_blocks, 4);
    14c9:	8b 05 51 92 20 00    	mov    0x209251(%rip),%eax        # 20a720 <diskFile>
    14cf:	ba 04 00 00 00       	mov    $0x4,%edx
    14d4:	48 8d 35 91 92 20 00 	lea    0x209291(%rip),%rsi        # 20a76c <num_blocks>
    14db:	89 c7                	mov    %eax,%edi
    14dd:	e8 6e f8 ff ff       	callq  d50 <read@plt>
	read(diskFile, &block_size, 4);
    14e2:	8b 05 38 92 20 00    	mov    0x209238(%rip),%eax        # 20a720 <diskFile>
    14e8:	ba 04 00 00 00       	mov    $0x4,%edx
    14ed:	48 8d 35 d0 32 20 00 	lea    0x2032d0(%rip),%rsi        # 2047c4 <block_size>
    14f4:	89 c7                	mov    %eax,%edi
    14f6:	e8 55 f8 ff ff       	callq  d50 <read@plt>
	free_bitfield = malloc(num_blocks/8);
    14fb:	8b 05 6b 92 20 00    	mov    0x20926b(%rip),%eax        # 20a76c <num_blocks>
    1501:	8d 50 07             	lea    0x7(%rax),%edx
    1504:	85 c0                	test   %eax,%eax
    1506:	0f 48 c2             	cmovs  %edx,%eax
    1509:	c1 f8 03             	sar    $0x3,%eax
    150c:	48 98                	cltq   
    150e:	48 89 c7             	mov    %rax,%rdi
    1511:	e8 aa f8 ff ff       	callq  dc0 <malloc@plt>
    1516:	48 89 05 5b 92 20 00 	mov    %rax,0x20925b(%rip)        # 20a778 <free_bitfield>
	for(int i = 0; i < max_files; i++){
    151d:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%rbp)
    1524:	eb 1b                	jmp    1541 <main+0x23f>
      inodes[i].size = -1;
    1526:	8b 45 f8             	mov    -0x8(%rbp),%eax
    1529:	48 98                	cltq   
    152b:	48 6b d0 5c          	imul   $0x5c,%rax,%rdx
    152f:	48 8d 05 ea 35 20 00 	lea    0x2035ea(%rip),%rax        # 204b20 <inodes+0x20>
    1536:	c7 04 02 ff ff ff ff 	movl   $0xffffffff,(%rdx,%rax,1)
	for(int i = 0; i < max_files; i++){
    153d:	83 45 f8 01          	addl   $0x1,-0x8(%rbp)
    1541:	81 7d f8 ff 00 00 00 	cmpl   $0xff,-0x8(%rbp)
    1548:	7e dc                	jle    1526 <main+0x224>
	}

	int q = 0;
    154a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)
	block_ptr block_num;
	for(;q < max_files; q++){
    1551:	eb 7a                	jmp    15cd <main+0x2cb>
		read(diskFile, &block_num, 4);
    1553:	8b 05 c7 91 20 00    	mov    0x2091c7(%rip),%eax        # 20a720 <diskFile>
    1559:	48 8d 8d dc fb ff ff 	lea    -0x424(%rbp),%rcx
    1560:	ba 04 00 00 00       	mov    $0x4,%edx
    1565:	48 89 ce             	mov    %rcx,%rsi
    1568:	89 c7                	mov    %eax,%edi
    156a:	e8 e1 f7 ff ff       	callq  d50 <read@plt>
		if(block_num > 0){
    156f:	8b 85 dc fb ff ff    	mov    -0x424(%rbp),%eax
    1575:	85 c0                	test   %eax,%eax
    1577:	7e 50                	jle    15c9 <main+0x2c7>
			lseek(diskFile, block_num * block_size, SEEK_SET);
    1579:	8b 95 dc fb ff ff    	mov    -0x424(%rbp),%edx
    157f:	8b 05 3f 32 20 00    	mov    0x20323f(%rip),%eax        # 2047c4 <block_size>
    1585:	0f af c2             	imul   %edx,%eax
    1588:	48 63 c8             	movslq %eax,%rcx
    158b:	8b 05 8f 91 20 00    	mov    0x20918f(%rip),%eax        # 20a720 <diskFile>
    1591:	ba 00 00 00 00       	mov    $0x0,%edx
    1596:	48 89 ce             	mov    %rcx,%rsi
    1599:	89 c7                	mov    %eax,%edi
    159b:	e8 90 f7 ff ff       	callq  d30 <lseek@plt>
			read(diskFile, &inodes[q], 4);
    15a0:	8b 45 f4             	mov    -0xc(%rbp),%eax
    15a3:	48 98                	cltq   
    15a5:	48 6b d0 5c          	imul   $0x5c,%rax,%rdx
    15a9:	48 8d 05 50 35 20 00 	lea    0x203550(%rip),%rax        # 204b00 <inodes>
    15b0:	48 8d 0c 02          	lea    (%rdx,%rax,1),%rcx
    15b4:	8b 05 66 91 20 00    	mov    0x209166(%rip),%eax        # 20a720 <diskFile>
    15ba:	ba 04 00 00 00       	mov    $0x4,%edx
    15bf:	48 89 ce             	mov    %rcx,%rsi
    15c2:	89 c7                	mov    %eax,%edi
    15c4:	e8 87 f7 ff ff       	callq  d50 <read@plt>
	for(;q < max_files; q++){
    15c9:	83 45 f4 01          	addl   $0x1,-0xc(%rbp)
    15cd:	81 7d f4 ff 00 00 00 	cmpl   $0xff,-0xc(%rbp)
    15d4:	0f 8e 79 ff ff ff    	jle    1553 <main+0x251>
		}
	}

	read(diskFile, &free_bitfield,num_blocks/8);
    15da:	8b 05 8c 91 20 00    	mov    0x20918c(%rip),%eax        # 20a76c <num_blocks>
    15e0:	8d 50 07             	lea    0x7(%rax),%edx
    15e3:	85 c0                	test   %eax,%eax
    15e5:	0f 48 c2             	cmovs  %edx,%eax
    15e8:	c1 f8 03             	sar    $0x3,%eax
    15eb:	48 63 d0             	movslq %eax,%rdx
    15ee:	8b 05 2c 91 20 00    	mov    0x20912c(%rip),%eax        # 20a720 <diskFile>
    15f4:	48 8d 35 7d 91 20 00 	lea    0x20917d(%rip),%rsi        # 20a778 <free_bitfield>
    15fb:	89 c7                	mov    %eax,%edi
    15fd:	e8 4e f7 ff ff       	callq  d50 <read@plt>

	if(argc >= 3){ //create one thread
    1602:	83 bd cc fb ff ff 02 	cmpl   $0x2,-0x434(%rbp)
    1609:	7e 42                	jle    164d <main+0x34b>
    strcpy(thread1ops, argv[2]);
    160b:	48 8b 85 c0 fb ff ff 	mov    -0x440(%rbp),%rax
    1612:	48 83 c0 10          	add    $0x10,%rax
    1616:	48 8b 10             	mov    (%rax),%rdx
    1619:	48 8d 85 e0 fe ff ff 	lea    -0x120(%rbp),%rax
    1620:	48 89 d6             	mov    %rdx,%rsi
    1623:	48 89 c7             	mov    %rax,%rdi
    1626:	e8 85 f6 ff ff       	callq  cb0 <strcpy@plt>
    pthread_create(&opThread1, NULL, &readThreadOps, (void*) thread1ops);
    162b:	48 8d 85 e0 fe ff ff 	lea    -0x120(%rbp),%rax
    1632:	48 89 c1             	mov    %rax,%rcx
    1635:	48 8d 15 64 f9 ff ff 	lea    -0x69c(%rip),%rdx        # fa0 <readThreadOps>
    163c:	be 00 00 00 00       	mov    $0x0,%esi
    1641:	48 8d 3d e8 90 20 00 	lea    0x2090e8(%rip),%rdi        # 20a730 <opThread1>
    1648:	e8 53 f6 ff ff       	callq  ca0 <pthread_create@plt>
  }
  if(argc >= 4){ //create another thread
    164d:	83 bd cc fb ff ff 03 	cmpl   $0x3,-0x434(%rbp)
    1654:	7e 42                	jle    1698 <main+0x396>
    strcpy(thread2ops, argv[3]);
    1656:	48 8b 85 c0 fb ff ff 	mov    -0x440(%rbp),%rax
    165d:	48 83 c0 18          	add    $0x18,%rax
    1661:	48 8b 10             	mov    (%rax),%rdx
    1664:	48 8d 85 e0 fd ff ff 	lea    -0x220(%rbp),%rax
    166b:	48 89 d6             	mov    %rdx,%rsi
    166e:	48 89 c7             	mov    %rax,%rdi
    1671:	e8 3a f6 ff ff       	callq  cb0 <strcpy@plt>
    pthread_create(&opThread2, NULL, &readThreadOps, (void*) thread2ops);
    1676:	48 8d 85 e0 fd ff ff 	lea    -0x220(%rbp),%rax
    167d:	48 89 c1             	mov    %rax,%rcx
    1680:	48 8d 15 19 f9 ff ff 	lea    -0x6e7(%rip),%rdx        # fa0 <readThreadOps>
    1687:	be 00 00 00 00       	mov    $0x0,%esi
    168c:	48 8d 3d 55 2b 20 00 	lea    0x202b55(%rip),%rdi        # 2041e8 <opThread2>
    1693:	e8 08 f6 ff ff       	callq  ca0 <pthread_create@plt>
  }
  if(argc >= 5){ //create another thread
    1698:	83 bd cc fb ff ff 04 	cmpl   $0x4,-0x434(%rbp)
    169f:	7e 42                	jle    16e3 <main+0x3e1>
    strcpy(thread3ops, argv[4]);
    16a1:	48 8b 85 c0 fb ff ff 	mov    -0x440(%rbp),%rax
    16a8:	48 83 c0 20          	add    $0x20,%rax
    16ac:	48 8b 10             	mov    (%rax),%rdx
    16af:	48 8d 85 e0 fc ff ff 	lea    -0x320(%rbp),%rax
    16b6:	48 89 d6             	mov    %rdx,%rsi
    16b9:	48 89 c7             	mov    %rax,%rdi
    16bc:	e8 ef f5 ff ff       	callq  cb0 <strcpy@plt>
    pthread_create(&opThread3, NULL, &readThreadOps, (void*) thread3ops);
    16c1:	48 8d 85 e0 fc ff ff 	lea    -0x320(%rbp),%rax
    16c8:	48 89 c1             	mov    %rax,%rcx
    16cb:	48 8d 15 ce f8 ff ff 	lea    -0x732(%rip),%rdx        # fa0 <readThreadOps>
    16d2:	be 00 00 00 00       	mov    $0x0,%esi
    16d7:	48 8d 3d 4a 90 20 00 	lea    0x20904a(%rip),%rdi        # 20a728 <opThread3>
    16de:	e8 bd f5 ff ff       	callq  ca0 <pthread_create@plt>
  }
  if(argc == 6){ //create another thread
    16e3:	83 bd cc fb ff ff 06 	cmpl   $0x6,-0x434(%rbp)
    16ea:	75 42                	jne    172e <main+0x42c>
    strcpy(thread4ops, argv[5]);
    16ec:	48 8b 85 c0 fb ff ff 	mov    -0x440(%rbp),%rax
    16f3:	48 83 c0 28          	add    $0x28,%rax
    16f7:	48 8b 10             	mov    (%rax),%rdx
    16fa:	48 8d 85 e0 fb ff ff 	lea    -0x420(%rbp),%rax
    1701:	48 89 d6             	mov    %rdx,%rsi
    1704:	48 89 c7             	mov    %rax,%rdi
    1707:	e8 a4 f5 ff ff       	callq  cb0 <strcpy@plt>
    pthread_create(&opThread4, NULL, &readThreadOps, (void*) thread4ops);
    170c:	48 8d 85 e0 fb ff ff 	lea    -0x420(%rbp),%rax
    1713:	48 89 c1             	mov    %rax,%rcx
    1716:	48 8d 15 83 f8 ff ff 	lea    -0x77d(%rip),%rdx        # fa0 <readThreadOps>
    171d:	be 00 00 00 00       	mov    $0x0,%esi
    1722:	48 8d 3d b7 2a 20 00 	lea    0x202ab7(%rip),%rdi        # 2041e0 <opThread4>
    1729:	e8 72 f5 ff ff       	callq  ca0 <pthread_create@plt>
  }
  close(diskFile);
    172e:	8b 05 ec 8f 20 00    	mov    0x208fec(%rip),%eax        # 20a720 <diskFile>
    1734:	89 c7                	mov    %eax,%edi
    1736:	e8 05 f6 ff ff       	callq  d40 <close@plt>

  pthread_mutex_lock(&request_end_mutex);
    173b:	48 8d 3d 7e 33 20 00 	lea    0x20337e(%rip),%rdi        # 204ac0 <request_end_mutex>
    1742:	e8 09 f7 ff ff       	callq  e50 <pthread_mutex_lock@plt>
  pthread_cond_wait(&request_end, &request_end_mutex);
    1747:	48 8d 35 72 33 20 00 	lea    0x203372(%rip),%rsi        # 204ac0 <request_end_mutex>
    174e:	48 8d 3d 2b 2a 20 00 	lea    0x202a2b(%rip),%rdi        # 204180 <request_end>
    1755:	e8 a6 f5 ff ff       	callq  d00 <pthread_cond_wait@plt>

  if(argc >= 3){
    175a:	83 bd cc fb ff ff 02 	cmpl   $0x2,-0x434(%rbp)
    1761:	0f 8e 9e 00 00 00    	jle    1805 <main+0x503>
    pthread_join(opThread1, NULL);
    1767:	48 8b 05 c2 8f 20 00 	mov    0x208fc2(%rip),%rax        # 20a730 <opThread1>
    176e:	be 00 00 00 00       	mov    $0x0,%esi
    1773:	48 89 c7             	mov    %rax,%rdi
    1776:	e8 a5 f6 ff ff       	callq  e20 <pthread_join@plt>
    if(argc >= 4){ //only join a thread if we created it earlier{
    177b:	83 bd cc fb ff ff 03 	cmpl   $0x3,-0x434(%rbp)
    1782:	0f 8e 93 00 00 00    	jle    181b <main+0x519>
      pthread_cancel(opThread2);
    1788:	48 8b 05 59 2a 20 00 	mov    0x202a59(%rip),%rax        # 2041e8 <opThread2>
    178f:	48 89 c7             	mov    %rax,%rdi
    1792:	e8 49 f5 ff ff       	callq  ce0 <pthread_cancel@plt>
    	pthread_join(opThread2, NULL);
    1797:	48 8b 05 4a 2a 20 00 	mov    0x202a4a(%rip),%rax        # 2041e8 <opThread2>
    179e:	be 00 00 00 00       	mov    $0x0,%esi
    17a3:	48 89 c7             	mov    %rax,%rdi
    17a6:	e8 75 f6 ff ff       	callq  e20 <pthread_join@plt>
    	if(argc>= 5){
    17ab:	83 bd cc fb ff ff 04 	cmpl   $0x4,-0x434(%rbp)
    17b2:	7e 67                	jle    181b <main+0x519>
        pthread_cancel(opThread3);
    17b4:	48 8b 05 6d 8f 20 00 	mov    0x208f6d(%rip),%rax        # 20a728 <opThread3>
    17bb:	48 89 c7             	mov    %rax,%rdi
    17be:	e8 1d f5 ff ff       	callq  ce0 <pthread_cancel@plt>
    		pthread_join(opThread3, NULL);
    17c3:	48 8b 05 5e 8f 20 00 	mov    0x208f5e(%rip),%rax        # 20a728 <opThread3>
    17ca:	be 00 00 00 00       	mov    $0x0,%esi
    17cf:	48 89 c7             	mov    %rax,%rdi
    17d2:	e8 49 f6 ff ff       	callq  e20 <pthread_join@plt>
    		if(argc >= 6){
    17d7:	83 bd cc fb ff ff 05 	cmpl   $0x5,-0x434(%rbp)
    17de:	7e 3b                	jle    181b <main+0x519>
          pthread_cancel(opThread4);
    17e0:	48 8b 05 f9 29 20 00 	mov    0x2029f9(%rip),%rax        # 2041e0 <opThread4>
    17e7:	48 89 c7             	mov    %rax,%rdi
    17ea:	e8 f1 f4 ff ff       	callq  ce0 <pthread_cancel@plt>
    			pthread_join(opThread4, NULL);
    17ef:	48 8b 05 ea 29 20 00 	mov    0x2029ea(%rip),%rax        # 2041e0 <opThread4>
    17f6:	be 00 00 00 00       	mov    $0x0,%esi
    17fb:	48 89 c7             	mov    %rax,%rdi
    17fe:	e8 1d f6 ff ff       	callq  e20 <pthread_join@plt>
    1803:	eb 16                	jmp    181b <main+0x519>
    		}
    	}
    }
  } else{
    perror("Error: No threads have been requested\n");
    1805:	48 8d 3d 34 19 00 00 	lea    0x1934(%rip),%rdi        # 3140 <_IO_stdin_used+0x150>
    180c:	e8 ff f5 ff ff       	callq  e10 <perror@plt>
    exit(1);
    1811:	bf 01 00 00 00       	mov    $0x1,%edi
    1816:	e8 15 f6 ff ff       	callq  e30 <exit@plt>
  }
  pthread_join(schedThread, NULL);
    181b:	48 8b 05 66 8f 20 00 	mov    0x208f66(%rip),%rax        # 20a788 <schedThread>
    1822:	be 00 00 00 00       	mov    $0x0,%esi
    1827:	48 89 c7             	mov    %rax,%rdi
    182a:	e8 f1 f5 ff ff       	callq  e20 <pthread_join@plt>
  return 0;
    182f:	b8 00 00 00 00       	mov    $0x0,%eax
}
    1834:	c9                   	leaveq 
    1835:	c3                   	retq   

0000000000001836 <request>:
#include <sys/stat.h>
#include <stdio.h>
#include <unistd.h>

//Puts a request for the disk scheduler into the array
void request(block_ptr block, void* buffer, char read_write){
    1836:	55                   	push   %rbp
    1837:	48 89 e5             	mov    %rsp,%rbp
    183a:	48 83 ec 30          	sub    $0x30,%rsp
    183e:	89 7d dc             	mov    %edi,-0x24(%rbp)
    1841:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
    1845:	89 d0                	mov    %edx,%eax
    1847:	88 45 d8             	mov    %al,-0x28(%rbp)
	//pthread_mutex_lock(&request_condition_mutex);
	//while(num_requests >= max_requests) pthread_cond_wait(&request_empty, &request_condition_mutex);
	sem_wait(&request_empty);
    184a:	48 8d 3d 6f 29 20 00 	lea    0x20296f(%rip),%rdi        # 2041c0 <request_empty>
    1851:	e8 2a f5 ff ff       	callq  d80 <sem_wait@plt>
	printf("Uhhhhhhhhhhh...\n");
    1856:	48 8d 3d 0b 19 00 00 	lea    0x190b(%rip),%rdi        # 3168 <_IO_stdin_used+0x178>
    185d:	e8 6e f4 ff ff       	callq  cd0 <puts@plt>
	sem_wait(&request_condition_mutex);
    1862:	48 8d 3d 37 8f 20 00 	lea    0x208f37(%rip),%rdi        # 20a7a0 <request_condition_mutex>
    1869:	e8 12 f5 ff ff       	callq  d80 <sem_wait@plt>
	printf("Why does this not work!?!?!?!?\n");
    186e:	48 8d 3d 03 19 00 00 	lea    0x1903(%rip),%rdi        # 3178 <_IO_stdin_used+0x188>
    1875:	e8 56 f4 ff ff       	callq  cd0 <puts@plt>

	int oldrequest = next_free_request;
    187a:	8b 05 40 8f 20 00    	mov    0x208f40(%rip),%eax        # 20a7c0 <next_free_request>
    1880:	89 45 fc             	mov    %eax,-0x4(%rbp)
	printf("In: %d\n", oldrequest); 
    1883:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1886:	89 c6                	mov    %eax,%esi
    1888:	48 8d 3d 08 19 00 00 	lea    0x1908(%rip),%rdi        # 3197 <_IO_stdin_used+0x1a7>
    188f:	b8 00 00 00 00       	mov    $0x0,%eax
    1894:	e8 87 f4 ff ff       	callq  d20 <printf@plt>

	disk_request newRequest;
	newRequest.requested = block;
    1899:	8b 45 dc             	mov    -0x24(%rbp),%eax
    189c:	89 45 e0             	mov    %eax,-0x20(%rbp)
	newRequest.buffer = buffer;
    189f:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    18a3:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
	newRequest.read_write = read_write;
    18a7:	0f b6 45 d8          	movzbl -0x28(%rbp),%eax
    18ab:	88 45 f0             	mov    %al,-0x10(%rbp)
	pending[next_free_request] = newRequest;
    18ae:	8b 05 0c 8f 20 00    	mov    0x208f0c(%rip),%eax        # 20a7c0 <next_free_request>
    18b4:	48 63 d0             	movslq %eax,%rdx
    18b7:	48 89 d0             	mov    %rdx,%rax
    18ba:	48 01 c0             	add    %rax,%rax
    18bd:	48 01 d0             	add    %rdx,%rax
    18c0:	48 c1 e0 03          	shl    $0x3,%rax
    18c4:	48 89 c2             	mov    %rax,%rdx
    18c7:	48 8d 05 12 2f 20 00 	lea    0x202f12(%rip),%rax        # 2047e0 <pending>
    18ce:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
    18d2:	48 89 0c 02          	mov    %rcx,(%rdx,%rax,1)
    18d6:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
    18da:	48 89 4c 02 08       	mov    %rcx,0x8(%rdx,%rax,1)
    18df:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
    18e3:	48 89 4c 02 10       	mov    %rcx,0x10(%rdx,%rax,1)
	printf("Write to array\n");
    18e8:	48 8d 3d b0 18 00 00 	lea    0x18b0(%rip),%rdi        # 319f <_IO_stdin_used+0x1af>
    18ef:	e8 dc f3 ff ff       	callq  cd0 <puts@plt>
	next_free_request = (next_free_request + 1) % max_requests;
    18f4:	8b 05 c6 8e 20 00    	mov    0x208ec6(%rip),%eax        # 20a7c0 <next_free_request>
    18fa:	8d 48 01             	lea    0x1(%rax),%ecx
    18fd:	ba 89 88 88 88       	mov    $0x88888889,%edx
    1902:	89 c8                	mov    %ecx,%eax
    1904:	f7 ea                	imul   %edx
    1906:	8d 04 0a             	lea    (%rdx,%rcx,1),%eax
    1909:	c1 f8 04             	sar    $0x4,%eax
    190c:	89 c2                	mov    %eax,%edx
    190e:	89 c8                	mov    %ecx,%eax
    1910:	c1 f8 1f             	sar    $0x1f,%eax
    1913:	29 c2                	sub    %eax,%edx
    1915:	89 d0                	mov    %edx,%eax
    1917:	6b c0 1e             	imul   $0x1e,%eax,%eax
    191a:	29 c1                	sub    %eax,%ecx
    191c:	89 c8                	mov    %ecx,%eax
    191e:	89 05 9c 8e 20 00    	mov    %eax,0x208e9c(%rip)        # 20a7c0 <next_free_request>
	
	sem_post(&request_condition_mutex);
    1924:	48 8d 3d 75 8e 20 00 	lea    0x208e75(%rip),%rdi        # 20a7a0 <request_condition_mutex>
    192b:	e8 a0 f4 ff ff       	callq  dd0 <sem_post@plt>
	sem_post(&request_full);
    1930:	48 8d 3d c9 8d 20 00 	lea    0x208dc9(%rip),%rdi        # 20a700 <request_full>
    1937:	e8 94 f4 ff ff       	callq  dd0 <sem_post@plt>
	printf("We signaled\n");
    193c:	48 8d 3d 6b 18 00 00 	lea    0x186b(%rip),%rdi        # 31ae <_IO_stdin_used+0x1be>
    1943:	e8 88 f3 ff ff       	callq  cd0 <puts@plt>
	//pthread_mutex_unlock(&request_condition_mutex);
	printf("Number of requests: %d\n",num_requests); 
    1948:	8b 05 1a 8e 20 00    	mov    0x208e1a(%rip),%eax        # 20a768 <num_requests>
    194e:	89 c6                	mov    %eax,%esi
    1950:	48 8d 3d 63 18 00 00 	lea    0x1863(%rip),%rdi        # 31ba <_IO_stdin_used+0x1ca>
    1957:	b8 00 00 00 00       	mov    $0x0,%eax
    195c:	e8 bf f3 ff ff       	callq  d20 <printf@plt>
	pthread_mutex_lock(&request_fufilled_mutex);
    1961:	48 8d 3d d8 8d 20 00 	lea    0x208dd8(%rip),%rdi        # 20a740 <request_fufilled_mutex>
    1968:	e8 e3 f4 ff ff       	callq  e50 <pthread_mutex_lock@plt>
	while(wakeup_arr[oldrequest] < 1) pthread_cond_wait(&request_fufilled[oldrequest], &request_fufilled_mutex);
    196d:	eb 2c                	jmp    199b <request+0x165>
    196f:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1972:	48 63 d0             	movslq %eax,%rdx
    1975:	48 89 d0             	mov    %rdx,%rax
    1978:	48 01 c0             	add    %rax,%rax
    197b:	48 01 d0             	add    %rdx,%rax
    197e:	48 c1 e0 04          	shl    $0x4,%rax
    1982:	48 8d 15 77 28 20 00 	lea    0x202877(%rip),%rdx        # 204200 <request_fufilled>
    1989:	48 01 d0             	add    %rdx,%rax
    198c:	48 8d 35 ad 8d 20 00 	lea    0x208dad(%rip),%rsi        # 20a740 <request_fufilled_mutex>
    1993:	48 89 c7             	mov    %rax,%rdi
    1996:	e8 65 f3 ff ff       	callq  d00 <pthread_cond_wait@plt>
    199b:	8b 45 fc             	mov    -0x4(%rbp),%eax
    199e:	48 63 d0             	movslq %eax,%rdx
    19a1:	48 8d 05 f8 2d 20 00 	lea    0x202df8(%rip),%rax        # 2047a0 <wakeup_arr>
    19a8:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
    19ac:	84 c0                	test   %al,%al
    19ae:	7e bf                	jle    196f <request+0x139>
	wakeup_arr[oldrequest] = 0;
    19b0:	8b 45 fc             	mov    -0x4(%rbp),%eax
    19b3:	48 63 d0             	movslq %eax,%rdx
    19b6:	48 8d 05 e3 2d 20 00 	lea    0x202de3(%rip),%rax        # 2047a0 <wakeup_arr>
    19bd:	c6 04 02 00          	movb   $0x0,(%rdx,%rax,1)
	pthread_mutex_unlock(&request_fufilled_mutex);
    19c1:	48 8d 3d 78 8d 20 00 	lea    0x208d78(%rip),%rdi        # 20a740 <request_fufilled_mutex>
    19c8:	e8 d3 f3 ff ff       	callq  da0 <pthread_mutex_unlock@plt>

}
    19cd:	90                   	nop
    19ce:	c9                   	leaveq 
    19cf:	c3                   	retq   

00000000000019d0 <find_free_block>:


int find_free_block(){
    19d0:	55                   	push   %rbp
    19d1:	48 89 e5             	mov    %rsp,%rbp
    19d4:	48 83 ec 10          	sub    $0x10,%rsp
	pthread_mutex_lock(&free_block_list);
    19d8:	48 8d 3d 61 27 20 00 	lea    0x202761(%rip),%rdi        # 204140 <free_block_list>
    19df:	e8 6c f4 ff ff       	callq  e50 <pthread_mutex_lock@plt>
	int i = 0;
    19e4:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
	int free_block;
	for(; i < num_blocks/8; i++){
    19eb:	e9 93 00 00 00       	jmpq   1a83 <find_free_block+0xb3>
		if((free_bitfield[num_blocks/8] & (1 << (i % 8))) == 0){
    19f0:	48 8b 15 81 8d 20 00 	mov    0x208d81(%rip),%rdx        # 20a778 <free_bitfield>
    19f7:	8b 05 6f 8d 20 00    	mov    0x208d6f(%rip),%eax        # 20a76c <num_blocks>
    19fd:	8d 48 07             	lea    0x7(%rax),%ecx
    1a00:	85 c0                	test   %eax,%eax
    1a02:	0f 48 c1             	cmovs  %ecx,%eax
    1a05:	c1 f8 03             	sar    $0x3,%eax
    1a08:	48 98                	cltq   
    1a0a:	48 01 d0             	add    %rdx,%rax
    1a0d:	0f b6 00             	movzbl (%rax),%eax
    1a10:	0f be f0             	movsbl %al,%esi
    1a13:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1a16:	99                   	cltd   
    1a17:	c1 ea 1d             	shr    $0x1d,%edx
    1a1a:	01 d0                	add    %edx,%eax
    1a1c:	83 e0 07             	and    $0x7,%eax
    1a1f:	29 d0                	sub    %edx,%eax
    1a21:	89 c1                	mov    %eax,%ecx
    1a23:	d3 fe                	sar    %cl,%esi
    1a25:	89 f0                	mov    %esi,%eax
    1a27:	83 e0 01             	and    $0x1,%eax
    1a2a:	85 c0                	test   %eax,%eax
    1a2c:	75 51                	jne    1a7f <find_free_block+0xaf>
			free_block = i;
    1a2e:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1a31:	89 45 f8             	mov    %eax,-0x8(%rbp)
			free_bitfield[num_blocks/8] |= (1 << (i % 8));
    1a34:	48 8b 0d 3d 8d 20 00 	mov    0x208d3d(%rip),%rcx        # 20a778 <free_bitfield>
    1a3b:	8b 05 2b 8d 20 00    	mov    0x208d2b(%rip),%eax        # 20a76c <num_blocks>
    1a41:	8d 50 07             	lea    0x7(%rax),%edx
    1a44:	85 c0                	test   %eax,%eax
    1a46:	0f 48 c2             	cmovs  %edx,%eax
    1a49:	c1 f8 03             	sar    $0x3,%eax
    1a4c:	48 63 d0             	movslq %eax,%rdx
    1a4f:	48 8d 34 11          	lea    (%rcx,%rdx,1),%rsi
    1a53:	48 8b 15 1e 8d 20 00 	mov    0x208d1e(%rip),%rdx        # 20a778 <free_bitfield>
    1a5a:	48 98                	cltq   
    1a5c:	48 01 d0             	add    %rdx,%rax
    1a5f:	0f b6 38             	movzbl (%rax),%edi
    1a62:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1a65:	99                   	cltd   
    1a66:	c1 ea 1d             	shr    $0x1d,%edx
    1a69:	01 d0                	add    %edx,%eax
    1a6b:	83 e0 07             	and    $0x7,%eax
    1a6e:	29 d0                	sub    %edx,%eax
    1a70:	ba 01 00 00 00       	mov    $0x1,%edx
    1a75:	89 c1                	mov    %eax,%ecx
    1a77:	d3 e2                	shl    %cl,%edx
    1a79:	89 d0                	mov    %edx,%eax
    1a7b:	09 f8                	or     %edi,%eax
    1a7d:	88 06                	mov    %al,(%rsi)
	for(; i < num_blocks/8; i++){
    1a7f:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
    1a83:	8b 05 e3 8c 20 00    	mov    0x208ce3(%rip),%eax        # 20a76c <num_blocks>
    1a89:	8d 50 07             	lea    0x7(%rax),%edx
    1a8c:	85 c0                	test   %eax,%eax
    1a8e:	0f 48 c2             	cmovs  %edx,%eax
    1a91:	c1 f8 03             	sar    $0x3,%eax
    1a94:	3b 45 fc             	cmp    -0x4(%rbp),%eax
    1a97:	0f 8f 53 ff ff ff    	jg     19f0 <find_free_block+0x20>
		}
	}
	if(i == num_blocks/8) free_block = -1;
    1a9d:	8b 05 c9 8c 20 00    	mov    0x208cc9(%rip),%eax        # 20a76c <num_blocks>
    1aa3:	8d 50 07             	lea    0x7(%rax),%edx
    1aa6:	85 c0                	test   %eax,%eax
    1aa8:	0f 48 c2             	cmovs  %edx,%eax
    1aab:	c1 f8 03             	sar    $0x3,%eax
    1aae:	3b 45 fc             	cmp    -0x4(%rbp),%eax
    1ab1:	75 07                	jne    1aba <find_free_block+0xea>
    1ab3:	c7 45 f8 ff ff ff ff 	movl   $0xffffffff,-0x8(%rbp)
	pthread_mutex_unlock(&free_block_list);
    1aba:	48 8d 3d 7f 26 20 00 	lea    0x20267f(%rip),%rdi        # 204140 <free_block_list>
    1ac1:	e8 da f2 ff ff       	callq  da0 <pthread_mutex_unlock@plt>
	return free_block;
    1ac6:	8b 45 f8             	mov    -0x8(%rbp),%eax
}
    1ac9:	c9                   	leaveq 
    1aca:	c3                   	retq   

0000000000001acb <find_file>:

int find_file(char* name){
    1acb:	55                   	push   %rbp
    1acc:	48 89 e5             	mov    %rsp,%rbp
    1acf:	48 83 ec 20          	sub    $0x20,%rsp
    1ad3:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
	pthread_mutex_lock(&inode_list);//We need to lock here because some thread could make a new file while we traverse the list
    1ad7:	48 8d 3d 02 8d 20 00 	lea    0x208d02(%rip),%rdi        # 20a7e0 <inode_list>
    1ade:	e8 6d f3 ff ff       	callq  e50 <pthread_mutex_lock@plt>
	int i = 0;//Please do not change this! if i is initalized in ther for loop, gcc complains that i is uninitalized at the if statement
    1ae3:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
	for(; i < max_files; i++){
    1aea:	eb 41                	jmp    1b2d <find_file+0x62>
		//if(inodes[i].size >= 0){
			//printf("%s<end>\n%s<end>\n", inodes[i].name, name);
		//}
		if( inodes[i].size >= 0 && (strcmp(inodes[i].name, name) == 0)) break; //strcmp rdeturns zero if the two strings are equal
    1aec:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1aef:	48 98                	cltq   
    1af1:	48 6b d0 5c          	imul   $0x5c,%rax,%rdx
    1af5:	48 8d 05 24 30 20 00 	lea    0x203024(%rip),%rax        # 204b20 <inodes+0x20>
    1afc:	8b 04 02             	mov    (%rdx,%rax,1),%eax
    1aff:	85 c0                	test   %eax,%eax
    1b01:	78 26                	js     1b29 <find_file+0x5e>
    1b03:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1b06:	48 98                	cltq   
    1b08:	48 6b d0 5c          	imul   $0x5c,%rax,%rdx
    1b0c:	48 8d 05 ed 2f 20 00 	lea    0x202fed(%rip),%rax        # 204b00 <inodes>
    1b13:	48 01 c2             	add    %rax,%rdx
    1b16:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1b1a:	48 89 c6             	mov    %rax,%rsi
    1b1d:	48 89 d7             	mov    %rdx,%rdi
    1b20:	e8 4b f2 ff ff       	callq  d70 <strcmp@plt>
    1b25:	85 c0                	test   %eax,%eax
    1b27:	74 0f                	je     1b38 <find_file+0x6d>
	for(; i < max_files; i++){
    1b29:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
    1b2d:	81 7d fc ff 00 00 00 	cmpl   $0xff,-0x4(%rbp)
    1b34:	7e b6                	jle    1aec <find_file+0x21>
    1b36:	eb 01                	jmp    1b39 <find_file+0x6e>
		if( inodes[i].size >= 0 && (strcmp(inodes[i].name, name) == 0)) break; //strcmp rdeturns zero if the two strings are equal
    1b38:	90                   	nop
	}
	if(i == max_files) i = -1; //If not found, return -1
    1b39:	81 7d fc 00 01 00 00 	cmpl   $0x100,-0x4(%rbp)
    1b40:	75 07                	jne    1b49 <find_file+0x7e>
    1b42:	c7 45 fc ff ff ff ff 	movl   $0xffffffff,-0x4(%rbp)
	pthread_mutex_unlock(&inode_list);
    1b49:	48 8d 3d 90 8c 20 00 	lea    0x208c90(%rip),%rdi        # 20a7e0 <inode_list>
    1b50:	e8 4b f2 ff ff       	callq  da0 <pthread_mutex_unlock@plt>
	return i;
    1b55:	8b 45 fc             	mov    -0x4(%rbp),%eax
}
    1b58:	c9                   	leaveq 
    1b59:	c3                   	retq   

0000000000001b5a <create>:

void create(char* name){
    1b5a:	55                   	push   %rbp
    1b5b:	48 89 e5             	mov    %rsp,%rbp
    1b5e:	48 83 ec 70          	sub    $0x70,%rsp
    1b62:	48 89 7d 98          	mov    %rdi,-0x68(%rbp)
	pthread_mutex_lock(&inode_list);//another thread could be creating a file and editting the inode list
    1b66:	48 8d 3d 73 8c 20 00 	lea    0x208c73(%rip),%rdi        # 20a7e0 <inode_list>
    1b6d:	e8 de f2 ff ff       	callq  e50 <pthread_mutex_lock@plt>

	inode newFileInode;
	strcpy(newFileInode.name, name);
    1b72:	48 8b 55 98          	mov    -0x68(%rbp),%rdx
    1b76:	48 8d 45 a0          	lea    -0x60(%rbp),%rax
    1b7a:	48 89 d6             	mov    %rdx,%rsi
    1b7d:	48 89 c7             	mov    %rax,%rdi
    1b80:	e8 2b f1 ff ff       	callq  cb0 <strcpy@plt>
	newFileInode.size = 0;
    1b85:	c7 45 c0 00 00 00 00 	movl   $0x0,-0x40(%rbp)

	if(num_files == max_files){
    1b8c:	8b 05 de 8b 20 00    	mov    0x208bde(%rip),%eax        # 20a770 <num_files>
    1b92:	3d 00 01 00 00       	cmp    $0x100,%eax
    1b97:	75 11                	jne    1baa <create+0x50>
		printf("Error: max number of files reached\n");
    1b99:	48 8d 3d 38 16 00 00 	lea    0x1638(%rip),%rdi        # 31d8 <_IO_stdin_used+0x1e8>
    1ba0:	e8 2b f1 ff ff       	callq  cd0 <puts@plt>
    1ba5:	e9 cf 00 00 00       	jmpq   1c79 <create+0x11f>
		return;
	}

	for(int i =0; i < max_files; i++){
    1baa:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
    1bb1:	e9 aa 00 00 00       	jmpq   1c60 <create+0x106>
		if(inodes[i].size == -1){
    1bb6:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1bb9:	48 98                	cltq   
    1bbb:	48 6b d0 5c          	imul   $0x5c,%rax,%rdx
    1bbf:	48 8d 05 5a 2f 20 00 	lea    0x202f5a(%rip),%rax        # 204b20 <inodes+0x20>
    1bc6:	8b 04 02             	mov    (%rdx,%rax,1),%eax
    1bc9:	83 f8 ff             	cmp    $0xffffffff,%eax
    1bcc:	0f 85 8a 00 00 00    	jne    1c5c <create+0x102>
			inodes[i] = newFileInode;
    1bd2:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1bd5:	48 98                	cltq   
    1bd7:	48 6b d0 5c          	imul   $0x5c,%rax,%rdx
    1bdb:	48 8d 05 1e 2f 20 00 	lea    0x202f1e(%rip),%rax        # 204b00 <inodes>
    1be2:	48 8b 4d a0          	mov    -0x60(%rbp),%rcx
    1be6:	48 89 0c 02          	mov    %rcx,(%rdx,%rax,1)
    1bea:	48 8b 4d a8          	mov    -0x58(%rbp),%rcx
    1bee:	48 89 4c 02 08       	mov    %rcx,0x8(%rdx,%rax,1)
    1bf3:	48 8b 4d b0          	mov    -0x50(%rbp),%rcx
    1bf7:	48 89 4c 02 10       	mov    %rcx,0x10(%rdx,%rax,1)
    1bfc:	48 8b 4d b8          	mov    -0x48(%rbp),%rcx
    1c00:	48 89 4c 02 18       	mov    %rcx,0x18(%rdx,%rax,1)
    1c05:	48 8b 4d c0          	mov    -0x40(%rbp),%rcx
    1c09:	48 89 4c 02 20       	mov    %rcx,0x20(%rdx,%rax,1)
    1c0e:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
    1c12:	48 89 4c 02 28       	mov    %rcx,0x28(%rdx,%rax,1)
    1c17:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
    1c1b:	48 89 4c 02 30       	mov    %rcx,0x30(%rdx,%rax,1)
    1c20:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
    1c24:	48 89 4c 02 38       	mov    %rcx,0x38(%rdx,%rax,1)
    1c29:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
    1c2d:	48 89 4c 02 40       	mov    %rcx,0x40(%rdx,%rax,1)
    1c32:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
    1c36:	48 89 4c 02 48       	mov    %rcx,0x48(%rdx,%rax,1)
    1c3b:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
    1c3f:	48 89 4c 02 50       	mov    %rcx,0x50(%rdx,%rax,1)
    1c44:	8b 4d f8             	mov    -0x8(%rbp),%ecx
    1c47:	89 4c 02 58          	mov    %ecx,0x58(%rdx,%rax,1)
			num_files++;
    1c4b:	8b 05 1f 8b 20 00    	mov    0x208b1f(%rip),%eax        # 20a770 <num_files>
    1c51:	83 c0 01             	add    $0x1,%eax
    1c54:	89 05 16 8b 20 00    	mov    %eax,0x208b16(%rip)        # 20a770 <num_files>
			break;
    1c5a:	eb 11                	jmp    1c6d <create+0x113>
	for(int i =0; i < max_files; i++){
    1c5c:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
    1c60:	81 7d fc ff 00 00 00 	cmpl   $0xff,-0x4(%rbp)
    1c67:	0f 8e 49 ff ff ff    	jle    1bb6 <create+0x5c>
		}
	}
	pthread_mutex_unlock(&inode_list);
    1c6d:	48 8d 3d 6c 8b 20 00 	lea    0x208b6c(%rip),%rdi        # 20a7e0 <inode_list>
    1c74:	e8 27 f1 ff ff       	callq  da0 <pthread_mutex_unlock@plt>
}
    1c79:	c9                   	leaveq 
    1c7a:	c3                   	retq   

0000000000001c7b <import>:

void import(char* new_name, char* unix_name){
    1c7b:	55                   	push   %rbp
    1c7c:	48 89 e5             	mov    %rsp,%rbp
    1c7f:	41 57                	push   %r15
    1c81:	41 56                	push   %r14
    1c83:	41 55                	push   %r13
    1c85:	41 54                	push   %r12
    1c87:	53                   	push   %rbx
    1c88:	48 83 ec 38          	sub    $0x38,%rsp
    1c8c:	48 89 7d a8          	mov    %rdi,-0x58(%rbp)
    1c90:	48 89 75 a0          	mov    %rsi,-0x60(%rbp)
    1c94:	48 89 e0             	mov    %rsp,%rax
    1c97:	48 89 c3             	mov    %rax,%rbx
	int unixFile = open(unix_name, O_RDONLY);
    1c9a:	48 8b 45 a0          	mov    -0x60(%rbp),%rax
    1c9e:	be 00 00 00 00       	mov    $0x0,%esi
    1ca3:	48 89 c7             	mov    %rax,%rdi
    1ca6:	b8 00 00 00 00       	mov    $0x0,%eax
    1cab:	e8 40 f1 ff ff       	callq  df0 <open@plt>
    1cb0:	89 45 c4             	mov    %eax,-0x3c(%rbp)
	if(unixFile == -1){
    1cb3:	83 7d c4 ff          	cmpl   $0xffffffff,-0x3c(%rbp)
    1cb7:	75 16                	jne    1ccf <import+0x54>
		perror("Error: Unix file does not exist");
    1cb9:	48 8d 3d 40 15 00 00 	lea    0x1540(%rip),%rdi        # 3200 <_IO_stdin_used+0x210>
    1cc0:	e8 4b f1 ff ff       	callq  e10 <perror@plt>
		exit(1);
    1cc5:	bf 01 00 00 00       	mov    $0x1,%edi
    1cca:	e8 61 f1 ff ff       	callq  e30 <exit@plt>
	}
	//if file does not exist create it
	if(find_file(new_name) == -1){
    1ccf:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
    1cd3:	48 89 c7             	mov    %rax,%rdi
    1cd6:	e8 f0 fd ff ff       	callq  1acb <find_file>
    1cdb:	83 f8 ff             	cmp    $0xffffffff,%eax
    1cde:	75 0c                	jne    1cec <import+0x71>
		create(new_name);
    1ce0:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
    1ce4:	48 89 c7             	mov    %rax,%rdi
    1ce7:	e8 6e fe ff ff       	callq  1b5a <create>
	}

	//this char array allows us to read a block at a time
	char fileBuffer[block_size];
    1cec:	8b 05 d2 2a 20 00    	mov    0x202ad2(%rip),%eax        # 2047c4 <block_size>
    1cf2:	48 63 d0             	movslq %eax,%rdx
    1cf5:	48 83 ea 01          	sub    $0x1,%rdx
    1cf9:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
    1cfd:	48 63 d0             	movslq %eax,%rdx
    1d00:	49 89 d6             	mov    %rdx,%r14
    1d03:	41 bf 00 00 00 00    	mov    $0x0,%r15d
    1d09:	48 63 d0             	movslq %eax,%rdx
    1d0c:	49 89 d4             	mov    %rdx,%r12
    1d0f:	41 bd 00 00 00 00    	mov    $0x0,%r13d
    1d15:	48 98                	cltq   
    1d17:	ba 10 00 00 00       	mov    $0x10,%edx
    1d1c:	48 83 ea 01          	sub    $0x1,%rdx
    1d20:	48 01 d0             	add    %rdx,%rax
    1d23:	b9 10 00 00 00       	mov    $0x10,%ecx
    1d28:	ba 00 00 00 00       	mov    $0x0,%edx
    1d2d:	48 f7 f1             	div    %rcx
    1d30:	48 6b c0 10          	imul   $0x10,%rax,%rax
    1d34:	48 29 c4             	sub    %rax,%rsp
    1d37:	48 89 e0             	mov    %rsp,%rax
    1d3a:	48 83 c0 00          	add    $0x0,%rax
    1d3e:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
	int i = 0;
    1d42:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%rbp)
	int bytesRead = read(unixFile, fileBuffer, block_size);
    1d49:	8b 05 75 2a 20 00    	mov    0x202a75(%rip),%eax        # 2047c4 <block_size>
    1d4f:	48 63 d0             	movslq %eax,%rdx
    1d52:	48 8b 4d b0          	mov    -0x50(%rbp),%rcx
    1d56:	8b 45 c4             	mov    -0x3c(%rbp),%eax
    1d59:	48 89 ce             	mov    %rcx,%rsi
    1d5c:	89 c7                	mov    %eax,%edi
    1d5e:	e8 ed ef ff ff       	callq  d50 <read@plt>
    1d63:	89 45 c8             	mov    %eax,-0x38(%rbp)
	while(bytesRead){
    1d66:	eb 48                	jmp    1db0 <import+0x135>

		//that way the location is updated based on how much input was taken
		//if it was a whole block it will add block_size
		//else it will just add the amount of bytes read
		write_ssfs(new_name, 'a', i*block_size, bytesRead, fileBuffer);
    1d68:	48 8b 75 b0          	mov    -0x50(%rbp),%rsi
    1d6c:	8b 05 52 2a 20 00    	mov    0x202a52(%rip),%eax        # 2047c4 <block_size>
    1d72:	0f af 45 cc          	imul   -0x34(%rbp),%eax
    1d76:	89 c2                	mov    %eax,%edx
    1d78:	8b 4d c8             	mov    -0x38(%rbp),%ecx
    1d7b:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
    1d7f:	49 89 f0             	mov    %rsi,%r8
    1d82:	be 61 00 00 00       	mov    $0x61,%esi
    1d87:	48 89 c7             	mov    %rax,%rdi
    1d8a:	e8 80 04 00 00       	callq  220f <write_ssfs>
		i++;
    1d8f:	83 45 cc 01          	addl   $0x1,-0x34(%rbp)
		bytesRead = read(unixFile, fileBuffer, block_size);
    1d93:	8b 05 2b 2a 20 00    	mov    0x202a2b(%rip),%eax        # 2047c4 <block_size>
    1d99:	48 63 d0             	movslq %eax,%rdx
    1d9c:	48 8b 4d b0          	mov    -0x50(%rbp),%rcx
    1da0:	8b 45 c4             	mov    -0x3c(%rbp),%eax
    1da3:	48 89 ce             	mov    %rcx,%rsi
    1da6:	89 c7                	mov    %eax,%edi
    1da8:	e8 a3 ef ff ff       	callq  d50 <read@plt>
    1dad:	89 45 c8             	mov    %eax,-0x38(%rbp)
	while(bytesRead){
    1db0:	83 7d c8 00          	cmpl   $0x0,-0x38(%rbp)
    1db4:	75 b2                	jne    1d68 <import+0xed>
	}

	close(unixFile);
    1db6:	8b 45 c4             	mov    -0x3c(%rbp),%eax
    1db9:	89 c7                	mov    %eax,%edi
    1dbb:	e8 80 ef ff ff       	callq  d40 <close@plt>
    1dc0:	48 89 dc             	mov    %rbx,%rsp
}
    1dc3:	90                   	nop
    1dc4:	48 8d 65 d8          	lea    -0x28(%rbp),%rsp
    1dc8:	5b                   	pop    %rbx
    1dc9:	41 5c                	pop    %r12
    1dcb:	41 5d                	pop    %r13
    1dcd:	41 5e                	pop    %r14
    1dcf:	41 5f                	pop    %r15
    1dd1:	5d                   	pop    %rbp
    1dd2:	c3                   	retq   

0000000000001dd3 <cat>:

void cat(char* name){
    1dd3:	55                   	push   %rbp
    1dd4:	48 89 e5             	mov    %rsp,%rbp
    1dd7:	48 83 ec 20          	sub    $0x20,%rsp
    1ddb:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
	int index = find_file(name);
    1ddf:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1de3:	48 89 c7             	mov    %rax,%rdi
    1de6:	e8 e0 fc ff ff       	callq  1acb <find_file>
    1deb:	89 45 fc             	mov    %eax,-0x4(%rbp)
	if(index < 0) {
    1dee:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
    1df2:	79 1a                	jns    1e0e <cat+0x3b>
		printf("File \"%s\" not found!\n",name);
    1df4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1df8:	48 89 c6             	mov    %rax,%rsi
    1dfb:	48 8d 3d 1e 14 00 00 	lea    0x141e(%rip),%rdi        # 3220 <_IO_stdin_used+0x230>
    1e02:	b8 00 00 00 00       	mov    $0x0,%eax
    1e07:	e8 14 ef ff ff       	callq  d20 <printf@plt>
		return;
    1e0c:	eb 24                	jmp    1e32 <cat+0x5f>
	}
	read_ssfs(name, 0, inodes[index].size);
    1e0e:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1e11:	48 98                	cltq   
    1e13:	48 6b d0 5c          	imul   $0x5c,%rax,%rdx
    1e17:	48 8d 05 02 2d 20 00 	lea    0x202d02(%rip),%rax        # 204b20 <inodes+0x20>
    1e1e:	8b 14 02             	mov    (%rdx,%rax,1),%edx
    1e21:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1e25:	be 00 00 00 00       	mov    $0x0,%esi
    1e2a:	48 89 c7             	mov    %rax,%rdi
    1e2d:	e8 b9 0a 00 00       	callq  28eb <read_ssfs>
}
    1e32:	c9                   	leaveq 
    1e33:	c3                   	retq   

0000000000001e34 <erase>:
void erase(char* name){
    1e34:	55                   	push   %rbp
    1e35:	48 89 e5             	mov    %rsp,%rbp
    1e38:	48 81 ec a0 00 00 00 	sub    $0xa0,%rsp
    1e3f:	48 89 bd 68 ff ff ff 	mov    %rdi,-0x98(%rbp)
	int index = find_file(name);
    1e46:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
    1e4d:	48 89 c7             	mov    %rax,%rdi
    1e50:	e8 76 fc ff ff       	callq  1acb <find_file>
    1e55:	89 45 f4             	mov    %eax,-0xc(%rbp)
	inode n;
	if(index > -1){
    1e58:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
    1e5c:	0f 88 81 00 00 00    	js     1ee3 <erase+0xaf>
		n = inodes[index];
    1e62:	8b 45 f4             	mov    -0xc(%rbp),%eax
    1e65:	48 98                	cltq   
    1e67:	48 6b d0 5c          	imul   $0x5c,%rax,%rdx
    1e6b:	48 8d 05 8e 2c 20 00 	lea    0x202c8e(%rip),%rax        # 204b00 <inodes>
    1e72:	48 8b 0c 02          	mov    (%rdx,%rax,1),%rcx
    1e76:	48 89 8d 70 ff ff ff 	mov    %rcx,-0x90(%rbp)
    1e7d:	48 8b 4c 02 08       	mov    0x8(%rdx,%rax,1),%rcx
    1e82:	48 89 8d 78 ff ff ff 	mov    %rcx,-0x88(%rbp)
    1e89:	48 8b 4c 02 10       	mov    0x10(%rdx,%rax,1),%rcx
    1e8e:	48 89 4d 80          	mov    %rcx,-0x80(%rbp)
    1e92:	48 8b 4c 02 18       	mov    0x18(%rdx,%rax,1),%rcx
    1e97:	48 89 4d 88          	mov    %rcx,-0x78(%rbp)
    1e9b:	48 8b 4c 02 20       	mov    0x20(%rdx,%rax,1),%rcx
    1ea0:	48 89 4d 90          	mov    %rcx,-0x70(%rbp)
    1ea4:	48 8b 4c 02 28       	mov    0x28(%rdx,%rax,1),%rcx
    1ea9:	48 89 4d 98          	mov    %rcx,-0x68(%rbp)
    1ead:	48 8b 4c 02 30       	mov    0x30(%rdx,%rax,1),%rcx
    1eb2:	48 89 4d a0          	mov    %rcx,-0x60(%rbp)
    1eb6:	48 8b 4c 02 38       	mov    0x38(%rdx,%rax,1),%rcx
    1ebb:	48 89 4d a8          	mov    %rcx,-0x58(%rbp)
    1ebf:	48 8b 4c 02 40       	mov    0x40(%rdx,%rax,1),%rcx
    1ec4:	48 89 4d b0          	mov    %rcx,-0x50(%rbp)
    1ec8:	48 8b 4c 02 48       	mov    0x48(%rdx,%rax,1),%rcx
    1ecd:	48 89 4d b8          	mov    %rcx,-0x48(%rbp)
    1ed1:	48 8b 4c 02 50       	mov    0x50(%rdx,%rax,1),%rcx
    1ed6:	48 89 4d c0          	mov    %rcx,-0x40(%rbp)
    1eda:	8b 44 02 58          	mov    0x58(%rdx,%rax,1),%eax
    1ede:	89 45 c8             	mov    %eax,-0x38(%rbp)
    1ee1:	eb 1b                	jmp    1efe <erase+0xca>
	} else {
		printf("File %s not found!\n",name);
    1ee3:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
    1eea:	48 89 c6             	mov    %rax,%rsi
    1eed:	48 8d 3d 42 13 00 00 	lea    0x1342(%rip),%rdi        # 3236 <_IO_stdin_used+0x246>
    1ef4:	b8 00 00 00 00       	mov    $0x0,%eax
    1ef9:	e8 22 ee ff ff       	callq  d20 <printf@plt>
	}
	int* indirect = malloc(block_size);
    1efe:	8b 05 c0 28 20 00    	mov    0x2028c0(%rip),%eax        # 2047c4 <block_size>
    1f04:	48 98                	cltq   
    1f06:	48 89 c7             	mov    %rax,%rdi
    1f09:	e8 b2 ee ff ff       	callq  dc0 <malloc@plt>
    1f0e:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
	int* double_indirect = malloc(block_size);
    1f12:	8b 05 ac 28 20 00    	mov    0x2028ac(%rip),%eax        # 2047c4 <block_size>
    1f18:	48 98                	cltq   
    1f1a:	48 89 c7             	mov    %rax,%rdi
    1f1d:	e8 9e ee ff ff       	callq  dc0 <malloc@plt>
    1f22:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
	if(!indirect || !double_indirect){
    1f26:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
    1f2b:	74 07                	je     1f34 <erase+0x100>
    1f2d:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
    1f32:	75 2e                	jne    1f62 <erase+0x12e>
		perror("Allocation for read_ssfs failed!: ");
    1f34:	48 8d 3d 15 13 00 00 	lea    0x1315(%rip),%rdi        # 3250 <_IO_stdin_used+0x260>
    1f3b:	e8 d0 ee ff ff       	callq  e10 <perror@plt>
		free(indirect);
    1f40:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1f44:	48 89 c7             	mov    %rax,%rdi
    1f47:	e8 44 ed ff ff       	callq  c90 <free@plt>
		free(double_indirect);
    1f4c:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    1f50:	48 89 c7             	mov    %rax,%rdi
    1f53:	e8 38 ed ff ff       	callq  c90 <free@plt>
		exit(-1);
    1f58:	bf ff ff ff ff       	mov    $0xffffffff,%edi
    1f5d:	e8 ce ee ff ff       	callq  e30 <exit@plt>
	}
	unsigned int i;
	pthread_mutex_lock(&free_block_list);
    1f62:	48 8d 3d d7 21 20 00 	lea    0x2021d7(%rip),%rdi        # 204140 <free_block_list>
    1f69:	e8 e2 ee ff ff       	callq  e50 <pthread_mutex_lock@plt>
	for(i = 0; i < 12 && i < (unsigned)n.size/block_size; i++){
    1f6e:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
    1f75:	eb 6a                	jmp    1fe1 <erase+0x1ad>
		int block_num = indirect[i - 12];
    1f77:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1f7a:	83 e8 0c             	sub    $0xc,%eax
    1f7d:	89 c0                	mov    %eax,%eax
    1f7f:	48 8d 14 85 00 00 00 	lea    0x0(,%rax,4),%rdx
    1f86:	00 
    1f87:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1f8b:	48 01 d0             	add    %rdx,%rax
    1f8e:	8b 00                	mov    (%rax),%eax
    1f90:	89 45 dc             	mov    %eax,-0x24(%rbp)
		free_bitfield[block_num/8] &= ~(1 << (block_num % 8));
    1f93:	48 8b 0d de 87 20 00 	mov    0x2087de(%rip),%rcx        # 20a778 <free_bitfield>
    1f9a:	8b 45 dc             	mov    -0x24(%rbp),%eax
    1f9d:	8d 50 07             	lea    0x7(%rax),%edx
    1fa0:	85 c0                	test   %eax,%eax
    1fa2:	0f 48 c2             	cmovs  %edx,%eax
    1fa5:	c1 f8 03             	sar    $0x3,%eax
    1fa8:	48 63 d0             	movslq %eax,%rdx
    1fab:	48 8d 34 11          	lea    (%rcx,%rdx,1),%rsi
    1faf:	48 8b 15 c2 87 20 00 	mov    0x2087c2(%rip),%rdx        # 20a778 <free_bitfield>
    1fb6:	48 98                	cltq   
    1fb8:	48 01 d0             	add    %rdx,%rax
    1fbb:	0f b6 38             	movzbl (%rax),%edi
    1fbe:	8b 45 dc             	mov    -0x24(%rbp),%eax
    1fc1:	99                   	cltd   
    1fc2:	c1 ea 1d             	shr    $0x1d,%edx
    1fc5:	01 d0                	add    %edx,%eax
    1fc7:	83 e0 07             	and    $0x7,%eax
    1fca:	29 d0                	sub    %edx,%eax
    1fcc:	ba 01 00 00 00       	mov    $0x1,%edx
    1fd1:	89 c1                	mov    %eax,%ecx
    1fd3:	d3 e2                	shl    %cl,%edx
    1fd5:	89 d0                	mov    %edx,%eax
    1fd7:	f7 d0                	not    %eax
    1fd9:	21 f8                	and    %edi,%eax
    1fdb:	88 06                	mov    %al,(%rsi)
	for(i = 0; i < 12 && i < (unsigned)n.size/block_size; i++){
    1fdd:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
    1fe1:	83 7d fc 0b          	cmpl   $0xb,-0x4(%rbp)
    1fe5:	77 1f                	ja     2006 <erase+0x1d2>
    1fe7:	8b 45 90             	mov    -0x70(%rbp),%eax
    1fea:	89 c2                	mov    %eax,%edx
    1fec:	8b 05 d2 27 20 00    	mov    0x2027d2(%rip),%eax        # 2047c4 <block_size>
    1ff2:	89 c1                	mov    %eax,%ecx
    1ff4:	89 d0                	mov    %edx,%eax
    1ff6:	ba 00 00 00 00       	mov    $0x0,%edx
    1ffb:	f7 f1                	div    %ecx
    1ffd:	3b 45 fc             	cmp    -0x4(%rbp),%eax
    2000:	0f 87 71 ff ff ff    	ja     1f77 <erase+0x143>
	}
	if(i == 12){
    2006:	83 7d fc 0c          	cmpl   $0xc,-0x4(%rbp)
    200a:	0f 85 90 00 00 00    	jne    20a0 <erase+0x26c>
		request(n.indirect, indirect, 'r');
    2010:	8b 45 c4             	mov    -0x3c(%rbp),%eax
    2013:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
    2017:	ba 72 00 00 00       	mov    $0x72,%edx
    201c:	48 89 ce             	mov    %rcx,%rsi
    201f:	89 c7                	mov    %eax,%edi
    2021:	e8 10 f8 ff ff       	callq  1836 <request>
		for(; i < 12 + block_size/sizeof(int); i++){
    2026:	eb 5f                	jmp    2087 <erase+0x253>
			int block_num = n.direct[i];
    2028:	8b 45 fc             	mov    -0x4(%rbp),%eax
    202b:	48 83 c0 08          	add    $0x8,%rax
    202f:	8b 84 85 74 ff ff ff 	mov    -0x8c(%rbp,%rax,4),%eax
    2036:	89 45 d8             	mov    %eax,-0x28(%rbp)
			free_bitfield[block_num/8] &= ~(1 << (block_num % 8));
    2039:	48 8b 0d 38 87 20 00 	mov    0x208738(%rip),%rcx        # 20a778 <free_bitfield>
    2040:	8b 45 d8             	mov    -0x28(%rbp),%eax
    2043:	8d 50 07             	lea    0x7(%rax),%edx
    2046:	85 c0                	test   %eax,%eax
    2048:	0f 48 c2             	cmovs  %edx,%eax
    204b:	c1 f8 03             	sar    $0x3,%eax
    204e:	48 63 d0             	movslq %eax,%rdx
    2051:	48 8d 34 11          	lea    (%rcx,%rdx,1),%rsi
    2055:	48 8b 15 1c 87 20 00 	mov    0x20871c(%rip),%rdx        # 20a778 <free_bitfield>
    205c:	48 98                	cltq   
    205e:	48 01 d0             	add    %rdx,%rax
    2061:	0f b6 38             	movzbl (%rax),%edi
    2064:	8b 45 d8             	mov    -0x28(%rbp),%eax
    2067:	99                   	cltd   
    2068:	c1 ea 1d             	shr    $0x1d,%edx
    206b:	01 d0                	add    %edx,%eax
    206d:	83 e0 07             	and    $0x7,%eax
    2070:	29 d0                	sub    %edx,%eax
    2072:	ba 01 00 00 00       	mov    $0x1,%edx
    2077:	89 c1                	mov    %eax,%ecx
    2079:	d3 e2                	shl    %cl,%edx
    207b:	89 d0                	mov    %edx,%eax
    207d:	f7 d0                	not    %eax
    207f:	21 f8                	and    %edi,%eax
    2081:	88 06                	mov    %al,(%rsi)
		for(; i < 12 + block_size/sizeof(int); i++){
    2083:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
    2087:	8b 45 fc             	mov    -0x4(%rbp),%eax
    208a:	8b 15 34 27 20 00    	mov    0x202734(%rip),%edx        # 2047c4 <block_size>
    2090:	48 63 d2             	movslq %edx,%rdx
    2093:	48 c1 ea 02          	shr    $0x2,%rdx
    2097:	48 83 c2 0c          	add    $0xc,%rdx
    209b:	48 39 d0             	cmp    %rdx,%rax
    209e:	72 88                	jb     2028 <erase+0x1f4>
		}
	}
	if(i == 12 + block_size/sizeof(int)){
    20a0:	8b 45 fc             	mov    -0x4(%rbp),%eax
    20a3:	8b 15 1b 27 20 00    	mov    0x20271b(%rip),%edx        # 2047c4 <block_size>
    20a9:	48 63 d2             	movslq %edx,%rdx
    20ac:	48 c1 ea 02          	shr    $0x2,%rdx
    20b0:	48 83 c2 0c          	add    $0xc,%rdx
    20b4:	48 39 d0             	cmp    %rdx,%rax
    20b7:	0f 85 14 01 00 00    	jne    21d1 <erase+0x39d>
		request(n.double_indirect, double_indirect, 'r');
    20bd:	8b 45 c8             	mov    -0x38(%rbp),%eax
    20c0:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
    20c4:	ba 72 00 00 00       	mov    $0x72,%edx
    20c9:	48 89 ce             	mov    %rcx,%rsi
    20cc:	89 c7                	mov    %eax,%edi
    20ce:	e8 63 f7 ff ff       	callq  1836 <request>
		while(i < 12 + block_size/sizeof(int) + (block_size/sizeof(int)) * (block_size/sizeof(int)) ){
    20d3:	e9 c7 00 00 00       	jmpq   219f <erase+0x36b>
			request(double_indirect[(i - 12 + block_size/sizeof(int)) / block_size], indirect, 'r');
    20d8:	8b 45 fc             	mov    -0x4(%rbp),%eax
    20db:	83 e8 0c             	sub    $0xc,%eax
    20de:	89 c2                	mov    %eax,%edx
    20e0:	8b 05 de 26 20 00    	mov    0x2026de(%rip),%eax        # 2047c4 <block_size>
    20e6:	48 98                	cltq   
    20e8:	48 c1 e8 02          	shr    $0x2,%rax
    20ec:	48 01 d0             	add    %rdx,%rax
    20ef:	8b 15 cf 26 20 00    	mov    0x2026cf(%rip),%edx        # 2047c4 <block_size>
    20f5:	48 63 f2             	movslq %edx,%rsi
    20f8:	ba 00 00 00 00       	mov    $0x0,%edx
    20fd:	48 f7 f6             	div    %rsi
    2100:	48 8d 14 85 00 00 00 	lea    0x0(,%rax,4),%rdx
    2107:	00 
    2108:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    210c:	48 01 d0             	add    %rdx,%rax
    210f:	8b 00                	mov    (%rax),%eax
    2111:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
    2115:	ba 72 00 00 00       	mov    $0x72,%edx
    211a:	48 89 ce             	mov    %rcx,%rsi
    211d:	89 c7                	mov    %eax,%edi
    211f:	e8 12 f7 ff ff       	callq  1836 <request>
			int j = 0;
    2124:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%rbp)
			for(; j < block_size; j++){
    212b:	eb 67                	jmp    2194 <erase+0x360>
				int block_num = indirect[j];
    212d:	8b 45 f8             	mov    -0x8(%rbp),%eax
    2130:	48 98                	cltq   
    2132:	48 8d 14 85 00 00 00 	lea    0x0(,%rax,4),%rdx
    2139:	00 
    213a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    213e:	48 01 d0             	add    %rdx,%rax
    2141:	8b 00                	mov    (%rax),%eax
    2143:	89 45 d4             	mov    %eax,-0x2c(%rbp)
				free_bitfield[block_num/8] &= ~(1 << (block_num % 8));
    2146:	48 8b 0d 2b 86 20 00 	mov    0x20862b(%rip),%rcx        # 20a778 <free_bitfield>
    214d:	8b 45 d4             	mov    -0x2c(%rbp),%eax
    2150:	8d 50 07             	lea    0x7(%rax),%edx
    2153:	85 c0                	test   %eax,%eax
    2155:	0f 48 c2             	cmovs  %edx,%eax
    2158:	c1 f8 03             	sar    $0x3,%eax
    215b:	48 63 d0             	movslq %eax,%rdx
    215e:	48 8d 34 11          	lea    (%rcx,%rdx,1),%rsi
    2162:	48 8b 15 0f 86 20 00 	mov    0x20860f(%rip),%rdx        # 20a778 <free_bitfield>
    2169:	48 98                	cltq   
    216b:	48 01 d0             	add    %rdx,%rax
    216e:	0f b6 38             	movzbl (%rax),%edi
    2171:	8b 45 d4             	mov    -0x2c(%rbp),%eax
    2174:	99                   	cltd   
    2175:	c1 ea 1d             	shr    $0x1d,%edx
    2178:	01 d0                	add    %edx,%eax
    217a:	83 e0 07             	and    $0x7,%eax
    217d:	29 d0                	sub    %edx,%eax
    217f:	ba 01 00 00 00       	mov    $0x1,%edx
    2184:	89 c1                	mov    %eax,%ecx
    2186:	d3 e2                	shl    %cl,%edx
    2188:	89 d0                	mov    %edx,%eax
    218a:	f7 d0                	not    %eax
    218c:	21 f8                	and    %edi,%eax
    218e:	88 06                	mov    %al,(%rsi)
			for(; j < block_size; j++){
    2190:	83 45 f8 01          	addl   $0x1,-0x8(%rbp)
    2194:	8b 05 2a 26 20 00    	mov    0x20262a(%rip),%eax        # 2047c4 <block_size>
    219a:	39 45 f8             	cmp    %eax,-0x8(%rbp)
    219d:	7c 8e                	jl     212d <erase+0x2f9>
		while(i < 12 + block_size/sizeof(int) + (block_size/sizeof(int)) * (block_size/sizeof(int)) ){
    219f:	8b 45 fc             	mov    -0x4(%rbp),%eax
    21a2:	8b 15 1c 26 20 00    	mov    0x20261c(%rip),%edx        # 2047c4 <block_size>
    21a8:	48 63 d2             	movslq %edx,%rdx
    21ab:	48 c1 ea 02          	shr    $0x2,%rdx
    21af:	48 8d 4a 01          	lea    0x1(%rdx),%rcx
    21b3:	8b 15 0b 26 20 00    	mov    0x20260b(%rip),%edx        # 2047c4 <block_size>
    21b9:	48 63 d2             	movslq %edx,%rdx
    21bc:	48 c1 ea 02          	shr    $0x2,%rdx
    21c0:	48 0f af d1          	imul   %rcx,%rdx
    21c4:	48 83 c2 0c          	add    $0xc,%rdx
    21c8:	48 39 d0             	cmp    %rdx,%rax
    21cb:	0f 82 07 ff ff ff    	jb     20d8 <erase+0x2a4>
			}
		}
	}
	pthread_mutex_unlock(&free_block_list);
    21d1:	48 8d 3d 68 1f 20 00 	lea    0x201f68(%rip),%rdi        # 204140 <free_block_list>
    21d8:	e8 c3 eb ff ff       	callq  da0 <pthread_mutex_unlock@plt>
	free(indirect);
    21dd:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    21e1:	48 89 c7             	mov    %rax,%rdi
    21e4:	e8 a7 ea ff ff       	callq  c90 <free@plt>
	free(double_indirect);
    21e9:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    21ed:	48 89 c7             	mov    %rax,%rdi
    21f0:	e8 9b ea ff ff       	callq  c90 <free@plt>
	inodes[index].size = -1;
    21f5:	8b 45 f4             	mov    -0xc(%rbp),%eax
    21f8:	48 98                	cltq   
    21fa:	48 6b d0 5c          	imul   $0x5c,%rax,%rdx
    21fe:	48 8d 05 1b 29 20 00 	lea    0x20291b(%rip),%rax        # 204b20 <inodes+0x20>
    2205:	c7 04 02 ff ff ff ff 	movl   $0xffffffff,(%rdx,%rax,1)
}
    220c:	90                   	nop
    220d:	c9                   	leaveq 
    220e:	c3                   	retq   

000000000000220f <write_ssfs>:



void write_ssfs(char* name, char input, int start_byte, int num_bytes, char* buffer){
    220f:	55                   	push   %rbp
    2210:	48 89 e5             	mov    %rsp,%rbp
    2213:	53                   	push   %rbx
    2214:	48 81 ec d8 00 00 00 	sub    $0xd8,%rsp
    221b:	48 89 bd 38 ff ff ff 	mov    %rdi,-0xc8(%rbp)
    2222:	89 f0                	mov    %esi,%eax
    2224:	89 95 30 ff ff ff    	mov    %edx,-0xd0(%rbp)
    222a:	89 8d 2c ff ff ff    	mov    %ecx,-0xd4(%rbp)
    2230:	4c 89 85 20 ff ff ff 	mov    %r8,-0xe0(%rbp)
    2237:	88 85 34 ff ff ff    	mov    %al,-0xcc(%rbp)

	int index = find_file(name);
    223d:	48 8b 85 38 ff ff ff 	mov    -0xc8(%rbp),%rax
    2244:	48 89 c7             	mov    %rax,%rdi
    2247:	e8 7f f8 ff ff       	callq  1acb <find_file>
    224c:	89 45 d0             	mov    %eax,-0x30(%rbp)
	pthread_mutex_lock(&inode_list);
    224f:	48 8d 3d 8a 85 20 00 	lea    0x20858a(%rip),%rdi        # 20a7e0 <inode_list>
    2256:	e8 f5 eb ff ff       	callq  e50 <pthread_mutex_lock@plt>
	if(index < 0 || start_byte > inodes[index].size) {
    225b:	83 7d d0 00          	cmpl   $0x0,-0x30(%rbp)
    225f:	78 1b                	js     227c <write_ssfs+0x6d>
    2261:	8b 45 d0             	mov    -0x30(%rbp),%eax
    2264:	48 98                	cltq   
    2266:	48 6b d0 5c          	imul   $0x5c,%rax,%rdx
    226a:	48 8d 05 af 28 20 00 	lea    0x2028af(%rip),%rax        # 204b20 <inodes+0x20>
    2271:	8b 04 02             	mov    (%rdx,%rax,1),%eax
    2274:	3b 85 30 ff ff ff    	cmp    -0xd0(%rbp),%eax
    227a:	7d 2c                	jge    22a8 <write_ssfs+0x99>
		printf("File \"%s\" not found!\n",name);
    227c:	48 8b 85 38 ff ff ff 	mov    -0xc8(%rbp),%rax
    2283:	48 89 c6             	mov    %rax,%rsi
    2286:	48 8d 3d 93 0f 00 00 	lea    0xf93(%rip),%rdi        # 3220 <_IO_stdin_used+0x230>
    228d:	b8 00 00 00 00       	mov    $0x0,%eax
    2292:	e8 89 ea ff ff       	callq  d20 <printf@plt>
		pthread_mutex_unlock(&inode_list);
    2297:	48 8d 3d 42 85 20 00 	lea    0x208542(%rip),%rdi        # 20a7e0 <inode_list>
    229e:	e8 fd ea ff ff       	callq  da0 <pthread_mutex_unlock@plt>
    22a3:	e9 39 06 00 00       	jmpq   28e1 <write_ssfs+0x6d2>
		return;
	}

	char* data = (buffer)?buffer:malloc( (num_bytes / block_size + 1) * block_size);  //not an exact ceil, but memory is cheap and floatng point ops are not
    22a8:	48 83 bd 20 ff ff ff 	cmpq   $0x0,-0xe0(%rbp)
    22af:	00 
    22b0:	75 27                	jne    22d9 <write_ssfs+0xca>
    22b2:	8b 1d 0c 25 20 00    	mov    0x20250c(%rip),%ebx        # 2047c4 <block_size>
    22b8:	8b 85 2c ff ff ff    	mov    -0xd4(%rbp),%eax
    22be:	99                   	cltd   
    22bf:	f7 fb                	idiv   %ebx
    22c1:	8d 50 01             	lea    0x1(%rax),%edx
    22c4:	8b 05 fa 24 20 00    	mov    0x2024fa(%rip),%eax        # 2047c4 <block_size>
    22ca:	0f af c2             	imul   %edx,%eax
    22cd:	48 98                	cltq   
    22cf:	48 89 c7             	mov    %rax,%rdi
    22d2:	e8 e9 ea ff ff       	callq  dc0 <malloc@plt>
    22d7:	eb 07                	jmp    22e0 <write_ssfs+0xd1>
    22d9:	48 8b 85 20 ff ff ff 	mov    -0xe0(%rbp),%rax
    22e0:	48 89 45 c8          	mov    %rax,-0x38(%rbp)

	int i;
	if(!buffer){
    22e4:	48 83 bd 20 ff ff ff 	cmpq   $0x0,-0xe0(%rbp)
    22eb:	00 
    22ec:	75 2e                	jne    231c <write_ssfs+0x10d>
		for(i = 0; i < num_bytes; i++) data[i] = input;
    22ee:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%rbp)
    22f5:	eb 1a                	jmp    2311 <write_ssfs+0x102>
    22f7:	8b 45 ec             	mov    -0x14(%rbp),%eax
    22fa:	48 63 d0             	movslq %eax,%rdx
    22fd:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
    2301:	48 01 c2             	add    %rax,%rdx
    2304:	0f b6 85 34 ff ff ff 	movzbl -0xcc(%rbp),%eax
    230b:	88 02                	mov    %al,(%rdx)
    230d:	83 45 ec 01          	addl   $0x1,-0x14(%rbp)
    2311:	8b 45 ec             	mov    -0x14(%rbp),%eax
    2314:	3b 85 2c ff ff ff    	cmp    -0xd4(%rbp),%eax
    231a:	7c db                	jl     22f7 <write_ssfs+0xe8>
	}
	int* indirect = malloc(block_size);
    231c:	8b 05 a2 24 20 00    	mov    0x2024a2(%rip),%eax        # 2047c4 <block_size>
    2322:	48 98                	cltq   
    2324:	48 89 c7             	mov    %rax,%rdi
    2327:	e8 94 ea ff ff       	callq  dc0 <malloc@plt>
    232c:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
	int* double_indirect = malloc(block_size);
    2330:	8b 05 8e 24 20 00    	mov    0x20248e(%rip),%eax        # 2047c4 <block_size>
    2336:	48 98                	cltq   
    2338:	48 89 c7             	mov    %rax,%rdi
    233b:	e8 80 ea ff ff       	callq  dc0 <malloc@plt>
    2340:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
	if(!data || !indirect || !double_indirect){
    2344:	48 83 7d c8 00       	cmpq   $0x0,-0x38(%rbp)
    2349:	74 0e                	je     2359 <write_ssfs+0x14a>
    234b:	48 83 7d c0 00       	cmpq   $0x0,-0x40(%rbp)
    2350:	74 07                	je     2359 <write_ssfs+0x14a>
    2352:	48 83 7d b8 00       	cmpq   $0x0,-0x48(%rbp)
    2357:	75 46                	jne    239f <write_ssfs+0x190>
		perror("Allocation for read_ssfs failed!: ");
    2359:	48 8d 3d f0 0e 00 00 	lea    0xef0(%rip),%rdi        # 3250 <_IO_stdin_used+0x260>
    2360:	e8 ab ea ff ff       	callq  e10 <perror@plt>
		free(data);
    2365:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
    2369:	48 89 c7             	mov    %rax,%rdi
    236c:	e8 1f e9 ff ff       	callq  c90 <free@plt>
		free(indirect);
    2371:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
    2375:	48 89 c7             	mov    %rax,%rdi
    2378:	e8 13 e9 ff ff       	callq  c90 <free@plt>
		free(double_indirect);
    237d:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
    2381:	48 89 c7             	mov    %rax,%rdi
    2384:	e8 07 e9 ff ff       	callq  c90 <free@plt>
		pthread_mutex_unlock(&inode_list);
    2389:	48 8d 3d 50 84 20 00 	lea    0x208450(%rip),%rdi        # 20a7e0 <inode_list>
    2390:	e8 0b ea ff ff       	callq  da0 <pthread_mutex_unlock@plt>
		exit(-1);
    2395:	bf ff ff ff ff       	mov    $0xffffffff,%edi
    239a:	e8 91 ea ff ff       	callq  e30 <exit@plt>
	}
	 //allocate new blocks if necessary
	inode file_inode = inodes[index];
    239f:	8b 45 d0             	mov    -0x30(%rbp),%eax
    23a2:	48 98                	cltq   
    23a4:	48 6b d0 5c          	imul   $0x5c,%rax,%rdx
    23a8:	48 8d 05 51 27 20 00 	lea    0x202751(%rip),%rax        # 204b00 <inodes>
    23af:	48 8b 0c 02          	mov    (%rdx,%rax,1),%rcx
    23b3:	48 89 8d 40 ff ff ff 	mov    %rcx,-0xc0(%rbp)
    23ba:	48 8b 4c 02 08       	mov    0x8(%rdx,%rax,1),%rcx
    23bf:	48 89 8d 48 ff ff ff 	mov    %rcx,-0xb8(%rbp)
    23c6:	48 8b 4c 02 10       	mov    0x10(%rdx,%rax,1),%rcx
    23cb:	48 89 8d 50 ff ff ff 	mov    %rcx,-0xb0(%rbp)
    23d2:	48 8b 4c 02 18       	mov    0x18(%rdx,%rax,1),%rcx
    23d7:	48 89 8d 58 ff ff ff 	mov    %rcx,-0xa8(%rbp)
    23de:	48 8b 4c 02 20       	mov    0x20(%rdx,%rax,1),%rcx
    23e3:	48 89 8d 60 ff ff ff 	mov    %rcx,-0xa0(%rbp)
    23ea:	48 8b 4c 02 28       	mov    0x28(%rdx,%rax,1),%rcx
    23ef:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
    23f6:	48 8b 4c 02 30       	mov    0x30(%rdx,%rax,1),%rcx
    23fb:	48 89 8d 70 ff ff ff 	mov    %rcx,-0x90(%rbp)
    2402:	48 8b 4c 02 38       	mov    0x38(%rdx,%rax,1),%rcx
    2407:	48 89 8d 78 ff ff ff 	mov    %rcx,-0x88(%rbp)
    240e:	48 8b 4c 02 40       	mov    0x40(%rdx,%rax,1),%rcx
    2413:	48 89 4d 80          	mov    %rcx,-0x80(%rbp)
    2417:	48 8b 4c 02 48       	mov    0x48(%rdx,%rax,1),%rcx
    241c:	48 89 4d 88          	mov    %rcx,-0x78(%rbp)
    2420:	48 8b 4c 02 50       	mov    0x50(%rdx,%rax,1),%rcx
    2425:	48 89 4d 90          	mov    %rcx,-0x70(%rbp)
    2429:	8b 44 02 58          	mov    0x58(%rdx,%rax,1),%eax
    242d:	89 45 98             	mov    %eax,-0x68(%rbp)
	int ptrs_per_block = block_size/sizeof(block_ptr);
    2430:	8b 05 8e 23 20 00    	mov    0x20238e(%rip),%eax        # 2047c4 <block_size>
    2436:	48 98                	cltq   
    2438:	48 c1 e8 02          	shr    $0x2,%rax
    243c:	89 45 b4             	mov    %eax,-0x4c(%rbp)
	int old_end_block = file_inode.size / block_size;
    243f:	8b 85 60 ff ff ff    	mov    -0xa0(%rbp),%eax
    2445:	8b 1d 79 23 20 00    	mov    0x202379(%rip),%ebx        # 2047c4 <block_size>
    244b:	99                   	cltd   
    244c:	f7 fb                	idiv   %ebx
    244e:	89 45 e8             	mov    %eax,-0x18(%rbp)
	int new_end_block = (start_byte + num_bytes) / block_size;
    2451:	8b 95 30 ff ff ff    	mov    -0xd0(%rbp),%edx
    2457:	8b 85 2c ff ff ff    	mov    -0xd4(%rbp),%eax
    245d:	01 d0                	add    %edx,%eax
    245f:	8b 1d 5f 23 20 00    	mov    0x20235f(%rip),%ebx        # 2047c4 <block_size>
    2465:	99                   	cltd   
    2466:	f7 fb                	idiv   %ebx
    2468:	89 45 b0             	mov    %eax,-0x50(%rbp)
	for(;old_end_block < new_end_block && old_end_block < 12; old_end_block++){
    246b:	eb 45                	jmp    24b2 <write_ssfs+0x2a3>
		inodes[index].direct[old_end_block] = find_free_block();
    246d:	b8 00 00 00 00       	mov    $0x0,%eax
    2472:	e8 59 f5 ff ff       	callq  19d0 <find_free_block>
    2477:	89 c6                	mov    %eax,%esi
    2479:	8b 45 e8             	mov    -0x18(%rbp),%eax
    247c:	48 63 c8             	movslq %eax,%rcx
    247f:	8b 45 d0             	mov    -0x30(%rbp),%eax
    2482:	48 63 d0             	movslq %eax,%rdx
    2485:	48 89 d0             	mov    %rdx,%rax
    2488:	48 01 c0             	add    %rax,%rax
    248b:	48 01 d0             	add    %rdx,%rax
    248e:	48 c1 e0 03          	shl    $0x3,%rax
    2492:	48 29 d0             	sub    %rdx,%rax
    2495:	48 01 c8             	add    %rcx,%rax
    2498:	48 83 c0 08          	add    $0x8,%rax
    249c:	48 8d 14 85 00 00 00 	lea    0x0(,%rax,4),%rdx
    24a3:	00 
    24a4:	48 8d 05 59 26 20 00 	lea    0x202659(%rip),%rax        # 204b04 <inodes+0x4>
    24ab:	89 34 02             	mov    %esi,(%rdx,%rax,1)
	for(;old_end_block < new_end_block && old_end_block < 12; old_end_block++){
    24ae:	83 45 e8 01          	addl   $0x1,-0x18(%rbp)
    24b2:	8b 45 e8             	mov    -0x18(%rbp),%eax
    24b5:	3b 45 b0             	cmp    -0x50(%rbp),%eax
    24b8:	7d 06                	jge    24c0 <write_ssfs+0x2b1>
    24ba:	83 7d e8 0b          	cmpl   $0xb,-0x18(%rbp)
    24be:	7e ad                	jle    246d <write_ssfs+0x25e>
	}
	if(new_end_block >= 12 && new_end_block < 12 + ptrs_per_block ){ //no point in editing the indirect block if it doesn't have the end of the file
    24c0:	83 7d b0 0b          	cmpl   $0xb,-0x50(%rbp)
    24c4:	0f 8e 86 00 00 00    	jle    2550 <write_ssfs+0x341>
    24ca:	8b 45 b4             	mov    -0x4c(%rbp),%eax
    24cd:	83 c0 0c             	add    $0xc,%eax
    24d0:	3b 45 b0             	cmp    -0x50(%rbp),%eax
    24d3:	7e 7b                	jle    2550 <write_ssfs+0x341>
		request(inodes[index].indirect, indirect, 'r'); //We need to keep the old data
    24d5:	8b 45 d0             	mov    -0x30(%rbp),%eax
    24d8:	48 98                	cltq   
    24da:	48 6b d0 5c          	imul   $0x5c,%rax,%rdx
    24de:	48 8d 05 6f 26 20 00 	lea    0x20266f(%rip),%rax        # 204b54 <inodes+0x54>
    24e5:	8b 04 02             	mov    (%rdx,%rax,1),%eax
    24e8:	48 8b 4d c0          	mov    -0x40(%rbp),%rcx
    24ec:	ba 72 00 00 00       	mov    $0x72,%edx
    24f1:	48 89 ce             	mov    %rcx,%rsi
    24f4:	89 c7                	mov    %eax,%edi
    24f6:	e8 3b f3 ff ff       	callq  1836 <request>
		for(;old_end_block < new_end_block;old_end_block++){
    24fb:	eb 25                	jmp    2522 <write_ssfs+0x313>
			indirect[old_end_block - 12] = find_free_block();
    24fd:	8b 45 e8             	mov    -0x18(%rbp),%eax
    2500:	48 98                	cltq   
    2502:	48 c1 e0 02          	shl    $0x2,%rax
    2506:	48 8d 50 d0          	lea    -0x30(%rax),%rdx
    250a:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
    250e:	48 8d 1c 02          	lea    (%rdx,%rax,1),%rbx
    2512:	b8 00 00 00 00       	mov    $0x0,%eax
    2517:	e8 b4 f4 ff ff       	callq  19d0 <find_free_block>
    251c:	89 03                	mov    %eax,(%rbx)
		for(;old_end_block < new_end_block;old_end_block++){
    251e:	83 45 e8 01          	addl   $0x1,-0x18(%rbp)
    2522:	8b 45 e8             	mov    -0x18(%rbp),%eax
    2525:	3b 45 b0             	cmp    -0x50(%rbp),%eax
    2528:	7c d3                	jl     24fd <write_ssfs+0x2ee>
		}
		request(inodes[index].indirect, indirect, 'w');
    252a:	8b 45 d0             	mov    -0x30(%rbp),%eax
    252d:	48 98                	cltq   
    252f:	48 6b d0 5c          	imul   $0x5c,%rax,%rdx
    2533:	48 8d 05 1a 26 20 00 	lea    0x20261a(%rip),%rax        # 204b54 <inodes+0x54>
    253a:	8b 04 02             	mov    (%rdx,%rax,1),%eax
    253d:	48 8b 4d c0          	mov    -0x40(%rbp),%rcx
    2541:	ba 77 00 00 00       	mov    $0x77,%edx
    2546:	48 89 ce             	mov    %rcx,%rsi
    2549:	89 c7                	mov    %eax,%edi
    254b:	e8 e6 f2 ff ff       	callq  1836 <request>
	}
	if(old_end_block >= 12 + ptrs_per_block){
    2550:	8b 45 b4             	mov    -0x4c(%rbp),%eax
    2553:	83 c0 0c             	add    $0xc,%eax
    2556:	3b 45 e8             	cmp    -0x18(%rbp),%eax
    2559:	0f 8f 36 01 00 00    	jg     2695 <write_ssfs+0x486>
		request(inodes[index].double_indirect, double_indirect, 'r');
    255f:	8b 45 d0             	mov    -0x30(%rbp),%eax
    2562:	48 98                	cltq   
    2564:	48 6b d0 5c          	imul   $0x5c,%rax,%rdx
    2568:	48 8d 05 e9 25 20 00 	lea    0x2025e9(%rip),%rax        # 204b58 <inodes+0x58>
    256f:	8b 04 02             	mov    (%rdx,%rax,1),%eax
    2572:	48 8b 4d b8          	mov    -0x48(%rbp),%rcx
    2576:	ba 72 00 00 00       	mov    $0x72,%edx
    257b:	48 89 ce             	mov    %rcx,%rsi
    257e:	89 c7                	mov    %eax,%edi
    2580:	e8 b1 f2 ff ff       	callq  1836 <request>
		int new_dbl_blk = (new_end_block - 12 - ptrs_per_block)/block_size/block_size;
    2585:	8b 45 b0             	mov    -0x50(%rbp),%eax
    2588:	83 e8 0c             	sub    $0xc,%eax
    258b:	2b 45 b4             	sub    -0x4c(%rbp),%eax
    258e:	8b 1d 30 22 20 00    	mov    0x202230(%rip),%ebx        # 2047c4 <block_size>
    2594:	99                   	cltd   
    2595:	f7 fb                	idiv   %ebx
    2597:	8b 1d 27 22 20 00    	mov    0x202227(%rip),%ebx        # 2047c4 <block_size>
    259d:	99                   	cltd   
    259e:	f7 fb                	idiv   %ebx
    25a0:	89 45 ac             	mov    %eax,-0x54(%rbp)
		int old_dbl_blk = (old_end_block - 12 - ptrs_per_block)/block_size/block_size;
    25a3:	8b 45 e8             	mov    -0x18(%rbp),%eax
    25a6:	83 e8 0c             	sub    $0xc,%eax
    25a9:	2b 45 b4             	sub    -0x4c(%rbp),%eax
    25ac:	8b 1d 12 22 20 00    	mov    0x202212(%rip),%ebx        # 2047c4 <block_size>
    25b2:	99                   	cltd   
    25b3:	f7 fb                	idiv   %ebx
    25b5:	8b 35 09 22 20 00    	mov    0x202209(%rip),%esi        # 2047c4 <block_size>
    25bb:	99                   	cltd   
    25bc:	f7 fe                	idiv   %esi
    25be:	89 45 e4             	mov    %eax,-0x1c(%rbp)
		int k = old_dbl_blk;
    25c1:	8b 45 e4             	mov    -0x1c(%rbp),%eax
    25c4:	89 45 e0             	mov    %eax,-0x20(%rbp)
		for(;k < new_dbl_blk; k++){
    25c7:	eb 25                	jmp    25ee <write_ssfs+0x3df>
			double_indirect[k] = find_free_block();
    25c9:	8b 45 e0             	mov    -0x20(%rbp),%eax
    25cc:	48 98                	cltq   
    25ce:	48 8d 14 85 00 00 00 	lea    0x0(,%rax,4),%rdx
    25d5:	00 
    25d6:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
    25da:	48 8d 1c 02          	lea    (%rdx,%rax,1),%rbx
    25de:	b8 00 00 00 00       	mov    $0x0,%eax
    25e3:	e8 e8 f3 ff ff       	callq  19d0 <find_free_block>
    25e8:	89 03                	mov    %eax,(%rbx)
		for(;k < new_dbl_blk; k++){
    25ea:	83 45 e0 01          	addl   $0x1,-0x20(%rbp)
    25ee:	8b 45 e0             	mov    -0x20(%rbp),%eax
    25f1:	3b 45 ac             	cmp    -0x54(%rbp),%eax
    25f4:	7c d3                	jl     25c9 <write_ssfs+0x3ba>
		}
		request(inodes[index].double_indirect, double_indirect, 'w');
    25f6:	8b 45 d0             	mov    -0x30(%rbp),%eax
    25f9:	48 98                	cltq   
    25fb:	48 6b d0 5c          	imul   $0x5c,%rax,%rdx
    25ff:	48 8d 05 52 25 20 00 	lea    0x202552(%rip),%rax        # 204b58 <inodes+0x58>
    2606:	8b 04 02             	mov    (%rdx,%rax,1),%eax
    2609:	48 8b 4d b8          	mov    -0x48(%rbp),%rcx
    260d:	ba 77 00 00 00       	mov    $0x77,%edx
    2612:	48 89 ce             	mov    %rcx,%rsi
    2615:	89 c7                	mov    %eax,%edi
    2617:	e8 1a f2 ff ff       	callq  1836 <request>
		while(old_dbl_blk < new_dbl_blk){
    261c:	eb 6f                	jmp    268d <write_ssfs+0x47e>
			int m;
			for(m = 0; m < ptrs_per_block && old_end_block < new_end_block; m++){
    261e:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%rbp)
    2625:	eb 29                	jmp    2650 <write_ssfs+0x441>
				old_end_block++;
    2627:	83 45 e8 01          	addl   $0x1,-0x18(%rbp)
				indirect[m] = find_free_block();
    262b:	8b 45 dc             	mov    -0x24(%rbp),%eax
    262e:	48 98                	cltq   
    2630:	48 8d 14 85 00 00 00 	lea    0x0(,%rax,4),%rdx
    2637:	00 
    2638:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
    263c:	48 8d 1c 02          	lea    (%rdx,%rax,1),%rbx
    2640:	b8 00 00 00 00       	mov    $0x0,%eax
    2645:	e8 86 f3 ff ff       	callq  19d0 <find_free_block>
    264a:	89 03                	mov    %eax,(%rbx)
			for(m = 0; m < ptrs_per_block && old_end_block < new_end_block; m++){
    264c:	83 45 dc 01          	addl   $0x1,-0x24(%rbp)
    2650:	8b 45 dc             	mov    -0x24(%rbp),%eax
    2653:	3b 45 b4             	cmp    -0x4c(%rbp),%eax
    2656:	7d 08                	jge    2660 <write_ssfs+0x451>
    2658:	8b 45 e8             	mov    -0x18(%rbp),%eax
    265b:	3b 45 b0             	cmp    -0x50(%rbp),%eax
    265e:	7c c7                	jl     2627 <write_ssfs+0x418>
			}
			request(double_indirect[old_dbl_blk], indirect, 'w');
    2660:	8b 45 e4             	mov    -0x1c(%rbp),%eax
    2663:	48 98                	cltq   
    2665:	48 8d 14 85 00 00 00 	lea    0x0(,%rax,4),%rdx
    266c:	00 
    266d:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
    2671:	48 01 d0             	add    %rdx,%rax
    2674:	8b 00                	mov    (%rax),%eax
    2676:	48 8b 4d c0          	mov    -0x40(%rbp),%rcx
    267a:	ba 77 00 00 00       	mov    $0x77,%edx
    267f:	48 89 ce             	mov    %rcx,%rsi
    2682:	89 c7                	mov    %eax,%edi
    2684:	e8 ad f1 ff ff       	callq  1836 <request>
			old_dbl_blk++;
    2689:	83 45 e4 01          	addl   $0x1,-0x1c(%rbp)
		while(old_dbl_blk < new_dbl_blk){
    268d:	8b 45 e4             	mov    -0x1c(%rbp),%eax
    2690:	3b 45 ac             	cmp    -0x54(%rbp),%eax
    2693:	7c 89                	jl     261e <write_ssfs+0x40f>
		}

	}

	int start_block_ind = start_byte/block_size; //The start byte is in the file's start_block_indth data block
    2695:	8b 1d 29 21 20 00    	mov    0x202129(%rip),%ebx        # 2047c4 <block_size>
    269b:	8b 85 30 ff ff ff    	mov    -0xd0(%rbp),%eax
    26a1:	99                   	cltd   
    26a2:	f7 fb                	idiv   %ebx
    26a4:	89 45 a8             	mov    %eax,-0x58(%rbp)
	int curr_block_ind = start_block_ind;//keep track of which block we need to read from
    26a7:	8b 45 a8             	mov    -0x58(%rbp),%eax
    26aa:	89 45 d8             	mov    %eax,-0x28(%rbp)
	int end_block_ind = (start_byte + num_bytes)/block_size;
    26ad:	8b 95 30 ff ff ff    	mov    -0xd0(%rbp),%edx
    26b3:	8b 85 2c ff ff ff    	mov    -0xd4(%rbp),%eax
    26b9:	01 d0                	add    %edx,%eax
    26bb:	8b 35 03 21 20 00    	mov    0x202103(%rip),%esi        # 2047c4 <block_size>
    26c1:	99                   	cltd   
    26c2:	f7 fe                	idiv   %esi
    26c4:	89 45 a4             	mov    %eax,-0x5c(%rbp)
	for(; curr_block_ind < 12 && curr_block_ind <= end_block_ind; curr_block_ind++){
    26c7:	eb 5d                	jmp    2726 <write_ssfs+0x517>
		request(inodes[index].direct[i], data + curr_block_ind*block_size, 'r');
    26c9:	8b 05 f5 20 20 00    	mov    0x2020f5(%rip),%eax        # 2047c4 <block_size>
    26cf:	0f af 45 d8          	imul   -0x28(%rbp),%eax
    26d3:	48 63 d0             	movslq %eax,%rdx
    26d6:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
    26da:	48 8d 0c 02          	lea    (%rdx,%rax,1),%rcx
    26de:	8b 45 ec             	mov    -0x14(%rbp),%eax
    26e1:	48 63 f0             	movslq %eax,%rsi
    26e4:	8b 45 d0             	mov    -0x30(%rbp),%eax
    26e7:	48 63 d0             	movslq %eax,%rdx
    26ea:	48 89 d0             	mov    %rdx,%rax
    26ed:	48 01 c0             	add    %rax,%rax
    26f0:	48 01 d0             	add    %rdx,%rax
    26f3:	48 c1 e0 03          	shl    $0x3,%rax
    26f7:	48 29 d0             	sub    %rdx,%rax
    26fa:	48 01 f0             	add    %rsi,%rax
    26fd:	48 83 c0 08          	add    $0x8,%rax
    2701:	48 8d 14 85 00 00 00 	lea    0x0(,%rax,4),%rdx
    2708:	00 
    2709:	48 8d 05 f4 23 20 00 	lea    0x2023f4(%rip),%rax        # 204b04 <inodes+0x4>
    2710:	8b 04 02             	mov    (%rdx,%rax,1),%eax
    2713:	ba 72 00 00 00       	mov    $0x72,%edx
    2718:	48 89 ce             	mov    %rcx,%rsi
    271b:	89 c7                	mov    %eax,%edi
    271d:	e8 14 f1 ff ff       	callq  1836 <request>
	for(; curr_block_ind < 12 && curr_block_ind <= end_block_ind; curr_block_ind++){
    2722:	83 45 d8 01          	addl   $0x1,-0x28(%rbp)
    2726:	83 7d d8 0b          	cmpl   $0xb,-0x28(%rbp)
    272a:	7f 08                	jg     2734 <write_ssfs+0x525>
    272c:	8b 45 d8             	mov    -0x28(%rbp),%eax
    272f:	3b 45 a4             	cmp    -0x5c(%rbp),%eax
    2732:	7e 95                	jle    26c9 <write_ssfs+0x4ba>
	}

	if(curr_block_ind == 12){//the 0th through 11th blocks are direct blocks
    2734:	83 7d d8 0c          	cmpl   $0xc,-0x28(%rbp)
    2738:	75 79                	jne    27b3 <write_ssfs+0x5a4>
		request(inodes[index].indirect, indirect, 'r');
    273a:	8b 45 d0             	mov    -0x30(%rbp),%eax
    273d:	48 98                	cltq   
    273f:	48 6b d0 5c          	imul   $0x5c,%rax,%rdx
    2743:	48 8d 05 0a 24 20 00 	lea    0x20240a(%rip),%rax        # 204b54 <inodes+0x54>
    274a:	8b 04 02             	mov    (%rdx,%rax,1),%eax
    274d:	48 8b 4d c0          	mov    -0x40(%rbp),%rcx
    2751:	ba 72 00 00 00       	mov    $0x72,%edx
    2756:	48 89 ce             	mov    %rcx,%rsi
    2759:	89 c7                	mov    %eax,%edi
    275b:	e8 d6 f0 ff ff       	callq  1836 <request>
		for(; curr_block_ind < 12 + ptrs_per_block  && curr_block_ind <= end_block_ind; curr_block_ind++){
    2760:	eb 3e                	jmp    27a0 <write_ssfs+0x591>
		request(indirect[curr_block_ind - 12], data + curr_block_ind*block_size, 'w');
    2762:	8b 05 5c 20 20 00    	mov    0x20205c(%rip),%eax        # 2047c4 <block_size>
    2768:	0f af 45 d8          	imul   -0x28(%rbp),%eax
    276c:	48 63 d0             	movslq %eax,%rdx
    276f:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
    2773:	48 8d 0c 02          	lea    (%rdx,%rax,1),%rcx
    2777:	8b 45 d8             	mov    -0x28(%rbp),%eax
    277a:	48 98                	cltq   
    277c:	48 c1 e0 02          	shl    $0x2,%rax
    2780:	48 8d 50 d0          	lea    -0x30(%rax),%rdx
    2784:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
    2788:	48 01 d0             	add    %rdx,%rax
    278b:	8b 00                	mov    (%rax),%eax
    278d:	ba 77 00 00 00       	mov    $0x77,%edx
    2792:	48 89 ce             	mov    %rcx,%rsi
    2795:	89 c7                	mov    %eax,%edi
    2797:	e8 9a f0 ff ff       	callq  1836 <request>
		for(; curr_block_ind < 12 + ptrs_per_block  && curr_block_ind <= end_block_ind; curr_block_ind++){
    279c:	83 45 d8 01          	addl   $0x1,-0x28(%rbp)
    27a0:	8b 45 b4             	mov    -0x4c(%rbp),%eax
    27a3:	83 c0 0c             	add    $0xc,%eax
    27a6:	3b 45 d8             	cmp    -0x28(%rbp),%eax
    27a9:	7e 08                	jle    27b3 <write_ssfs+0x5a4>
    27ab:	8b 45 d8             	mov    -0x28(%rbp),%eax
    27ae:	3b 45 a4             	cmp    -0x5c(%rbp),%eax
    27b1:	7e af                	jle    2762 <write_ssfs+0x553>

		}
	}
	int indirect_end_block = 12 + ptrs_per_block;
    27b3:	8b 45 b4             	mov    -0x4c(%rbp),%eax
    27b6:	83 c0 0c             	add    $0xc,%eax
    27b9:	89 45 a0             	mov    %eax,-0x60(%rbp)
	if(curr_block_ind == indirect_end_block) {
    27bc:	8b 45 d8             	mov    -0x28(%rbp),%eax
    27bf:	3b 45 a0             	cmp    -0x60(%rbp),%eax
    27c2:	0f 85 cd 00 00 00    	jne    2895 <write_ssfs+0x686>
		request(inodes[index].double_indirect, double_indirect, 'r');
    27c8:	8b 45 d0             	mov    -0x30(%rbp),%eax
    27cb:	48 98                	cltq   
    27cd:	48 6b d0 5c          	imul   $0x5c,%rax,%rdx
    27d1:	48 8d 05 80 23 20 00 	lea    0x202380(%rip),%rax        # 204b58 <inodes+0x58>
    27d8:	8b 04 02             	mov    (%rdx,%rax,1),%eax
    27db:	48 8b 4d b8          	mov    -0x48(%rbp),%rcx
    27df:	ba 72 00 00 00       	mov    $0x72,%edx
    27e4:	48 89 ce             	mov    %rcx,%rsi
    27e7:	89 c7                	mov    %eax,%edi
    27e9:	e8 48 f0 ff ff       	callq  1836 <request>
		while(curr_block_ind < indirect_end_block + ptrs_per_block*ptrs_per_block){
    27ee:	e9 8b 00 00 00       	jmpq   287e <write_ssfs+0x66f>
			request(double_indirect[(curr_block_ind - indirect_end_block) / block_size], indirect, 'r');
    27f3:	8b 45 d8             	mov    -0x28(%rbp),%eax
    27f6:	2b 45 a0             	sub    -0x60(%rbp),%eax
    27f9:	8b 1d c5 1f 20 00    	mov    0x201fc5(%rip),%ebx        # 2047c4 <block_size>
    27ff:	99                   	cltd   
    2800:	f7 fb                	idiv   %ebx
    2802:	48 98                	cltq   
    2804:	48 8d 14 85 00 00 00 	lea    0x0(,%rax,4),%rdx
    280b:	00 
    280c:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
    2810:	48 01 d0             	add    %rdx,%rax
    2813:	8b 00                	mov    (%rax),%eax
    2815:	48 8b 4d c0          	mov    -0x40(%rbp),%rcx
    2819:	ba 72 00 00 00       	mov    $0x72,%edx
    281e:	48 89 ce             	mov    %rcx,%rsi
    2821:	89 c7                	mov    %eax,%edi
    2823:	e8 0e f0 ff ff       	callq  1836 <request>
			for(int i = 0; i < block_size; i++){
    2828:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%rbp)
    282f:	eb 42                	jmp    2873 <write_ssfs+0x664>
				request(indirect[curr_block_ind - 12], data + curr_block_ind*block_size, 'w'); \
    2831:	8b 05 8d 1f 20 00    	mov    0x201f8d(%rip),%eax        # 2047c4 <block_size>
    2837:	0f af 45 d8          	imul   -0x28(%rbp),%eax
    283b:	48 63 d0             	movslq %eax,%rdx
    283e:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
    2842:	48 8d 0c 02          	lea    (%rdx,%rax,1),%rcx
    2846:	8b 45 d8             	mov    -0x28(%rbp),%eax
    2849:	48 98                	cltq   
    284b:	48 c1 e0 02          	shl    $0x2,%rax
    284f:	48 8d 50 d0          	lea    -0x30(%rax),%rdx
    2853:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
    2857:	48 01 d0             	add    %rdx,%rax
    285a:	8b 00                	mov    (%rax),%eax
    285c:	ba 77 00 00 00       	mov    $0x77,%edx
    2861:	48 89 ce             	mov    %rcx,%rsi
    2864:	89 c7                	mov    %eax,%edi
    2866:	e8 cb ef ff ff       	callq  1836 <request>
				curr_block_ind++;
    286b:	83 45 d8 01          	addl   $0x1,-0x28(%rbp)
			for(int i = 0; i < block_size; i++){
    286f:	83 45 d4 01          	addl   $0x1,-0x2c(%rbp)
    2873:	8b 05 4b 1f 20 00    	mov    0x201f4b(%rip),%eax        # 2047c4 <block_size>
    2879:	39 45 d4             	cmp    %eax,-0x2c(%rbp)
    287c:	7c b3                	jl     2831 <write_ssfs+0x622>
		while(curr_block_ind < indirect_end_block + ptrs_per_block*ptrs_per_block){
    287e:	8b 45 b4             	mov    -0x4c(%rbp),%eax
    2881:	0f af 45 b4          	imul   -0x4c(%rbp),%eax
    2885:	89 c2                	mov    %eax,%edx
    2887:	8b 45 a0             	mov    -0x60(%rbp),%eax
    288a:	01 d0                	add    %edx,%eax
    288c:	3b 45 d8             	cmp    -0x28(%rbp),%eax
    288f:	0f 8f 5e ff ff ff    	jg     27f3 <write_ssfs+0x5e4>
			}
		}
	}
	pthread_mutex_unlock(&inode_list);
    2895:	48 8d 3d 44 7f 20 00 	lea    0x207f44(%rip),%rdi        # 20a7e0 <inode_list>
    289c:	e8 ff e4 ff ff       	callq  da0 <pthread_mutex_unlock@plt>
	write(1 ,data + start_byte, num_bytes);
    28a1:	8b 85 2c ff ff ff    	mov    -0xd4(%rbp),%eax
    28a7:	48 98                	cltq   
    28a9:	8b 95 30 ff ff ff    	mov    -0xd0(%rbp),%edx
    28af:	48 63 ca             	movslq %edx,%rcx
    28b2:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
    28b6:	48 01 d1             	add    %rdx,%rcx
    28b9:	48 89 c2             	mov    %rax,%rdx
    28bc:	48 89 ce             	mov    %rcx,%rsi
    28bf:	bf 01 00 00 00       	mov    $0x1,%edi
    28c4:	e8 27 e4 ff ff       	callq  cf0 <write@plt>
	free(data);
    28c9:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
    28cd:	48 89 c7             	mov    %rax,%rdi
    28d0:	e8 bb e3 ff ff       	callq  c90 <free@plt>
	free(indirect);
    28d5:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
    28d9:	48 89 c7             	mov    %rax,%rdi
    28dc:	e8 af e3 ff ff       	callq  c90 <free@plt>

}
    28e1:	48 81 c4 d8 00 00 00 	add    $0xd8,%rsp
    28e8:	5b                   	pop    %rbx
    28e9:	5d                   	pop    %rbp
    28ea:	c3                   	retq   

00000000000028eb <read_ssfs>:
void read_ssfs(char* name, int start_byte, int num_bytes){
    28eb:	55                   	push   %rbp
    28ec:	48 89 e5             	mov    %rsp,%rbp
    28ef:	48 81 ec b0 00 00 00 	sub    $0xb0,%rsp
    28f6:	48 89 bd 58 ff ff ff 	mov    %rdi,-0xa8(%rbp)
    28fd:	89 b5 54 ff ff ff    	mov    %esi,-0xac(%rbp)
    2903:	89 95 50 ff ff ff    	mov    %edx,-0xb0(%rbp)
	int index = find_file(name);
    2909:	48 8b 85 58 ff ff ff 	mov    -0xa8(%rbp),%rax
    2910:	48 89 c7             	mov    %rax,%rdi
    2913:	e8 b3 f1 ff ff       	callq  1acb <find_file>
    2918:	89 45 f4             	mov    %eax,-0xc(%rbp)
	if(index < 0) {
    291b:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
    291f:	79 20                	jns    2941 <read_ssfs+0x56>
		printf("File \"%s\" not found!\n",name);
    2921:	48 8b 85 58 ff ff ff 	mov    -0xa8(%rbp),%rax
    2928:	48 89 c6             	mov    %rax,%rsi
    292b:	48 8d 3d ee 08 00 00 	lea    0x8ee(%rip),%rdi        # 3220 <_IO_stdin_used+0x230>
    2932:	b8 00 00 00 00       	mov    $0x0,%eax
    2937:	e8 e4 e3 ff ff       	callq  d20 <printf@plt>
    293c:	e9 52 03 00 00       	jmpq   2c93 <read_ssfs+0x3a8>
		return;
	}
	pthread_mutex_lock(&inode_list);
    2941:	48 8d 3d 98 7e 20 00 	lea    0x207e98(%rip),%rdi        # 20a7e0 <inode_list>
    2948:	e8 03 e5 ff ff       	callq  e50 <pthread_mutex_lock@plt>
	inode file_inode = inodes[index];
    294d:	8b 45 f4             	mov    -0xc(%rbp),%eax
    2950:	48 98                	cltq   
    2952:	48 6b d0 5c          	imul   $0x5c,%rax,%rdx
    2956:	48 8d 05 a3 21 20 00 	lea    0x2021a3(%rip),%rax        # 204b00 <inodes>
    295d:	48 8b 0c 02          	mov    (%rdx,%rax,1),%rcx
    2961:	48 89 8d 60 ff ff ff 	mov    %rcx,-0xa0(%rbp)
    2968:	48 8b 4c 02 08       	mov    0x8(%rdx,%rax,1),%rcx
    296d:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
    2974:	48 8b 4c 02 10       	mov    0x10(%rdx,%rax,1),%rcx
    2979:	48 89 8d 70 ff ff ff 	mov    %rcx,-0x90(%rbp)
    2980:	48 8b 4c 02 18       	mov    0x18(%rdx,%rax,1),%rcx
    2985:	48 89 8d 78 ff ff ff 	mov    %rcx,-0x88(%rbp)
    298c:	48 8b 4c 02 20       	mov    0x20(%rdx,%rax,1),%rcx
    2991:	48 89 4d 80          	mov    %rcx,-0x80(%rbp)
    2995:	48 8b 4c 02 28       	mov    0x28(%rdx,%rax,1),%rcx
    299a:	48 89 4d 88          	mov    %rcx,-0x78(%rbp)
    299e:	48 8b 4c 02 30       	mov    0x30(%rdx,%rax,1),%rcx
    29a3:	48 89 4d 90          	mov    %rcx,-0x70(%rbp)
    29a7:	48 8b 4c 02 38       	mov    0x38(%rdx,%rax,1),%rcx
    29ac:	48 89 4d 98          	mov    %rcx,-0x68(%rbp)
    29b0:	48 8b 4c 02 40       	mov    0x40(%rdx,%rax,1),%rcx
    29b5:	48 89 4d a0          	mov    %rcx,-0x60(%rbp)
    29b9:	48 8b 4c 02 48       	mov    0x48(%rdx,%rax,1),%rcx
    29be:	48 89 4d a8          	mov    %rcx,-0x58(%rbp)
    29c2:	48 8b 4c 02 50       	mov    0x50(%rdx,%rax,1),%rcx
    29c7:	48 89 4d b0          	mov    %rcx,-0x50(%rbp)
    29cb:	8b 44 02 58          	mov    0x58(%rdx,%rax,1),%eax
    29cf:	89 45 b8             	mov    %eax,-0x48(%rbp)
	pthread_mutex_unlock(&inode_list);
    29d2:	48 8d 3d 07 7e 20 00 	lea    0x207e07(%rip),%rdi        # 20a7e0 <inode_list>
    29d9:	e8 c2 e3 ff ff       	callq  da0 <pthread_mutex_unlock@plt>
	char* data = malloc( (num_bytes + 1) / block_size * block_size); //not an exact ceil, but memory is cheap and floatng point ops are not
    29de:	8b 85 50 ff ff ff    	mov    -0xb0(%rbp),%eax
    29e4:	83 c0 01             	add    $0x1,%eax
    29e7:	8b 35 d7 1d 20 00    	mov    0x201dd7(%rip),%esi        # 2047c4 <block_size>
    29ed:	99                   	cltd   
    29ee:	f7 fe                	idiv   %esi
    29f0:	89 c2                	mov    %eax,%edx
    29f2:	8b 05 cc 1d 20 00    	mov    0x201dcc(%rip),%eax        # 2047c4 <block_size>
    29f8:	0f af c2             	imul   %edx,%eax
    29fb:	48 98                	cltq   
    29fd:	48 89 c7             	mov    %rax,%rdi
    2a00:	e8 bb e3 ff ff       	callq  dc0 <malloc@plt>
    2a05:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
	int* indirect = malloc(block_size);
    2a09:	8b 05 b5 1d 20 00    	mov    0x201db5(%rip),%eax        # 2047c4 <block_size>
    2a0f:	48 98                	cltq   
    2a11:	48 89 c7             	mov    %rax,%rdi
    2a14:	e8 a7 e3 ff ff       	callq  dc0 <malloc@plt>
    2a19:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
	int* double_indirect = malloc(block_size);
    2a1d:	8b 05 a1 1d 20 00    	mov    0x201da1(%rip),%eax        # 2047c4 <block_size>
    2a23:	48 98                	cltq   
    2a25:	48 89 c7             	mov    %rax,%rdi
    2a28:	e8 93 e3 ff ff       	callq  dc0 <malloc@plt>
    2a2d:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
	if(!data || !indirect || !double_indirect){
    2a31:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
    2a36:	74 0e                	je     2a46 <read_ssfs+0x15b>
    2a38:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
    2a3d:	74 07                	je     2a46 <read_ssfs+0x15b>
    2a3f:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
    2a44:	75 3a                	jne    2a80 <read_ssfs+0x195>
		perror("Allocation for read_ssfs failed!: ");
    2a46:	48 8d 3d 03 08 00 00 	lea    0x803(%rip),%rdi        # 3250 <_IO_stdin_used+0x260>
    2a4d:	e8 be e3 ff ff       	callq  e10 <perror@plt>
		free(data);
    2a52:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    2a56:	48 89 c7             	mov    %rax,%rdi
    2a59:	e8 32 e2 ff ff       	callq  c90 <free@plt>
		free(indirect);
    2a5e:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    2a62:	48 89 c7             	mov    %rax,%rdi
    2a65:	e8 26 e2 ff ff       	callq  c90 <free@plt>
		free(double_indirect);
    2a6a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    2a6e:	48 89 c7             	mov    %rax,%rdi
    2a71:	e8 1a e2 ff ff       	callq  c90 <free@plt>
		exit(-1);
    2a76:	bf ff ff ff ff       	mov    $0xffffffff,%edi
    2a7b:	e8 b0 e3 ff ff       	callq  e30 <exit@plt>
	}
	int start_block_ind = start_byte/block_size; //The start byte is in the file's start_block_indth data block
    2a80:	8b 35 3e 1d 20 00    	mov    0x201d3e(%rip),%esi        # 2047c4 <block_size>
    2a86:	8b 85 54 ff ff ff    	mov    -0xac(%rbp),%eax
    2a8c:	99                   	cltd   
    2a8d:	f7 fe                	idiv   %esi
    2a8f:	89 45 d4             	mov    %eax,-0x2c(%rbp)
	int curr_block_ind = start_block_ind;//keep track of which block we need to read from
    2a92:	8b 45 d4             	mov    -0x2c(%rbp),%eax
    2a95:	89 45 fc             	mov    %eax,-0x4(%rbp)
	int end_block_ind = (start_byte + num_bytes)/block_size;
    2a98:	8b 95 54 ff ff ff    	mov    -0xac(%rbp),%edx
    2a9e:	8b 85 50 ff ff ff    	mov    -0xb0(%rbp),%eax
    2aa4:	01 d0                	add    %edx,%eax
    2aa6:	8b 35 18 1d 20 00    	mov    0x201d18(%rip),%esi        # 2047c4 <block_size>
    2aac:	99                   	cltd   
    2aad:	f7 fe                	idiv   %esi
    2aaf:	89 45 d0             	mov    %eax,-0x30(%rbp)
	for(; curr_block_ind < 12 && curr_block_ind <= end_block_ind; curr_block_ind++){
    2ab2:	eb 38                	jmp    2aec <read_ssfs+0x201>
		request(file_inode.direct[curr_block_ind], data + curr_block_ind*block_size, 'r');
    2ab4:	8b 05 0a 1d 20 00    	mov    0x201d0a(%rip),%eax        # 2047c4 <block_size>
    2aba:	0f af 45 fc          	imul   -0x4(%rbp),%eax
    2abe:	48 63 d0             	movslq %eax,%rdx
    2ac1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    2ac5:	48 8d 0c 02          	lea    (%rdx,%rax,1),%rcx
    2ac9:	8b 45 fc             	mov    -0x4(%rbp),%eax
    2acc:	48 98                	cltq   
    2ace:	48 83 c0 08          	add    $0x8,%rax
    2ad2:	8b 84 85 64 ff ff ff 	mov    -0x9c(%rbp,%rax,4),%eax
    2ad9:	ba 72 00 00 00       	mov    $0x72,%edx
    2ade:	48 89 ce             	mov    %rcx,%rsi
    2ae1:	89 c7                	mov    %eax,%edi
    2ae3:	e8 4e ed ff ff       	callq  1836 <request>
	for(; curr_block_ind < 12 && curr_block_ind <= end_block_ind; curr_block_ind++){
    2ae8:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
    2aec:	83 7d fc 0b          	cmpl   $0xb,-0x4(%rbp)
    2af0:	7f 08                	jg     2afa <read_ssfs+0x20f>
    2af2:	8b 45 fc             	mov    -0x4(%rbp),%eax
    2af5:	3b 45 d0             	cmp    -0x30(%rbp),%eax
    2af8:	7e ba                	jle    2ab4 <read_ssfs+0x1c9>
	}
	int ptrs_per_block = block_size/sizeof(block_ptr);
    2afa:	8b 05 c4 1c 20 00    	mov    0x201cc4(%rip),%eax        # 2047c4 <block_size>
    2b00:	48 98                	cltq   
    2b02:	48 c1 e8 02          	shr    $0x2,%rax
    2b06:	89 45 cc             	mov    %eax,-0x34(%rbp)

	if(curr_block_ind == 12){//the 0th through 11th blocks are direct blocks
    2b09:	83 7d fc 0c          	cmpl   $0xc,-0x4(%rbp)
    2b0d:	75 69                	jne    2b78 <read_ssfs+0x28d>
		request(file_inode.indirect, indirect, 'r');
    2b0f:	8b 45 b4             	mov    -0x4c(%rbp),%eax
    2b12:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
    2b16:	ba 72 00 00 00       	mov    $0x72,%edx
    2b1b:	48 89 ce             	mov    %rcx,%rsi
    2b1e:	89 c7                	mov    %eax,%edi
    2b20:	e8 11 ed ff ff       	callq  1836 <request>
		for(; curr_block_ind < 12 + ptrs_per_block  && curr_block_ind <= end_block_ind; curr_block_ind++){
    2b25:	eb 3e                	jmp    2b65 <read_ssfs+0x27a>
		request(indirect[curr_block_ind - 12], data + curr_block_ind*block_size, 'r');
    2b27:	8b 05 97 1c 20 00    	mov    0x201c97(%rip),%eax        # 2047c4 <block_size>
    2b2d:	0f af 45 fc          	imul   -0x4(%rbp),%eax
    2b31:	48 63 d0             	movslq %eax,%rdx
    2b34:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    2b38:	48 8d 0c 02          	lea    (%rdx,%rax,1),%rcx
    2b3c:	8b 45 fc             	mov    -0x4(%rbp),%eax
    2b3f:	48 98                	cltq   
    2b41:	48 c1 e0 02          	shl    $0x2,%rax
    2b45:	48 8d 50 d0          	lea    -0x30(%rax),%rdx
    2b49:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    2b4d:	48 01 d0             	add    %rdx,%rax
    2b50:	8b 00                	mov    (%rax),%eax
    2b52:	ba 72 00 00 00       	mov    $0x72,%edx
    2b57:	48 89 ce             	mov    %rcx,%rsi
    2b5a:	89 c7                	mov    %eax,%edi
    2b5c:	e8 d5 ec ff ff       	callq  1836 <request>
		for(; curr_block_ind < 12 + ptrs_per_block  && curr_block_ind <= end_block_ind; curr_block_ind++){
    2b61:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
    2b65:	8b 45 cc             	mov    -0x34(%rbp),%eax
    2b68:	83 c0 0c             	add    $0xc,%eax
    2b6b:	3b 45 fc             	cmp    -0x4(%rbp),%eax
    2b6e:	7e 08                	jle    2b78 <read_ssfs+0x28d>
    2b70:	8b 45 fc             	mov    -0x4(%rbp),%eax
    2b73:	3b 45 d0             	cmp    -0x30(%rbp),%eax
    2b76:	7e af                	jle    2b27 <read_ssfs+0x23c>

		}
	}
	int indirect_end_block = 12 + ptrs_per_block;
    2b78:	8b 45 cc             	mov    -0x34(%rbp),%eax
    2b7b:	83 c0 0c             	add    $0xc,%eax
    2b7e:	89 45 c8             	mov    %eax,-0x38(%rbp)
	if(curr_block_ind == indirect_end_block) {
    2b81:	8b 45 fc             	mov    -0x4(%rbp),%eax
    2b84:	3b 45 c8             	cmp    -0x38(%rbp),%eax
    2b87:	0f 85 c6 00 00 00    	jne    2c53 <read_ssfs+0x368>
		request(file_inode.double_indirect, double_indirect, 'r');
    2b8d:	8b 45 b8             	mov    -0x48(%rbp),%eax
    2b90:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
    2b94:	ba 72 00 00 00       	mov    $0x72,%edx
    2b99:	48 89 ce             	mov    %rcx,%rsi
    2b9c:	89 c7                	mov    %eax,%edi
    2b9e:	e8 93 ec ff ff       	callq  1836 <request>
		while(curr_block_ind < indirect_end_block + ptrs_per_block*ptrs_per_block){
    2ba3:	e9 94 00 00 00       	jmpq   2c3c <read_ssfs+0x351>
			request(double_indirect[(curr_block_ind - indirect_end_block) / block_size], indirect, 'r');
    2ba8:	8b 45 fc             	mov    -0x4(%rbp),%eax
    2bab:	2b 45 c8             	sub    -0x38(%rbp),%eax
    2bae:	8b 35 10 1c 20 00    	mov    0x201c10(%rip),%esi        # 2047c4 <block_size>
    2bb4:	99                   	cltd   
    2bb5:	f7 fe                	idiv   %esi
    2bb7:	48 98                	cltq   
    2bb9:	48 8d 14 85 00 00 00 	lea    0x0(,%rax,4),%rdx
    2bc0:	00 
    2bc1:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    2bc5:	48 01 d0             	add    %rdx,%rax
    2bc8:	8b 00                	mov    (%rax),%eax
    2bca:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
    2bce:	ba 72 00 00 00       	mov    $0x72,%edx
    2bd3:	48 89 ce             	mov    %rcx,%rsi
    2bd6:	89 c7                	mov    %eax,%edi
    2bd8:	e8 59 ec ff ff       	callq  1836 <request>
			for(int i = 0; i < block_size; i++){
    2bdd:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%rbp)
    2be4:	eb 4b                	jmp    2c31 <read_ssfs+0x346>
				request(indirect[(curr_block_ind - 12) % ptrs_per_block], data + curr_block_ind*block_size, 'r'); \
    2be6:	8b 05 d8 1b 20 00    	mov    0x201bd8(%rip),%eax        # 2047c4 <block_size>
    2bec:	0f af 45 fc          	imul   -0x4(%rbp),%eax
    2bf0:	48 63 d0             	movslq %eax,%rdx
    2bf3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    2bf7:	48 8d 0c 02          	lea    (%rdx,%rax,1),%rcx
    2bfb:	8b 45 fc             	mov    -0x4(%rbp),%eax
    2bfe:	83 e8 0c             	sub    $0xc,%eax
    2c01:	99                   	cltd   
    2c02:	f7 7d cc             	idivl  -0x34(%rbp)
    2c05:	89 d0                	mov    %edx,%eax
    2c07:	48 98                	cltq   
    2c09:	48 8d 14 85 00 00 00 	lea    0x0(,%rax,4),%rdx
    2c10:	00 
    2c11:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    2c15:	48 01 d0             	add    %rdx,%rax
    2c18:	8b 00                	mov    (%rax),%eax
    2c1a:	ba 72 00 00 00       	mov    $0x72,%edx
    2c1f:	48 89 ce             	mov    %rcx,%rsi
    2c22:	89 c7                	mov    %eax,%edi
    2c24:	e8 0d ec ff ff       	callq  1836 <request>
				curr_block_ind++;
    2c29:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
			for(int i = 0; i < block_size; i++){
    2c2d:	83 45 f8 01          	addl   $0x1,-0x8(%rbp)
    2c31:	8b 05 8d 1b 20 00    	mov    0x201b8d(%rip),%eax        # 2047c4 <block_size>
    2c37:	39 45 f8             	cmp    %eax,-0x8(%rbp)
    2c3a:	7c aa                	jl     2be6 <read_ssfs+0x2fb>
		while(curr_block_ind < indirect_end_block + ptrs_per_block*ptrs_per_block){
    2c3c:	8b 45 cc             	mov    -0x34(%rbp),%eax
    2c3f:	0f af 45 cc          	imul   -0x34(%rbp),%eax
    2c43:	89 c2                	mov    %eax,%edx
    2c45:	8b 45 c8             	mov    -0x38(%rbp),%eax
    2c48:	01 d0                	add    %edx,%eax
    2c4a:	3b 45 fc             	cmp    -0x4(%rbp),%eax
    2c4d:	0f 8f 55 ff ff ff    	jg     2ba8 <read_ssfs+0x2bd>
			}
		}
	}
	write(1 ,data + start_byte, num_bytes);
    2c53:	8b 85 50 ff ff ff    	mov    -0xb0(%rbp),%eax
    2c59:	48 98                	cltq   
    2c5b:	8b 95 54 ff ff ff    	mov    -0xac(%rbp),%edx
    2c61:	48 63 ca             	movslq %edx,%rcx
    2c64:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
    2c68:	48 01 d1             	add    %rdx,%rcx
    2c6b:	48 89 c2             	mov    %rax,%rdx
    2c6e:	48 89 ce             	mov    %rcx,%rsi
    2c71:	bf 01 00 00 00       	mov    $0x1,%edi
    2c76:	e8 75 e0 ff ff       	callq  cf0 <write@plt>
	free(data);
    2c7b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    2c7f:	48 89 c7             	mov    %rax,%rdi
    2c82:	e8 09 e0 ff ff       	callq  c90 <free@plt>
	free(indirect);
    2c87:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    2c8b:	48 89 c7             	mov    %rax,%rdi
    2c8e:	e8 fd df ff ff       	callq  c90 <free@plt>
}
    2c93:	c9                   	leaveq 
    2c94:	c3                   	retq   

0000000000002c95 <list>:

void list(){
    2c95:	55                   	push   %rbp
    2c96:	48 89 e5             	mov    %rsp,%rbp
    2c99:	48 83 ec 10          	sub    $0x10,%rsp
	pthread_mutex_lock(&inode_list);
    2c9d:	48 8d 3d 3c 7b 20 00 	lea    0x207b3c(%rip),%rdi        # 20a7e0 <inode_list>
    2ca4:	e8 a7 e1 ff ff       	callq  e50 <pthread_mutex_lock@plt>
	for(int i = 0; i < max_files; i++){
    2ca9:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
    2cb0:	eb 58                	jmp    2d0a <list+0x75>
		if(inodes[i].size >= 0){
    2cb2:	8b 45 fc             	mov    -0x4(%rbp),%eax
    2cb5:	48 98                	cltq   
    2cb7:	48 6b d0 5c          	imul   $0x5c,%rax,%rdx
    2cbb:	48 8d 05 5e 1e 20 00 	lea    0x201e5e(%rip),%rax        # 204b20 <inodes+0x20>
    2cc2:	8b 04 02             	mov    (%rdx,%rax,1),%eax
    2cc5:	85 c0                	test   %eax,%eax
    2cc7:	78 3d                	js     2d06 <list+0x71>
			printf("Name: %s Size: %d\n",inodes[i].name,inodes[i].size);
    2cc9:	8b 45 fc             	mov    -0x4(%rbp),%eax
    2ccc:	48 98                	cltq   
    2cce:	48 6b d0 5c          	imul   $0x5c,%rax,%rdx
    2cd2:	48 8d 05 47 1e 20 00 	lea    0x201e47(%rip),%rax        # 204b20 <inodes+0x20>
    2cd9:	8b 04 02             	mov    (%rdx,%rax,1),%eax
    2cdc:	8b 55 fc             	mov    -0x4(%rbp),%edx
    2cdf:	48 63 d2             	movslq %edx,%rdx
    2ce2:	48 6b ca 5c          	imul   $0x5c,%rdx,%rcx
    2ce6:	48 8d 15 13 1e 20 00 	lea    0x201e13(%rip),%rdx        # 204b00 <inodes>
    2ced:	48 01 d1             	add    %rdx,%rcx
    2cf0:	89 c2                	mov    %eax,%edx
    2cf2:	48 89 ce             	mov    %rcx,%rsi
    2cf5:	48 8d 3d 77 05 00 00 	lea    0x577(%rip),%rdi        # 3273 <_IO_stdin_used+0x283>
    2cfc:	b8 00 00 00 00       	mov    $0x0,%eax
    2d01:	e8 1a e0 ff ff       	callq  d20 <printf@plt>
	for(int i = 0; i < max_files; i++){
    2d06:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
    2d0a:	81 7d fc ff 00 00 00 	cmpl   $0xff,-0x4(%rbp)
    2d11:	7e 9f                	jle    2cb2 <list+0x1d>
		}
	}
	pthread_mutex_unlock(&inode_list);
    2d13:	48 8d 3d c6 7a 20 00 	lea    0x207ac6(%rip),%rdi        # 20a7e0 <inode_list>
    2d1a:	e8 81 e0 ff ff       	callq  da0 <pthread_mutex_unlock@plt>
}
    2d1f:	90                   	nop
    2d20:	c9                   	leaveq 
    2d21:	c3                   	retq   

0000000000002d22 <shutdown>:

void shutdown(){
    2d22:	55                   	push   %rbp
    2d23:	48 89 e5             	mov    %rsp,%rbp
	pthread_cond_signal(&request_end);
    2d26:	48 8d 3d 53 14 20 00 	lea    0x201453(%rip),%rdi        # 204180 <request_end>
    2d2d:	e8 2e e0 ff ff       	callq  d60 <pthread_cond_signal@plt>
}
    2d32:	90                   	nop
    2d33:	5d                   	pop    %rbp
    2d34:	c3                   	retq   

0000000000002d35 <take_request>:
#include "common.h"
#include <unistd.h>
#include <stdio.h>
#include <fcntl.h>

int take_request(){
    2d35:	55                   	push   %rbp
    2d36:	48 89 e5             	mov    %rsp,%rbp
    2d39:	48 83 ec 20          	sub    $0x20,%rsp
	//sleep(1);
	//pthread_mutex_lock(&request_condition_mutex);
	//printf("Do we hold the lock? %d\n", num_requests);
	//while(num_requests <= 0) pthread_cond_wait(&request_fill, &request_condition_mutex);
	//printf("We escaped the wait\n");
	printf("??????\n");
    2d3d:	48 8d 3d 42 05 00 00 	lea    0x542(%rip),%rdi        # 3286 <_IO_stdin_used+0x296>
    2d44:	e8 87 df ff ff       	callq  cd0 <puts@plt>
	//sleep(99999);
	sem_wait(&request_full);
    2d49:	48 8d 3d b0 79 20 00 	lea    0x2079b0(%rip),%rdi        # 20a700 <request_full>
    2d50:	e8 2b e0 ff ff       	callq  d80 <sem_wait@plt>
	printf("Is sched here?\n");
    2d55:	48 8d 3d 31 05 00 00 	lea    0x531(%rip),%rdi        # 328d <_IO_stdin_used+0x29d>
    2d5c:	e8 6f df ff ff       	callq  cd0 <puts@plt>
	sem_wait(&request_condition_mutex);
    2d61:	48 8d 3d 38 7a 20 00 	lea    0x207a38(%rip),%rdi        # 20a7a0 <request_condition_mutex>
    2d68:	e8 13 e0 ff ff       	callq  d80 <sem_wait@plt>
	disk_request next_consumed = pending[next_to_do];
    2d6d:	8b 05 0d 7a 20 00    	mov    0x207a0d(%rip),%eax        # 20a780 <next_to_do>
    2d73:	48 63 d0             	movslq %eax,%rdx
    2d76:	48 89 d0             	mov    %rdx,%rax
    2d79:	48 01 c0             	add    %rax,%rax
    2d7c:	48 01 d0             	add    %rdx,%rax
    2d7f:	48 c1 e0 03          	shl    $0x3,%rax
    2d83:	48 89 c2             	mov    %rax,%rdx
    2d86:	48 8d 05 53 1a 20 00 	lea    0x201a53(%rip),%rax        # 2047e0 <pending>
    2d8d:	48 8b 0c 02          	mov    (%rdx,%rax,1),%rcx
    2d91:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
    2d95:	48 8b 4c 02 08       	mov    0x8(%rdx,%rax,1),%rcx
    2d9a:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
    2d9e:	48 8b 44 02 10       	mov    0x10(%rdx,%rax,1),%rax
    2da3:	48 89 45 f0          	mov    %rax,-0x10(%rbp)

	if (next_consumed.read_write == 's'){
    2da7:	0f b6 45 f0          	movzbl -0x10(%rbp),%eax
    2dab:	3c 73                	cmp    $0x73,%al
    2dad:	75 0a                	jne    2db9 <take_request+0x84>
		return 0; 
    2daf:	b8 00 00 00 00       	mov    $0x0,%eax
    2db4:	e9 de 00 00 00       	jmpq   2e97 <take_request+0x162>
	}
	if (next_consumed.read_write == 'w') write_request(next_consumed.requested, next_consumed.buffer);
    2db9:	0f b6 45 f0          	movzbl -0x10(%rbp),%eax
    2dbd:	3c 77                	cmp    $0x77,%al
    2dbf:	75 16                	jne    2dd7 <take_request+0xa2>
    2dc1:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
    2dc5:	8b 45 e0             	mov    -0x20(%rbp),%eax
    2dc8:	48 89 d6             	mov    %rdx,%rsi
    2dcb:	89 c7                	mov    %eax,%edi
    2dcd:	b8 00 00 00 00       	mov    $0x0,%eax
    2dd2:	e8 c2 00 00 00       	callq  2e99 <write_request>
	if (next_consumed.read_write == 'r') read_request(next_consumed.requested, next_consumed.buffer);
    2dd7:	0f b6 45 f0          	movzbl -0x10(%rbp),%eax
    2ddb:	3c 72                	cmp    $0x72,%al
    2ddd:	75 16                	jne    2df5 <take_request+0xc0>
    2ddf:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
    2de3:	8b 45 e0             	mov    -0x20(%rbp),%eax
    2de6:	48 89 d6             	mov    %rdx,%rsi
    2de9:	89 c7                	mov    %eax,%edi
    2deb:	b8 00 00 00 00       	mov    $0x0,%eax
    2df0:	e8 f5 00 00 00       	callq  2eea <read_request>

	
	int oldnext = next_to_do;
    2df5:	8b 05 85 79 20 00    	mov    0x207985(%rip),%eax        # 20a780 <next_to_do>
    2dfb:	89 45 fc             	mov    %eax,-0x4(%rbp)
	printf("Out: %d\n", oldnext);
    2dfe:	8b 45 fc             	mov    -0x4(%rbp),%eax
    2e01:	89 c6                	mov    %eax,%esi
    2e03:	48 8d 3d 92 04 00 00 	lea    0x492(%rip),%rdi        # 329c <_IO_stdin_used+0x2ac>
    2e0a:	b8 00 00 00 00       	mov    $0x0,%eax
    2e0f:	e8 0c df ff ff       	callq  d20 <printf@plt>
	next_to_do = (next_to_do + 1) % max_requests;
    2e14:	8b 05 66 79 20 00    	mov    0x207966(%rip),%eax        # 20a780 <next_to_do>
    2e1a:	8d 48 01             	lea    0x1(%rax),%ecx
    2e1d:	ba 89 88 88 88       	mov    $0x88888889,%edx
    2e22:	89 c8                	mov    %ecx,%eax
    2e24:	f7 ea                	imul   %edx
    2e26:	8d 04 0a             	lea    (%rdx,%rcx,1),%eax
    2e29:	c1 f8 04             	sar    $0x4,%eax
    2e2c:	89 c2                	mov    %eax,%edx
    2e2e:	89 c8                	mov    %ecx,%eax
    2e30:	c1 f8 1f             	sar    $0x1f,%eax
    2e33:	29 c2                	sub    %eax,%edx
    2e35:	89 d0                	mov    %edx,%eax
    2e37:	6b c0 1e             	imul   $0x1e,%eax,%eax
    2e3a:	29 c1                	sub    %eax,%ecx
    2e3c:	89 c8                	mov    %ecx,%eax
    2e3e:	89 05 3c 79 20 00    	mov    %eax,0x20793c(%rip)        # 20a780 <next_to_do>
	wakeup_arr[oldnext] = 1;
    2e44:	8b 45 fc             	mov    -0x4(%rbp),%eax
    2e47:	48 63 d0             	movslq %eax,%rdx
    2e4a:	48 8d 05 4f 19 20 00 	lea    0x20194f(%rip),%rax        # 2047a0 <wakeup_arr>
    2e51:	c6 04 02 01          	movb   $0x1,(%rdx,%rax,1)
	sem_post(&request_condition_mutex);
    2e55:	48 8d 3d 44 79 20 00 	lea    0x207944(%rip),%rdi        # 20a7a0 <request_condition_mutex>
    2e5c:	e8 6f df ff ff       	callq  dd0 <sem_post@plt>
	sem_post(&request_empty);
    2e61:	48 8d 3d 58 13 20 00 	lea    0x201358(%rip),%rdi        # 2041c0 <request_empty>
    2e68:	e8 63 df ff ff       	callq  dd0 <sem_post@plt>
	//write(writeFd, &oldnext, sizeof(int));
	//pthread_cond_signal(&request_empty);
	pthread_cond_signal(&request_fufilled[oldnext]);
    2e6d:	8b 45 fc             	mov    -0x4(%rbp),%eax
    2e70:	48 63 d0             	movslq %eax,%rdx
    2e73:	48 89 d0             	mov    %rdx,%rax
    2e76:	48 01 c0             	add    %rax,%rax
    2e79:	48 01 d0             	add    %rdx,%rax
    2e7c:	48 c1 e0 04          	shl    $0x4,%rax
    2e80:	48 8d 15 79 13 20 00 	lea    0x201379(%rip),%rdx        # 204200 <request_fufilled>
    2e87:	48 01 d0             	add    %rdx,%rax
    2e8a:	48 89 c7             	mov    %rax,%rdi
    2e8d:	e8 ce de ff ff       	callq  d60 <pthread_cond_signal@plt>
	return 1;
    2e92:	b8 01 00 00 00       	mov    $0x1,%eax
}
    2e97:	c9                   	leaveq 
    2e98:	c3                   	retq   

0000000000002e99 <write_request>:

void write_request(block_ptr bp, void* buffer){
    2e99:	55                   	push   %rbp
    2e9a:	48 89 e5             	mov    %rsp,%rbp
    2e9d:	48 83 ec 10          	sub    $0x10,%rsp
    2ea1:	89 7d fc             	mov    %edi,-0x4(%rbp)
    2ea4:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
	lseek(diskFile, bp*block_size, SEEK_SET);
    2ea8:	8b 05 16 19 20 00    	mov    0x201916(%rip),%eax        # 2047c4 <block_size>
    2eae:	0f af 45 fc          	imul   -0x4(%rbp),%eax
    2eb2:	48 63 c8             	movslq %eax,%rcx
    2eb5:	8b 05 65 78 20 00    	mov    0x207865(%rip),%eax        # 20a720 <diskFile>
    2ebb:	ba 00 00 00 00       	mov    $0x0,%edx
    2ec0:	48 89 ce             	mov    %rcx,%rsi
    2ec3:	89 c7                	mov    %eax,%edi
    2ec5:	e8 66 de ff ff       	callq  d30 <lseek@plt>
	write(diskFile, buffer, block_size);
    2eca:	8b 05 f4 18 20 00    	mov    0x2018f4(%rip),%eax        # 2047c4 <block_size>
    2ed0:	48 63 d0             	movslq %eax,%rdx
    2ed3:	8b 05 47 78 20 00    	mov    0x207847(%rip),%eax        # 20a720 <diskFile>
    2ed9:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
    2edd:	48 89 ce             	mov    %rcx,%rsi
    2ee0:	89 c7                	mov    %eax,%edi
    2ee2:	e8 09 de ff ff       	callq  cf0 <write@plt>
}
    2ee7:	90                   	nop
    2ee8:	c9                   	leaveq 
    2ee9:	c3                   	retq   

0000000000002eea <read_request>:

void read_request(block_ptr bp, void* buffer){
    2eea:	55                   	push   %rbp
    2eeb:	48 89 e5             	mov    %rsp,%rbp
    2eee:	48 83 ec 10          	sub    $0x10,%rsp
    2ef2:	89 7d fc             	mov    %edi,-0x4(%rbp)
    2ef5:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
	lseek(diskFile, bp*block_size, SEEK_SET);
    2ef9:	8b 05 c5 18 20 00    	mov    0x2018c5(%rip),%eax        # 2047c4 <block_size>
    2eff:	0f af 45 fc          	imul   -0x4(%rbp),%eax
    2f03:	48 63 c8             	movslq %eax,%rcx
    2f06:	8b 05 14 78 20 00    	mov    0x207814(%rip),%eax        # 20a720 <diskFile>
    2f0c:	ba 00 00 00 00       	mov    $0x0,%edx
    2f11:	48 89 ce             	mov    %rcx,%rsi
    2f14:	89 c7                	mov    %eax,%edi
    2f16:	e8 15 de ff ff       	callq  d30 <lseek@plt>
	printf("It goes here\n");
    2f1b:	48 8d 3d 83 03 00 00 	lea    0x383(%rip),%rdi        # 32a5 <_IO_stdin_used+0x2b5>
    2f22:	e8 a9 dd ff ff       	callq  cd0 <puts@plt>
	read(diskFile, buffer, block_size);
    2f27:	8b 05 97 18 20 00    	mov    0x201897(%rip),%eax        # 2047c4 <block_size>
    2f2d:	48 63 d0             	movslq %eax,%rdx
    2f30:	8b 05 ea 77 20 00    	mov    0x2077ea(%rip),%eax        # 20a720 <diskFile>
    2f36:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
    2f3a:	48 89 ce             	mov    %rcx,%rsi
    2f3d:	89 c7                	mov    %eax,%edi
    2f3f:	e8 0c de ff ff       	callq  d50 <read@plt>
}
    2f44:	90                   	nop
    2f45:	c9                   	leaveq 
    2f46:	c3                   	retq   

0000000000002f47 <runner>:

void* runner(){
    2f47:	55                   	push   %rbp
    2f48:	48 89 e5             	mov    %rsp,%rbp
	while(take_request());
    2f4b:	90                   	nop
    2f4c:	b8 00 00 00 00       	mov    $0x0,%eax
    2f51:	e8 df fd ff ff       	callq  2d35 <take_request>
    2f56:	85 c0                	test   %eax,%eax
    2f58:	75 f2                	jne    2f4c <runner+0x5>
	pthread_exit(0);
    2f5a:	bf 00 00 00 00       	mov    $0x0,%edi
    2f5f:	e8 4c de ff ff       	callq  db0 <pthread_exit@plt>
    2f64:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    2f6b:	00 00 00 
    2f6e:	66 90                	xchg   %ax,%ax

0000000000002f70 <__libc_csu_init>:
    2f70:	41 57                	push   %r15
    2f72:	41 56                	push   %r14
    2f74:	41 89 ff             	mov    %edi,%r15d
    2f77:	41 55                	push   %r13
    2f79:	41 54                	push   %r12
    2f7b:	4c 8d 25 26 0e 20 00 	lea    0x200e26(%rip),%r12        # 203da8 <__frame_dummy_init_array_entry>
    2f82:	55                   	push   %rbp
    2f83:	48 8d 2d 26 0e 20 00 	lea    0x200e26(%rip),%rbp        # 203db0 <__init_array_end>
    2f8a:	53                   	push   %rbx
    2f8b:	49 89 f6             	mov    %rsi,%r14
    2f8e:	49 89 d5             	mov    %rdx,%r13
    2f91:	4c 29 e5             	sub    %r12,%rbp
    2f94:	48 83 ec 08          	sub    $0x8,%rsp
    2f98:	48 c1 fd 03          	sar    $0x3,%rbp
    2f9c:	e8 c7 dc ff ff       	callq  c68 <_init>
    2fa1:	48 85 ed             	test   %rbp,%rbp
    2fa4:	74 20                	je     2fc6 <__libc_csu_init+0x56>
    2fa6:	31 db                	xor    %ebx,%ebx
    2fa8:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
    2faf:	00 
    2fb0:	4c 89 ea             	mov    %r13,%rdx
    2fb3:	4c 89 f6             	mov    %r14,%rsi
    2fb6:	44 89 ff             	mov    %r15d,%edi
    2fb9:	41 ff 14 dc          	callq  *(%r12,%rbx,8)
    2fbd:	48 83 c3 01          	add    $0x1,%rbx
    2fc1:	48 39 dd             	cmp    %rbx,%rbp
    2fc4:	75 ea                	jne    2fb0 <__libc_csu_init+0x40>
    2fc6:	48 83 c4 08          	add    $0x8,%rsp
    2fca:	5b                   	pop    %rbx
    2fcb:	5d                   	pop    %rbp
    2fcc:	41 5c                	pop    %r12
    2fce:	41 5d                	pop    %r13
    2fd0:	41 5e                	pop    %r14
    2fd2:	41 5f                	pop    %r15
    2fd4:	c3                   	retq   
    2fd5:	90                   	nop
    2fd6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    2fdd:	00 00 00 

0000000000002fe0 <__libc_csu_fini>:
    2fe0:	f3 c3                	repz retq 

Disassembly of section .fini:

0000000000002fe4 <_fini>:
    2fe4:	48 83 ec 08          	sub    $0x8,%rsp
    2fe8:	48 83 c4 08          	add    $0x8,%rsp
    2fec:	c3                   	retq   
