
disk_sched.o:     file format elf64-x86-64


Disassembly of section .text:

0000000000000000 <take_request>:
#include "common.h"
#include <unistd.h>
#include <stdio.h>
#include <fcntl.h>

int take_request(){
   0:	55                   	push   %rbp
   1:	48 89 e5             	mov    %rsp,%rbp
   4:	48 83 ec 20          	sub    $0x20,%rsp
	//sleep(1);
	//pthread_mutex_lock(&request_condition_mutex);
	//printf("Do we hold the lock? %d\n", num_requests);
	//while(num_requests <= 0) pthread_cond_wait(&request_fill, &request_condition_mutex);
	//printf("We escaped the wait\n");
	printf("??????\n");
   8:	48 8d 3d 00 00 00 00 	lea    0x0(%rip),%rdi        # f <take_request+0xf>
   f:	e8 00 00 00 00       	callq  14 <take_request+0x14>
	//sleep(99999);
	sem_wait(&request_full);
  14:	48 8d 3d 00 00 00 00 	lea    0x0(%rip),%rdi        # 1b <take_request+0x1b>
  1b:	e8 00 00 00 00       	callq  20 <take_request+0x20>
	printf("Is sched here?\n");
  20:	48 8d 3d 00 00 00 00 	lea    0x0(%rip),%rdi        # 27 <take_request+0x27>
  27:	e8 00 00 00 00       	callq  2c <take_request+0x2c>
	sem_wait(&request_condition_mutex);
  2c:	48 8d 3d 00 00 00 00 	lea    0x0(%rip),%rdi        # 33 <take_request+0x33>
  33:	e8 00 00 00 00       	callq  38 <take_request+0x38>
	disk_request next_consumed = pending[next_to_do];
  38:	8b 05 00 00 00 00    	mov    0x0(%rip),%eax        # 3e <take_request+0x3e>
  3e:	48 63 d0             	movslq %eax,%rdx
  41:	48 89 d0             	mov    %rdx,%rax
  44:	48 01 c0             	add    %rax,%rax
  47:	48 01 d0             	add    %rdx,%rax
  4a:	48 c1 e0 03          	shl    $0x3,%rax
  4e:	48 89 c2             	mov    %rax,%rdx
  51:	48 8d 05 00 00 00 00 	lea    0x0(%rip),%rax        # 58 <take_request+0x58>
  58:	48 8b 0c 02          	mov    (%rdx,%rax,1),%rcx
  5c:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
  60:	48 8b 4c 02 08       	mov    0x8(%rdx,%rax,1),%rcx
  65:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  69:	48 8b 44 02 10       	mov    0x10(%rdx,%rax,1),%rax
  6e:	48 89 45 f0          	mov    %rax,-0x10(%rbp)

	if (next_consumed.read_write == 's'){
  72:	0f b6 45 f0          	movzbl -0x10(%rbp),%eax
  76:	3c 73                	cmp    $0x73,%al
  78:	75 0a                	jne    84 <take_request+0x84>
		return 0; 
  7a:	b8 00 00 00 00       	mov    $0x0,%eax
  7f:	e9 de 00 00 00       	jmpq   162 <take_request+0x162>
	}
	if (next_consumed.read_write == 'w') write_request(next_consumed.requested, next_consumed.buffer);
  84:	0f b6 45 f0          	movzbl -0x10(%rbp),%eax
  88:	3c 77                	cmp    $0x77,%al
  8a:	75 16                	jne    a2 <take_request+0xa2>
  8c:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  90:	8b 45 e0             	mov    -0x20(%rbp),%eax
  93:	48 89 d6             	mov    %rdx,%rsi
  96:	89 c7                	mov    %eax,%edi
  98:	b8 00 00 00 00       	mov    $0x0,%eax
  9d:	e8 00 00 00 00       	callq  a2 <take_request+0xa2>
	if (next_consumed.read_write == 'r') read_request(next_consumed.requested, next_consumed.buffer);
  a2:	0f b6 45 f0          	movzbl -0x10(%rbp),%eax
  a6:	3c 72                	cmp    $0x72,%al
  a8:	75 16                	jne    c0 <take_request+0xc0>
  aa:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  ae:	8b 45 e0             	mov    -0x20(%rbp),%eax
  b1:	48 89 d6             	mov    %rdx,%rsi
  b4:	89 c7                	mov    %eax,%edi
  b6:	b8 00 00 00 00       	mov    $0x0,%eax
  bb:	e8 00 00 00 00       	callq  c0 <take_request+0xc0>

	
	int oldnext = next_to_do;
  c0:	8b 05 00 00 00 00    	mov    0x0(%rip),%eax        # c6 <take_request+0xc6>
  c6:	89 45 fc             	mov    %eax,-0x4(%rbp)
	printf("Out: %d\n", oldnext);
  c9:	8b 45 fc             	mov    -0x4(%rbp),%eax
  cc:	89 c6                	mov    %eax,%esi
  ce:	48 8d 3d 00 00 00 00 	lea    0x0(%rip),%rdi        # d5 <take_request+0xd5>
  d5:	b8 00 00 00 00       	mov    $0x0,%eax
  da:	e8 00 00 00 00       	callq  df <take_request+0xdf>
	next_to_do = (next_to_do + 1) % max_requests;
  df:	8b 05 00 00 00 00    	mov    0x0(%rip),%eax        # e5 <take_request+0xe5>
  e5:	8d 48 01             	lea    0x1(%rax),%ecx
  e8:	ba 89 88 88 88       	mov    $0x88888889,%edx
  ed:	89 c8                	mov    %ecx,%eax
  ef:	f7 ea                	imul   %edx
  f1:	8d 04 0a             	lea    (%rdx,%rcx,1),%eax
  f4:	c1 f8 04             	sar    $0x4,%eax
  f7:	89 c2                	mov    %eax,%edx
  f9:	89 c8                	mov    %ecx,%eax
  fb:	c1 f8 1f             	sar    $0x1f,%eax
  fe:	29 c2                	sub    %eax,%edx
 100:	89 d0                	mov    %edx,%eax
 102:	6b c0 1e             	imul   $0x1e,%eax,%eax
 105:	29 c1                	sub    %eax,%ecx
 107:	89 c8                	mov    %ecx,%eax
 109:	89 05 00 00 00 00    	mov    %eax,0x0(%rip)        # 10f <take_request+0x10f>
	wakeup_arr[oldnext] = 1;
 10f:	8b 45 fc             	mov    -0x4(%rbp),%eax
 112:	48 63 d0             	movslq %eax,%rdx
 115:	48 8d 05 00 00 00 00 	lea    0x0(%rip),%rax        # 11c <take_request+0x11c>
 11c:	c6 04 02 01          	movb   $0x1,(%rdx,%rax,1)
	sem_post(&request_condition_mutex);
 120:	48 8d 3d 00 00 00 00 	lea    0x0(%rip),%rdi        # 127 <take_request+0x127>
 127:	e8 00 00 00 00       	callq  12c <take_request+0x12c>
	sem_post(&request_empty);
 12c:	48 8d 3d 00 00 00 00 	lea    0x0(%rip),%rdi        # 133 <take_request+0x133>
 133:	e8 00 00 00 00       	callq  138 <take_request+0x138>
	//write(writeFd, &oldnext, sizeof(int));
	//pthread_cond_signal(&request_empty);
	pthread_cond_signal(&request_fufilled[oldnext]);
 138:	8b 45 fc             	mov    -0x4(%rbp),%eax
 13b:	48 63 d0             	movslq %eax,%rdx
 13e:	48 89 d0             	mov    %rdx,%rax
 141:	48 01 c0             	add    %rax,%rax
 144:	48 01 d0             	add    %rdx,%rax
 147:	48 c1 e0 04          	shl    $0x4,%rax
 14b:	48 8d 15 00 00 00 00 	lea    0x0(%rip),%rdx        # 152 <take_request+0x152>
 152:	48 01 d0             	add    %rdx,%rax
 155:	48 89 c7             	mov    %rax,%rdi
 158:	e8 00 00 00 00       	callq  15d <take_request+0x15d>
	return 1;
 15d:	b8 01 00 00 00       	mov    $0x1,%eax
}
 162:	c9                   	leaveq 
 163:	c3                   	retq   

0000000000000164 <write_request>:

void write_request(block_ptr bp, void* buffer){
 164:	55                   	push   %rbp
 165:	48 89 e5             	mov    %rsp,%rbp
 168:	48 83 ec 10          	sub    $0x10,%rsp
 16c:	89 7d fc             	mov    %edi,-0x4(%rbp)
 16f:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
	lseek(diskFile, bp*block_size, SEEK_SET);
 173:	8b 05 00 00 00 00    	mov    0x0(%rip),%eax        # 179 <write_request+0x15>
 179:	0f af 45 fc          	imul   -0x4(%rbp),%eax
 17d:	48 63 c8             	movslq %eax,%rcx
 180:	8b 05 00 00 00 00    	mov    0x0(%rip),%eax        # 186 <write_request+0x22>
 186:	ba 00 00 00 00       	mov    $0x0,%edx
 18b:	48 89 ce             	mov    %rcx,%rsi
 18e:	89 c7                	mov    %eax,%edi
 190:	e8 00 00 00 00       	callq  195 <write_request+0x31>
	write(diskFile, buffer, block_size);
 195:	8b 05 00 00 00 00    	mov    0x0(%rip),%eax        # 19b <write_request+0x37>
 19b:	48 63 d0             	movslq %eax,%rdx
 19e:	8b 05 00 00 00 00    	mov    0x0(%rip),%eax        # 1a4 <write_request+0x40>
 1a4:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
 1a8:	48 89 ce             	mov    %rcx,%rsi
 1ab:	89 c7                	mov    %eax,%edi
 1ad:	e8 00 00 00 00       	callq  1b2 <write_request+0x4e>
}
 1b2:	90                   	nop
 1b3:	c9                   	leaveq 
 1b4:	c3                   	retq   

00000000000001b5 <read_request>:

void read_request(block_ptr bp, void* buffer){
 1b5:	55                   	push   %rbp
 1b6:	48 89 e5             	mov    %rsp,%rbp
 1b9:	48 83 ec 10          	sub    $0x10,%rsp
 1bd:	89 7d fc             	mov    %edi,-0x4(%rbp)
 1c0:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
	lseek(diskFile, bp*block_size, SEEK_SET);
 1c4:	8b 05 00 00 00 00    	mov    0x0(%rip),%eax        # 1ca <read_request+0x15>
 1ca:	0f af 45 fc          	imul   -0x4(%rbp),%eax
 1ce:	48 63 c8             	movslq %eax,%rcx
 1d1:	8b 05 00 00 00 00    	mov    0x0(%rip),%eax        # 1d7 <read_request+0x22>
 1d7:	ba 00 00 00 00       	mov    $0x0,%edx
 1dc:	48 89 ce             	mov    %rcx,%rsi
 1df:	89 c7                	mov    %eax,%edi
 1e1:	e8 00 00 00 00       	callq  1e6 <read_request+0x31>
	printf("It goes here\n");
 1e6:	48 8d 3d 00 00 00 00 	lea    0x0(%rip),%rdi        # 1ed <read_request+0x38>
 1ed:	e8 00 00 00 00       	callq  1f2 <read_request+0x3d>
	read(diskFile, buffer, block_size);
 1f2:	8b 05 00 00 00 00    	mov    0x0(%rip),%eax        # 1f8 <read_request+0x43>
 1f8:	48 63 d0             	movslq %eax,%rdx
 1fb:	8b 05 00 00 00 00    	mov    0x0(%rip),%eax        # 201 <read_request+0x4c>
 201:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
 205:	48 89 ce             	mov    %rcx,%rsi
 208:	89 c7                	mov    %eax,%edi
 20a:	e8 00 00 00 00       	callq  20f <read_request+0x5a>
}
 20f:	90                   	nop
 210:	c9                   	leaveq 
 211:	c3                   	retq   

0000000000000212 <runner>:

void* runner(){
 212:	55                   	push   %rbp
 213:	48 89 e5             	mov    %rsp,%rbp
	while(take_request());
 216:	90                   	nop
 217:	b8 00 00 00 00       	mov    $0x0,%eax
 21c:	e8 00 00 00 00       	callq  221 <runner+0xf>
 221:	85 c0                	test   %eax,%eax
 223:	75 f2                	jne    217 <runner+0x5>
	pthread_exit(0);
 225:	bf 00 00 00 00       	mov    $0x0,%edi
 22a:	e8 00 00 00 00       	callq  22f <runner+0x1d>
