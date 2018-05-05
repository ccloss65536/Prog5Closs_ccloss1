
disk_ops.o:     file format elf64-x86-64


Disassembly of section .text:

0000000000000000 <request>:
#include <sys/stat.h>
#include <stdio.h>
#include <unistd.h>

//Puts a request for the disk scheduler into the array
void request(block_ptr block, void* buffer, char read_write){
       0:	55                   	push   %rbp
       1:	48 89 e5             	mov    %rsp,%rbp
       4:	48 83 ec 30          	sub    $0x30,%rsp
       8:	89 7d dc             	mov    %edi,-0x24(%rbp)
       b:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
       f:	89 d0                	mov    %edx,%eax
      11:	88 45 d8             	mov    %al,-0x28(%rbp)
	//pthread_mutex_lock(&request_condition_mutex);
	//while(num_requests >= max_requests) pthread_cond_wait(&request_empty, &request_condition_mutex);
	sem_wait(&request_empty);
      14:	48 8d 3d 00 00 00 00 	lea    0x0(%rip),%rdi        # 1b <request+0x1b>
      1b:	e8 00 00 00 00       	callq  20 <request+0x20>
	printf("Uhhhhhhhhhhh...\n");
      20:	48 8d 3d 00 00 00 00 	lea    0x0(%rip),%rdi        # 27 <request+0x27>
      27:	e8 00 00 00 00       	callq  2c <request+0x2c>
	sem_wait(&request_condition_mutex);
      2c:	48 8d 3d 00 00 00 00 	lea    0x0(%rip),%rdi        # 33 <request+0x33>
      33:	e8 00 00 00 00       	callq  38 <request+0x38>
	printf("Why does this not work!?!?!?!?\n");
      38:	48 8d 3d 00 00 00 00 	lea    0x0(%rip),%rdi        # 3f <request+0x3f>
      3f:	e8 00 00 00 00       	callq  44 <request+0x44>

	int oldrequest = next_free_request;
      44:	8b 05 00 00 00 00    	mov    0x0(%rip),%eax        # 4a <request+0x4a>
      4a:	89 45 fc             	mov    %eax,-0x4(%rbp)
	printf("In: %d\n", oldrequest); 
      4d:	8b 45 fc             	mov    -0x4(%rbp),%eax
      50:	89 c6                	mov    %eax,%esi
      52:	48 8d 3d 00 00 00 00 	lea    0x0(%rip),%rdi        # 59 <request+0x59>
      59:	b8 00 00 00 00       	mov    $0x0,%eax
      5e:	e8 00 00 00 00       	callq  63 <request+0x63>

	disk_request newRequest;
	newRequest.requested = block;
      63:	8b 45 dc             	mov    -0x24(%rbp),%eax
      66:	89 45 e0             	mov    %eax,-0x20(%rbp)
	newRequest.buffer = buffer;
      69:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
      6d:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
	newRequest.read_write = read_write;
      71:	0f b6 45 d8          	movzbl -0x28(%rbp),%eax
      75:	88 45 f0             	mov    %al,-0x10(%rbp)
	pending[next_free_request] = newRequest;
      78:	8b 05 00 00 00 00    	mov    0x0(%rip),%eax        # 7e <request+0x7e>
      7e:	48 63 d0             	movslq %eax,%rdx
      81:	48 89 d0             	mov    %rdx,%rax
      84:	48 01 c0             	add    %rax,%rax
      87:	48 01 d0             	add    %rdx,%rax
      8a:	48 c1 e0 03          	shl    $0x3,%rax
      8e:	48 89 c2             	mov    %rax,%rdx
      91:	48 8d 05 00 00 00 00 	lea    0x0(%rip),%rax        # 98 <request+0x98>
      98:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
      9c:	48 89 0c 02          	mov    %rcx,(%rdx,%rax,1)
      a0:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
      a4:	48 89 4c 02 08       	mov    %rcx,0x8(%rdx,%rax,1)
      a9:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
      ad:	48 89 4c 02 10       	mov    %rcx,0x10(%rdx,%rax,1)
	printf("Write to array\n");
      b2:	48 8d 3d 00 00 00 00 	lea    0x0(%rip),%rdi        # b9 <request+0xb9>
      b9:	e8 00 00 00 00       	callq  be <request+0xbe>
	next_free_request = (next_free_request + 1) % max_requests;
      be:	8b 05 00 00 00 00    	mov    0x0(%rip),%eax        # c4 <request+0xc4>
      c4:	8d 48 01             	lea    0x1(%rax),%ecx
      c7:	ba 89 88 88 88       	mov    $0x88888889,%edx
      cc:	89 c8                	mov    %ecx,%eax
      ce:	f7 ea                	imul   %edx
      d0:	8d 04 0a             	lea    (%rdx,%rcx,1),%eax
      d3:	c1 f8 04             	sar    $0x4,%eax
      d6:	89 c2                	mov    %eax,%edx
      d8:	89 c8                	mov    %ecx,%eax
      da:	c1 f8 1f             	sar    $0x1f,%eax
      dd:	29 c2                	sub    %eax,%edx
      df:	89 d0                	mov    %edx,%eax
      e1:	6b c0 1e             	imul   $0x1e,%eax,%eax
      e4:	29 c1                	sub    %eax,%ecx
      e6:	89 c8                	mov    %ecx,%eax
      e8:	89 05 00 00 00 00    	mov    %eax,0x0(%rip)        # ee <request+0xee>
	
	sem_post(&request_condition_mutex);
      ee:	48 8d 3d 00 00 00 00 	lea    0x0(%rip),%rdi        # f5 <request+0xf5>
      f5:	e8 00 00 00 00       	callq  fa <request+0xfa>
	sem_post(&request_full);
      fa:	48 8d 3d 00 00 00 00 	lea    0x0(%rip),%rdi        # 101 <request+0x101>
     101:	e8 00 00 00 00       	callq  106 <request+0x106>
	printf("We signaled\n");
     106:	48 8d 3d 00 00 00 00 	lea    0x0(%rip),%rdi        # 10d <request+0x10d>
     10d:	e8 00 00 00 00       	callq  112 <request+0x112>
	//pthread_mutex_unlock(&request_condition_mutex);
	printf("Number of requests: %d\n",num_requests); 
     112:	8b 05 00 00 00 00    	mov    0x0(%rip),%eax        # 118 <request+0x118>
     118:	89 c6                	mov    %eax,%esi
     11a:	48 8d 3d 00 00 00 00 	lea    0x0(%rip),%rdi        # 121 <request+0x121>
     121:	b8 00 00 00 00       	mov    $0x0,%eax
     126:	e8 00 00 00 00       	callq  12b <request+0x12b>
	pthread_mutex_lock(&request_fufilled_mutex);
     12b:	48 8d 3d 00 00 00 00 	lea    0x0(%rip),%rdi        # 132 <request+0x132>
     132:	e8 00 00 00 00       	callq  137 <request+0x137>
	while(wakeup_arr[oldrequest] < 1) pthread_cond_wait(&request_fufilled[oldrequest], &request_fufilled_mutex);
     137:	eb 2c                	jmp    165 <request+0x165>
     139:	8b 45 fc             	mov    -0x4(%rbp),%eax
     13c:	48 63 d0             	movslq %eax,%rdx
     13f:	48 89 d0             	mov    %rdx,%rax
     142:	48 01 c0             	add    %rax,%rax
     145:	48 01 d0             	add    %rdx,%rax
     148:	48 c1 e0 04          	shl    $0x4,%rax
     14c:	48 8d 15 00 00 00 00 	lea    0x0(%rip),%rdx        # 153 <request+0x153>
     153:	48 01 d0             	add    %rdx,%rax
     156:	48 8d 35 00 00 00 00 	lea    0x0(%rip),%rsi        # 15d <request+0x15d>
     15d:	48 89 c7             	mov    %rax,%rdi
     160:	e8 00 00 00 00       	callq  165 <request+0x165>
     165:	8b 45 fc             	mov    -0x4(%rbp),%eax
     168:	48 63 d0             	movslq %eax,%rdx
     16b:	48 8d 05 00 00 00 00 	lea    0x0(%rip),%rax        # 172 <request+0x172>
     172:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
     176:	84 c0                	test   %al,%al
     178:	7e bf                	jle    139 <request+0x139>
	wakeup_arr[oldrequest] = 0;
     17a:	8b 45 fc             	mov    -0x4(%rbp),%eax
     17d:	48 63 d0             	movslq %eax,%rdx
     180:	48 8d 05 00 00 00 00 	lea    0x0(%rip),%rax        # 187 <request+0x187>
     187:	c6 04 02 00          	movb   $0x0,(%rdx,%rax,1)
	pthread_mutex_unlock(&request_fufilled_mutex);
     18b:	48 8d 3d 00 00 00 00 	lea    0x0(%rip),%rdi        # 192 <request+0x192>
     192:	e8 00 00 00 00       	callq  197 <request+0x197>

}
     197:	90                   	nop
     198:	c9                   	leaveq 
     199:	c3                   	retq   

000000000000019a <find_free_block>:


int find_free_block(){
     19a:	55                   	push   %rbp
     19b:	48 89 e5             	mov    %rsp,%rbp
     19e:	48 83 ec 10          	sub    $0x10,%rsp
	pthread_mutex_lock(&free_block_list);
     1a2:	48 8d 3d 00 00 00 00 	lea    0x0(%rip),%rdi        # 1a9 <find_free_block+0xf>
     1a9:	e8 00 00 00 00       	callq  1ae <find_free_block+0x14>
	int i = 0;
     1ae:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
	int free_block;
	for(; i < num_blocks/8; i++){
     1b5:	e9 93 00 00 00       	jmpq   24d <find_free_block+0xb3>
		if((free_bitfield[num_blocks/8] & (1 << (i % 8))) == 0){
     1ba:	48 8b 15 00 00 00 00 	mov    0x0(%rip),%rdx        # 1c1 <find_free_block+0x27>
     1c1:	8b 05 00 00 00 00    	mov    0x0(%rip),%eax        # 1c7 <find_free_block+0x2d>
     1c7:	8d 48 07             	lea    0x7(%rax),%ecx
     1ca:	85 c0                	test   %eax,%eax
     1cc:	0f 48 c1             	cmovs  %ecx,%eax
     1cf:	c1 f8 03             	sar    $0x3,%eax
     1d2:	48 98                	cltq   
     1d4:	48 01 d0             	add    %rdx,%rax
     1d7:	0f b6 00             	movzbl (%rax),%eax
     1da:	0f be f0             	movsbl %al,%esi
     1dd:	8b 45 fc             	mov    -0x4(%rbp),%eax
     1e0:	99                   	cltd   
     1e1:	c1 ea 1d             	shr    $0x1d,%edx
     1e4:	01 d0                	add    %edx,%eax
     1e6:	83 e0 07             	and    $0x7,%eax
     1e9:	29 d0                	sub    %edx,%eax
     1eb:	89 c1                	mov    %eax,%ecx
     1ed:	d3 fe                	sar    %cl,%esi
     1ef:	89 f0                	mov    %esi,%eax
     1f1:	83 e0 01             	and    $0x1,%eax
     1f4:	85 c0                	test   %eax,%eax
     1f6:	75 51                	jne    249 <find_free_block+0xaf>
			free_block = i;
     1f8:	8b 45 fc             	mov    -0x4(%rbp),%eax
     1fb:	89 45 f8             	mov    %eax,-0x8(%rbp)
			free_bitfield[num_blocks/8] |= (1 << (i % 8));
     1fe:	48 8b 0d 00 00 00 00 	mov    0x0(%rip),%rcx        # 205 <find_free_block+0x6b>
     205:	8b 05 00 00 00 00    	mov    0x0(%rip),%eax        # 20b <find_free_block+0x71>
     20b:	8d 50 07             	lea    0x7(%rax),%edx
     20e:	85 c0                	test   %eax,%eax
     210:	0f 48 c2             	cmovs  %edx,%eax
     213:	c1 f8 03             	sar    $0x3,%eax
     216:	48 63 d0             	movslq %eax,%rdx
     219:	48 8d 34 11          	lea    (%rcx,%rdx,1),%rsi
     21d:	48 8b 15 00 00 00 00 	mov    0x0(%rip),%rdx        # 224 <find_free_block+0x8a>
     224:	48 98                	cltq   
     226:	48 01 d0             	add    %rdx,%rax
     229:	0f b6 38             	movzbl (%rax),%edi
     22c:	8b 45 fc             	mov    -0x4(%rbp),%eax
     22f:	99                   	cltd   
     230:	c1 ea 1d             	shr    $0x1d,%edx
     233:	01 d0                	add    %edx,%eax
     235:	83 e0 07             	and    $0x7,%eax
     238:	29 d0                	sub    %edx,%eax
     23a:	ba 01 00 00 00       	mov    $0x1,%edx
     23f:	89 c1                	mov    %eax,%ecx
     241:	d3 e2                	shl    %cl,%edx
     243:	89 d0                	mov    %edx,%eax
     245:	09 f8                	or     %edi,%eax
     247:	88 06                	mov    %al,(%rsi)
	for(; i < num_blocks/8; i++){
     249:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
     24d:	8b 05 00 00 00 00    	mov    0x0(%rip),%eax        # 253 <find_free_block+0xb9>
     253:	8d 50 07             	lea    0x7(%rax),%edx
     256:	85 c0                	test   %eax,%eax
     258:	0f 48 c2             	cmovs  %edx,%eax
     25b:	c1 f8 03             	sar    $0x3,%eax
     25e:	3b 45 fc             	cmp    -0x4(%rbp),%eax
     261:	0f 8f 53 ff ff ff    	jg     1ba <find_free_block+0x20>
		}
	}
	if(i == num_blocks/8) free_block = -1;
     267:	8b 05 00 00 00 00    	mov    0x0(%rip),%eax        # 26d <find_free_block+0xd3>
     26d:	8d 50 07             	lea    0x7(%rax),%edx
     270:	85 c0                	test   %eax,%eax
     272:	0f 48 c2             	cmovs  %edx,%eax
     275:	c1 f8 03             	sar    $0x3,%eax
     278:	3b 45 fc             	cmp    -0x4(%rbp),%eax
     27b:	75 07                	jne    284 <find_free_block+0xea>
     27d:	c7 45 f8 ff ff ff ff 	movl   $0xffffffff,-0x8(%rbp)
	pthread_mutex_unlock(&free_block_list);
     284:	48 8d 3d 00 00 00 00 	lea    0x0(%rip),%rdi        # 28b <find_free_block+0xf1>
     28b:	e8 00 00 00 00       	callq  290 <find_free_block+0xf6>
	return free_block;
     290:	8b 45 f8             	mov    -0x8(%rbp),%eax
}
     293:	c9                   	leaveq 
     294:	c3                   	retq   

0000000000000295 <find_file>:

int find_file(char* name){
     295:	55                   	push   %rbp
     296:	48 89 e5             	mov    %rsp,%rbp
     299:	48 83 ec 20          	sub    $0x20,%rsp
     29d:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
	pthread_mutex_lock(&inode_list);//We need to lock here because some thread could make a new file while we traverse the list
     2a1:	48 8d 3d 00 00 00 00 	lea    0x0(%rip),%rdi        # 2a8 <find_file+0x13>
     2a8:	e8 00 00 00 00       	callq  2ad <find_file+0x18>
	int i = 0;//Please do not change this! if i is initalized in ther for loop, gcc complains that i is uninitalized at the if statement
     2ad:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
	for(; i < max_files; i++){
     2b4:	eb 41                	jmp    2f7 <find_file+0x62>
		//if(inodes[i].size >= 0){
			//printf("%s<end>\n%s<end>\n", inodes[i].name, name);
		//}
		if( inodes[i].size >= 0 && (strcmp(inodes[i].name, name) == 0)) break; //strcmp rdeturns zero if the two strings are equal
     2b6:	8b 45 fc             	mov    -0x4(%rbp),%eax
     2b9:	48 98                	cltq   
     2bb:	48 6b d0 5c          	imul   $0x5c,%rax,%rdx
     2bf:	48 8d 05 00 00 00 00 	lea    0x0(%rip),%rax        # 2c6 <find_file+0x31>
     2c6:	8b 04 02             	mov    (%rdx,%rax,1),%eax
     2c9:	85 c0                	test   %eax,%eax
     2cb:	78 26                	js     2f3 <find_file+0x5e>
     2cd:	8b 45 fc             	mov    -0x4(%rbp),%eax
     2d0:	48 98                	cltq   
     2d2:	48 6b d0 5c          	imul   $0x5c,%rax,%rdx
     2d6:	48 8d 05 00 00 00 00 	lea    0x0(%rip),%rax        # 2dd <find_file+0x48>
     2dd:	48 01 c2             	add    %rax,%rdx
     2e0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
     2e4:	48 89 c6             	mov    %rax,%rsi
     2e7:	48 89 d7             	mov    %rdx,%rdi
     2ea:	e8 00 00 00 00       	callq  2ef <find_file+0x5a>
     2ef:	85 c0                	test   %eax,%eax
     2f1:	74 0f                	je     302 <find_file+0x6d>
	for(; i < max_files; i++){
     2f3:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
     2f7:	81 7d fc ff 00 00 00 	cmpl   $0xff,-0x4(%rbp)
     2fe:	7e b6                	jle    2b6 <find_file+0x21>
     300:	eb 01                	jmp    303 <find_file+0x6e>
		if( inodes[i].size >= 0 && (strcmp(inodes[i].name, name) == 0)) break; //strcmp rdeturns zero if the two strings are equal
     302:	90                   	nop
	}
	if(i == max_files) i = -1; //If not found, return -1
     303:	81 7d fc 00 01 00 00 	cmpl   $0x100,-0x4(%rbp)
     30a:	75 07                	jne    313 <find_file+0x7e>
     30c:	c7 45 fc ff ff ff ff 	movl   $0xffffffff,-0x4(%rbp)
	pthread_mutex_unlock(&inode_list);
     313:	48 8d 3d 00 00 00 00 	lea    0x0(%rip),%rdi        # 31a <find_file+0x85>
     31a:	e8 00 00 00 00       	callq  31f <find_file+0x8a>
	return i;
     31f:	8b 45 fc             	mov    -0x4(%rbp),%eax
}
     322:	c9                   	leaveq 
     323:	c3                   	retq   

0000000000000324 <create>:

void create(char* name){
     324:	55                   	push   %rbp
     325:	48 89 e5             	mov    %rsp,%rbp
     328:	48 83 ec 70          	sub    $0x70,%rsp
     32c:	48 89 7d 98          	mov    %rdi,-0x68(%rbp)
	pthread_mutex_lock(&inode_list);//another thread could be creating a file and editting the inode list
     330:	48 8d 3d 00 00 00 00 	lea    0x0(%rip),%rdi        # 337 <create+0x13>
     337:	e8 00 00 00 00       	callq  33c <create+0x18>

	inode newFileInode;
	strcpy(newFileInode.name, name);
     33c:	48 8b 55 98          	mov    -0x68(%rbp),%rdx
     340:	48 8d 45 a0          	lea    -0x60(%rbp),%rax
     344:	48 89 d6             	mov    %rdx,%rsi
     347:	48 89 c7             	mov    %rax,%rdi
     34a:	e8 00 00 00 00       	callq  34f <create+0x2b>
	newFileInode.size = 0;
     34f:	c7 45 c0 00 00 00 00 	movl   $0x0,-0x40(%rbp)

	if(num_files == max_files){
     356:	8b 05 00 00 00 00    	mov    0x0(%rip),%eax        # 35c <create+0x38>
     35c:	3d 00 01 00 00       	cmp    $0x100,%eax
     361:	75 11                	jne    374 <create+0x50>
		printf("Error: max number of files reached\n");
     363:	48 8d 3d 00 00 00 00 	lea    0x0(%rip),%rdi        # 36a <create+0x46>
     36a:	e8 00 00 00 00       	callq  36f <create+0x4b>
     36f:	e9 cf 00 00 00       	jmpq   443 <create+0x11f>
		return;
	}

	for(int i =0; i < max_files; i++){
     374:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
     37b:	e9 aa 00 00 00       	jmpq   42a <create+0x106>
		if(inodes[i].size == -1){
     380:	8b 45 fc             	mov    -0x4(%rbp),%eax
     383:	48 98                	cltq   
     385:	48 6b d0 5c          	imul   $0x5c,%rax,%rdx
     389:	48 8d 05 00 00 00 00 	lea    0x0(%rip),%rax        # 390 <create+0x6c>
     390:	8b 04 02             	mov    (%rdx,%rax,1),%eax
     393:	83 f8 ff             	cmp    $0xffffffff,%eax
     396:	0f 85 8a 00 00 00    	jne    426 <create+0x102>
			inodes[i] = newFileInode;
     39c:	8b 45 fc             	mov    -0x4(%rbp),%eax
     39f:	48 98                	cltq   
     3a1:	48 6b d0 5c          	imul   $0x5c,%rax,%rdx
     3a5:	48 8d 05 00 00 00 00 	lea    0x0(%rip),%rax        # 3ac <create+0x88>
     3ac:	48 8b 4d a0          	mov    -0x60(%rbp),%rcx
     3b0:	48 89 0c 02          	mov    %rcx,(%rdx,%rax,1)
     3b4:	48 8b 4d a8          	mov    -0x58(%rbp),%rcx
     3b8:	48 89 4c 02 08       	mov    %rcx,0x8(%rdx,%rax,1)
     3bd:	48 8b 4d b0          	mov    -0x50(%rbp),%rcx
     3c1:	48 89 4c 02 10       	mov    %rcx,0x10(%rdx,%rax,1)
     3c6:	48 8b 4d b8          	mov    -0x48(%rbp),%rcx
     3ca:	48 89 4c 02 18       	mov    %rcx,0x18(%rdx,%rax,1)
     3cf:	48 8b 4d c0          	mov    -0x40(%rbp),%rcx
     3d3:	48 89 4c 02 20       	mov    %rcx,0x20(%rdx,%rax,1)
     3d8:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
     3dc:	48 89 4c 02 28       	mov    %rcx,0x28(%rdx,%rax,1)
     3e1:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
     3e5:	48 89 4c 02 30       	mov    %rcx,0x30(%rdx,%rax,1)
     3ea:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
     3ee:	48 89 4c 02 38       	mov    %rcx,0x38(%rdx,%rax,1)
     3f3:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
     3f7:	48 89 4c 02 40       	mov    %rcx,0x40(%rdx,%rax,1)
     3fc:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
     400:	48 89 4c 02 48       	mov    %rcx,0x48(%rdx,%rax,1)
     405:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
     409:	48 89 4c 02 50       	mov    %rcx,0x50(%rdx,%rax,1)
     40e:	8b 4d f8             	mov    -0x8(%rbp),%ecx
     411:	89 4c 02 58          	mov    %ecx,0x58(%rdx,%rax,1)
			num_files++;
     415:	8b 05 00 00 00 00    	mov    0x0(%rip),%eax        # 41b <create+0xf7>
     41b:	83 c0 01             	add    $0x1,%eax
     41e:	89 05 00 00 00 00    	mov    %eax,0x0(%rip)        # 424 <create+0x100>
			break;
     424:	eb 11                	jmp    437 <create+0x113>
	for(int i =0; i < max_files; i++){
     426:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
     42a:	81 7d fc ff 00 00 00 	cmpl   $0xff,-0x4(%rbp)
     431:	0f 8e 49 ff ff ff    	jle    380 <create+0x5c>
		}
	}
	pthread_mutex_unlock(&inode_list);
     437:	48 8d 3d 00 00 00 00 	lea    0x0(%rip),%rdi        # 43e <create+0x11a>
     43e:	e8 00 00 00 00       	callq  443 <create+0x11f>
}
     443:	c9                   	leaveq 
     444:	c3                   	retq   

0000000000000445 <import>:

void import(char* new_name, char* unix_name){
     445:	55                   	push   %rbp
     446:	48 89 e5             	mov    %rsp,%rbp
     449:	41 57                	push   %r15
     44b:	41 56                	push   %r14
     44d:	41 55                	push   %r13
     44f:	41 54                	push   %r12
     451:	53                   	push   %rbx
     452:	48 83 ec 38          	sub    $0x38,%rsp
     456:	48 89 7d a8          	mov    %rdi,-0x58(%rbp)
     45a:	48 89 75 a0          	mov    %rsi,-0x60(%rbp)
     45e:	48 89 e0             	mov    %rsp,%rax
     461:	48 89 c3             	mov    %rax,%rbx
	int unixFile = open(unix_name, O_RDONLY);
     464:	48 8b 45 a0          	mov    -0x60(%rbp),%rax
     468:	be 00 00 00 00       	mov    $0x0,%esi
     46d:	48 89 c7             	mov    %rax,%rdi
     470:	b8 00 00 00 00       	mov    $0x0,%eax
     475:	e8 00 00 00 00       	callq  47a <import+0x35>
     47a:	89 45 c4             	mov    %eax,-0x3c(%rbp)
	if(unixFile == -1){
     47d:	83 7d c4 ff          	cmpl   $0xffffffff,-0x3c(%rbp)
     481:	75 16                	jne    499 <import+0x54>
		perror("Error: Unix file does not exist");
     483:	48 8d 3d 00 00 00 00 	lea    0x0(%rip),%rdi        # 48a <import+0x45>
     48a:	e8 00 00 00 00       	callq  48f <import+0x4a>
		exit(1);
     48f:	bf 01 00 00 00       	mov    $0x1,%edi
     494:	e8 00 00 00 00       	callq  499 <import+0x54>
	}
	//if file does not exist create it
	if(find_file(new_name) == -1){
     499:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
     49d:	48 89 c7             	mov    %rax,%rdi
     4a0:	e8 00 00 00 00       	callq  4a5 <import+0x60>
     4a5:	83 f8 ff             	cmp    $0xffffffff,%eax
     4a8:	75 0c                	jne    4b6 <import+0x71>
		create(new_name);
     4aa:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
     4ae:	48 89 c7             	mov    %rax,%rdi
     4b1:	e8 00 00 00 00       	callq  4b6 <import+0x71>
	}

	//this char array allows us to read a block at a time
	char fileBuffer[block_size];
     4b6:	8b 05 00 00 00 00    	mov    0x0(%rip),%eax        # 4bc <import+0x77>
     4bc:	48 63 d0             	movslq %eax,%rdx
     4bf:	48 83 ea 01          	sub    $0x1,%rdx
     4c3:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
     4c7:	48 63 d0             	movslq %eax,%rdx
     4ca:	49 89 d6             	mov    %rdx,%r14
     4cd:	41 bf 00 00 00 00    	mov    $0x0,%r15d
     4d3:	48 63 d0             	movslq %eax,%rdx
     4d6:	49 89 d4             	mov    %rdx,%r12
     4d9:	41 bd 00 00 00 00    	mov    $0x0,%r13d
     4df:	48 98                	cltq   
     4e1:	ba 10 00 00 00       	mov    $0x10,%edx
     4e6:	48 83 ea 01          	sub    $0x1,%rdx
     4ea:	48 01 d0             	add    %rdx,%rax
     4ed:	b9 10 00 00 00       	mov    $0x10,%ecx
     4f2:	ba 00 00 00 00       	mov    $0x0,%edx
     4f7:	48 f7 f1             	div    %rcx
     4fa:	48 6b c0 10          	imul   $0x10,%rax,%rax
     4fe:	48 29 c4             	sub    %rax,%rsp
     501:	48 89 e0             	mov    %rsp,%rax
     504:	48 83 c0 00          	add    $0x0,%rax
     508:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
	int i = 0;
     50c:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%rbp)
	int bytesRead = read(unixFile, fileBuffer, block_size);
     513:	8b 05 00 00 00 00    	mov    0x0(%rip),%eax        # 519 <import+0xd4>
     519:	48 63 d0             	movslq %eax,%rdx
     51c:	48 8b 4d b0          	mov    -0x50(%rbp),%rcx
     520:	8b 45 c4             	mov    -0x3c(%rbp),%eax
     523:	48 89 ce             	mov    %rcx,%rsi
     526:	89 c7                	mov    %eax,%edi
     528:	e8 00 00 00 00       	callq  52d <import+0xe8>
     52d:	89 45 c8             	mov    %eax,-0x38(%rbp)
	while(bytesRead){
     530:	eb 48                	jmp    57a <import+0x135>

		//that way the location is updated based on how much input was taken
		//if it was a whole block it will add block_size
		//else it will just add the amount of bytes read
		write_ssfs(new_name, 'a', i*block_size, bytesRead, fileBuffer);
     532:	48 8b 75 b0          	mov    -0x50(%rbp),%rsi
     536:	8b 05 00 00 00 00    	mov    0x0(%rip),%eax        # 53c <import+0xf7>
     53c:	0f af 45 cc          	imul   -0x34(%rbp),%eax
     540:	89 c2                	mov    %eax,%edx
     542:	8b 4d c8             	mov    -0x38(%rbp),%ecx
     545:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
     549:	49 89 f0             	mov    %rsi,%r8
     54c:	be 61 00 00 00       	mov    $0x61,%esi
     551:	48 89 c7             	mov    %rax,%rdi
     554:	e8 00 00 00 00       	callq  559 <import+0x114>
		i++;
     559:	83 45 cc 01          	addl   $0x1,-0x34(%rbp)
		bytesRead = read(unixFile, fileBuffer, block_size);
     55d:	8b 05 00 00 00 00    	mov    0x0(%rip),%eax        # 563 <import+0x11e>
     563:	48 63 d0             	movslq %eax,%rdx
     566:	48 8b 4d b0          	mov    -0x50(%rbp),%rcx
     56a:	8b 45 c4             	mov    -0x3c(%rbp),%eax
     56d:	48 89 ce             	mov    %rcx,%rsi
     570:	89 c7                	mov    %eax,%edi
     572:	e8 00 00 00 00       	callq  577 <import+0x132>
     577:	89 45 c8             	mov    %eax,-0x38(%rbp)
	while(bytesRead){
     57a:	83 7d c8 00          	cmpl   $0x0,-0x38(%rbp)
     57e:	75 b2                	jne    532 <import+0xed>
	}

	close(unixFile);
     580:	8b 45 c4             	mov    -0x3c(%rbp),%eax
     583:	89 c7                	mov    %eax,%edi
     585:	e8 00 00 00 00       	callq  58a <import+0x145>
     58a:	48 89 dc             	mov    %rbx,%rsp
}
     58d:	90                   	nop
     58e:	48 8d 65 d8          	lea    -0x28(%rbp),%rsp
     592:	5b                   	pop    %rbx
     593:	41 5c                	pop    %r12
     595:	41 5d                	pop    %r13
     597:	41 5e                	pop    %r14
     599:	41 5f                	pop    %r15
     59b:	5d                   	pop    %rbp
     59c:	c3                   	retq   

000000000000059d <cat>:

void cat(char* name){
     59d:	55                   	push   %rbp
     59e:	48 89 e5             	mov    %rsp,%rbp
     5a1:	48 83 ec 20          	sub    $0x20,%rsp
     5a5:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
	int index = find_file(name);
     5a9:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
     5ad:	48 89 c7             	mov    %rax,%rdi
     5b0:	e8 00 00 00 00       	callq  5b5 <cat+0x18>
     5b5:	89 45 fc             	mov    %eax,-0x4(%rbp)
	if(index < 0) {
     5b8:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
     5bc:	79 1a                	jns    5d8 <cat+0x3b>
		printf("File \"%s\" not found!\n",name);
     5be:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
     5c2:	48 89 c6             	mov    %rax,%rsi
     5c5:	48 8d 3d 00 00 00 00 	lea    0x0(%rip),%rdi        # 5cc <cat+0x2f>
     5cc:	b8 00 00 00 00       	mov    $0x0,%eax
     5d1:	e8 00 00 00 00       	callq  5d6 <cat+0x39>
		return;
     5d6:	eb 24                	jmp    5fc <cat+0x5f>
	}
	read_ssfs(name, 0, inodes[index].size);
     5d8:	8b 45 fc             	mov    -0x4(%rbp),%eax
     5db:	48 98                	cltq   
     5dd:	48 6b d0 5c          	imul   $0x5c,%rax,%rdx
     5e1:	48 8d 05 00 00 00 00 	lea    0x0(%rip),%rax        # 5e8 <cat+0x4b>
     5e8:	8b 14 02             	mov    (%rdx,%rax,1),%edx
     5eb:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
     5ef:	be 00 00 00 00       	mov    $0x0,%esi
     5f4:	48 89 c7             	mov    %rax,%rdi
     5f7:	e8 00 00 00 00       	callq  5fc <cat+0x5f>
}
     5fc:	c9                   	leaveq 
     5fd:	c3                   	retq   

00000000000005fe <erase>:
void erase(char* name){
     5fe:	55                   	push   %rbp
     5ff:	48 89 e5             	mov    %rsp,%rbp
     602:	48 81 ec a0 00 00 00 	sub    $0xa0,%rsp
     609:	48 89 bd 68 ff ff ff 	mov    %rdi,-0x98(%rbp)
	int index = find_file(name);
     610:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
     617:	48 89 c7             	mov    %rax,%rdi
     61a:	e8 00 00 00 00       	callq  61f <erase+0x21>
     61f:	89 45 f4             	mov    %eax,-0xc(%rbp)
	inode n;
	if(index > -1){
     622:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
     626:	0f 88 81 00 00 00    	js     6ad <erase+0xaf>
		n = inodes[index];
     62c:	8b 45 f4             	mov    -0xc(%rbp),%eax
     62f:	48 98                	cltq   
     631:	48 6b d0 5c          	imul   $0x5c,%rax,%rdx
     635:	48 8d 05 00 00 00 00 	lea    0x0(%rip),%rax        # 63c <erase+0x3e>
     63c:	48 8b 0c 02          	mov    (%rdx,%rax,1),%rcx
     640:	48 89 8d 70 ff ff ff 	mov    %rcx,-0x90(%rbp)
     647:	48 8b 4c 02 08       	mov    0x8(%rdx,%rax,1),%rcx
     64c:	48 89 8d 78 ff ff ff 	mov    %rcx,-0x88(%rbp)
     653:	48 8b 4c 02 10       	mov    0x10(%rdx,%rax,1),%rcx
     658:	48 89 4d 80          	mov    %rcx,-0x80(%rbp)
     65c:	48 8b 4c 02 18       	mov    0x18(%rdx,%rax,1),%rcx
     661:	48 89 4d 88          	mov    %rcx,-0x78(%rbp)
     665:	48 8b 4c 02 20       	mov    0x20(%rdx,%rax,1),%rcx
     66a:	48 89 4d 90          	mov    %rcx,-0x70(%rbp)
     66e:	48 8b 4c 02 28       	mov    0x28(%rdx,%rax,1),%rcx
     673:	48 89 4d 98          	mov    %rcx,-0x68(%rbp)
     677:	48 8b 4c 02 30       	mov    0x30(%rdx,%rax,1),%rcx
     67c:	48 89 4d a0          	mov    %rcx,-0x60(%rbp)
     680:	48 8b 4c 02 38       	mov    0x38(%rdx,%rax,1),%rcx
     685:	48 89 4d a8          	mov    %rcx,-0x58(%rbp)
     689:	48 8b 4c 02 40       	mov    0x40(%rdx,%rax,1),%rcx
     68e:	48 89 4d b0          	mov    %rcx,-0x50(%rbp)
     692:	48 8b 4c 02 48       	mov    0x48(%rdx,%rax,1),%rcx
     697:	48 89 4d b8          	mov    %rcx,-0x48(%rbp)
     69b:	48 8b 4c 02 50       	mov    0x50(%rdx,%rax,1),%rcx
     6a0:	48 89 4d c0          	mov    %rcx,-0x40(%rbp)
     6a4:	8b 44 02 58          	mov    0x58(%rdx,%rax,1),%eax
     6a8:	89 45 c8             	mov    %eax,-0x38(%rbp)
     6ab:	eb 1b                	jmp    6c8 <erase+0xca>
	} else {
		printf("File %s not found!\n",name);
     6ad:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
     6b4:	48 89 c6             	mov    %rax,%rsi
     6b7:	48 8d 3d 00 00 00 00 	lea    0x0(%rip),%rdi        # 6be <erase+0xc0>
     6be:	b8 00 00 00 00       	mov    $0x0,%eax
     6c3:	e8 00 00 00 00       	callq  6c8 <erase+0xca>
	}
	int* indirect = malloc(block_size);
     6c8:	8b 05 00 00 00 00    	mov    0x0(%rip),%eax        # 6ce <erase+0xd0>
     6ce:	48 98                	cltq   
     6d0:	48 89 c7             	mov    %rax,%rdi
     6d3:	e8 00 00 00 00       	callq  6d8 <erase+0xda>
     6d8:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
	int* double_indirect = malloc(block_size);
     6dc:	8b 05 00 00 00 00    	mov    0x0(%rip),%eax        # 6e2 <erase+0xe4>
     6e2:	48 98                	cltq   
     6e4:	48 89 c7             	mov    %rax,%rdi
     6e7:	e8 00 00 00 00       	callq  6ec <erase+0xee>
     6ec:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
	if(!indirect || !double_indirect){
     6f0:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
     6f5:	74 07                	je     6fe <erase+0x100>
     6f7:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
     6fc:	75 2e                	jne    72c <erase+0x12e>
		perror("Allocation for read_ssfs failed!: ");
     6fe:	48 8d 3d 00 00 00 00 	lea    0x0(%rip),%rdi        # 705 <erase+0x107>
     705:	e8 00 00 00 00       	callq  70a <erase+0x10c>
		free(indirect);
     70a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
     70e:	48 89 c7             	mov    %rax,%rdi
     711:	e8 00 00 00 00       	callq  716 <erase+0x118>
		free(double_indirect);
     716:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
     71a:	48 89 c7             	mov    %rax,%rdi
     71d:	e8 00 00 00 00       	callq  722 <erase+0x124>
		exit(-1);
     722:	bf ff ff ff ff       	mov    $0xffffffff,%edi
     727:	e8 00 00 00 00       	callq  72c <erase+0x12e>
	}
	unsigned int i;
	pthread_mutex_lock(&free_block_list);
     72c:	48 8d 3d 00 00 00 00 	lea    0x0(%rip),%rdi        # 733 <erase+0x135>
     733:	e8 00 00 00 00       	callq  738 <erase+0x13a>
	for(i = 0; i < 12 && i < (unsigned)n.size/block_size; i++){
     738:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
     73f:	eb 6a                	jmp    7ab <erase+0x1ad>
		int block_num = indirect[i - 12];
     741:	8b 45 fc             	mov    -0x4(%rbp),%eax
     744:	83 e8 0c             	sub    $0xc,%eax
     747:	89 c0                	mov    %eax,%eax
     749:	48 8d 14 85 00 00 00 	lea    0x0(,%rax,4),%rdx
     750:	00 
     751:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
     755:	48 01 d0             	add    %rdx,%rax
     758:	8b 00                	mov    (%rax),%eax
     75a:	89 45 dc             	mov    %eax,-0x24(%rbp)
		free_bitfield[block_num/8] &= ~(1 << (block_num % 8));
     75d:	48 8b 0d 00 00 00 00 	mov    0x0(%rip),%rcx        # 764 <erase+0x166>
     764:	8b 45 dc             	mov    -0x24(%rbp),%eax
     767:	8d 50 07             	lea    0x7(%rax),%edx
     76a:	85 c0                	test   %eax,%eax
     76c:	0f 48 c2             	cmovs  %edx,%eax
     76f:	c1 f8 03             	sar    $0x3,%eax
     772:	48 63 d0             	movslq %eax,%rdx
     775:	48 8d 34 11          	lea    (%rcx,%rdx,1),%rsi
     779:	48 8b 15 00 00 00 00 	mov    0x0(%rip),%rdx        # 780 <erase+0x182>
     780:	48 98                	cltq   
     782:	48 01 d0             	add    %rdx,%rax
     785:	0f b6 38             	movzbl (%rax),%edi
     788:	8b 45 dc             	mov    -0x24(%rbp),%eax
     78b:	99                   	cltd   
     78c:	c1 ea 1d             	shr    $0x1d,%edx
     78f:	01 d0                	add    %edx,%eax
     791:	83 e0 07             	and    $0x7,%eax
     794:	29 d0                	sub    %edx,%eax
     796:	ba 01 00 00 00       	mov    $0x1,%edx
     79b:	89 c1                	mov    %eax,%ecx
     79d:	d3 e2                	shl    %cl,%edx
     79f:	89 d0                	mov    %edx,%eax
     7a1:	f7 d0                	not    %eax
     7a3:	21 f8                	and    %edi,%eax
     7a5:	88 06                	mov    %al,(%rsi)
	for(i = 0; i < 12 && i < (unsigned)n.size/block_size; i++){
     7a7:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
     7ab:	83 7d fc 0b          	cmpl   $0xb,-0x4(%rbp)
     7af:	77 1f                	ja     7d0 <erase+0x1d2>
     7b1:	8b 45 90             	mov    -0x70(%rbp),%eax
     7b4:	89 c2                	mov    %eax,%edx
     7b6:	8b 05 00 00 00 00    	mov    0x0(%rip),%eax        # 7bc <erase+0x1be>
     7bc:	89 c1                	mov    %eax,%ecx
     7be:	89 d0                	mov    %edx,%eax
     7c0:	ba 00 00 00 00       	mov    $0x0,%edx
     7c5:	f7 f1                	div    %ecx
     7c7:	3b 45 fc             	cmp    -0x4(%rbp),%eax
     7ca:	0f 87 71 ff ff ff    	ja     741 <erase+0x143>
	}
	if(i == 12){
     7d0:	83 7d fc 0c          	cmpl   $0xc,-0x4(%rbp)
     7d4:	0f 85 90 00 00 00    	jne    86a <erase+0x26c>
		request(n.indirect, indirect, 'r');
     7da:	8b 45 c4             	mov    -0x3c(%rbp),%eax
     7dd:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
     7e1:	ba 72 00 00 00       	mov    $0x72,%edx
     7e6:	48 89 ce             	mov    %rcx,%rsi
     7e9:	89 c7                	mov    %eax,%edi
     7eb:	e8 00 00 00 00       	callq  7f0 <erase+0x1f2>
		for(; i < 12 + block_size/sizeof(int); i++){
     7f0:	eb 5f                	jmp    851 <erase+0x253>
			int block_num = n.direct[i];
     7f2:	8b 45 fc             	mov    -0x4(%rbp),%eax
     7f5:	48 83 c0 08          	add    $0x8,%rax
     7f9:	8b 84 85 74 ff ff ff 	mov    -0x8c(%rbp,%rax,4),%eax
     800:	89 45 d8             	mov    %eax,-0x28(%rbp)
			free_bitfield[block_num/8] &= ~(1 << (block_num % 8));
     803:	48 8b 0d 00 00 00 00 	mov    0x0(%rip),%rcx        # 80a <erase+0x20c>
     80a:	8b 45 d8             	mov    -0x28(%rbp),%eax
     80d:	8d 50 07             	lea    0x7(%rax),%edx
     810:	85 c0                	test   %eax,%eax
     812:	0f 48 c2             	cmovs  %edx,%eax
     815:	c1 f8 03             	sar    $0x3,%eax
     818:	48 63 d0             	movslq %eax,%rdx
     81b:	48 8d 34 11          	lea    (%rcx,%rdx,1),%rsi
     81f:	48 8b 15 00 00 00 00 	mov    0x0(%rip),%rdx        # 826 <erase+0x228>
     826:	48 98                	cltq   
     828:	48 01 d0             	add    %rdx,%rax
     82b:	0f b6 38             	movzbl (%rax),%edi
     82e:	8b 45 d8             	mov    -0x28(%rbp),%eax
     831:	99                   	cltd   
     832:	c1 ea 1d             	shr    $0x1d,%edx
     835:	01 d0                	add    %edx,%eax
     837:	83 e0 07             	and    $0x7,%eax
     83a:	29 d0                	sub    %edx,%eax
     83c:	ba 01 00 00 00       	mov    $0x1,%edx
     841:	89 c1                	mov    %eax,%ecx
     843:	d3 e2                	shl    %cl,%edx
     845:	89 d0                	mov    %edx,%eax
     847:	f7 d0                	not    %eax
     849:	21 f8                	and    %edi,%eax
     84b:	88 06                	mov    %al,(%rsi)
		for(; i < 12 + block_size/sizeof(int); i++){
     84d:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
     851:	8b 45 fc             	mov    -0x4(%rbp),%eax
     854:	8b 15 00 00 00 00    	mov    0x0(%rip),%edx        # 85a <erase+0x25c>
     85a:	48 63 d2             	movslq %edx,%rdx
     85d:	48 c1 ea 02          	shr    $0x2,%rdx
     861:	48 83 c2 0c          	add    $0xc,%rdx
     865:	48 39 d0             	cmp    %rdx,%rax
     868:	72 88                	jb     7f2 <erase+0x1f4>
		}
	}
	if(i == 12 + block_size/sizeof(int)){
     86a:	8b 45 fc             	mov    -0x4(%rbp),%eax
     86d:	8b 15 00 00 00 00    	mov    0x0(%rip),%edx        # 873 <erase+0x275>
     873:	48 63 d2             	movslq %edx,%rdx
     876:	48 c1 ea 02          	shr    $0x2,%rdx
     87a:	48 83 c2 0c          	add    $0xc,%rdx
     87e:	48 39 d0             	cmp    %rdx,%rax
     881:	0f 85 14 01 00 00    	jne    99b <erase+0x39d>
		request(n.double_indirect, double_indirect, 'r');
     887:	8b 45 c8             	mov    -0x38(%rbp),%eax
     88a:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
     88e:	ba 72 00 00 00       	mov    $0x72,%edx
     893:	48 89 ce             	mov    %rcx,%rsi
     896:	89 c7                	mov    %eax,%edi
     898:	e8 00 00 00 00       	callq  89d <erase+0x29f>
		while(i < 12 + block_size/sizeof(int) + (block_size/sizeof(int)) * (block_size/sizeof(int)) ){
     89d:	e9 c7 00 00 00       	jmpq   969 <erase+0x36b>
			request(double_indirect[(i - 12 + block_size/sizeof(int)) / block_size], indirect, 'r');
     8a2:	8b 45 fc             	mov    -0x4(%rbp),%eax
     8a5:	83 e8 0c             	sub    $0xc,%eax
     8a8:	89 c2                	mov    %eax,%edx
     8aa:	8b 05 00 00 00 00    	mov    0x0(%rip),%eax        # 8b0 <erase+0x2b2>
     8b0:	48 98                	cltq   
     8b2:	48 c1 e8 02          	shr    $0x2,%rax
     8b6:	48 01 d0             	add    %rdx,%rax
     8b9:	8b 15 00 00 00 00    	mov    0x0(%rip),%edx        # 8bf <erase+0x2c1>
     8bf:	48 63 f2             	movslq %edx,%rsi
     8c2:	ba 00 00 00 00       	mov    $0x0,%edx
     8c7:	48 f7 f6             	div    %rsi
     8ca:	48 8d 14 85 00 00 00 	lea    0x0(,%rax,4),%rdx
     8d1:	00 
     8d2:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
     8d6:	48 01 d0             	add    %rdx,%rax
     8d9:	8b 00                	mov    (%rax),%eax
     8db:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
     8df:	ba 72 00 00 00       	mov    $0x72,%edx
     8e4:	48 89 ce             	mov    %rcx,%rsi
     8e7:	89 c7                	mov    %eax,%edi
     8e9:	e8 00 00 00 00       	callq  8ee <erase+0x2f0>
			int j = 0;
     8ee:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%rbp)
			for(; j < block_size; j++){
     8f5:	eb 67                	jmp    95e <erase+0x360>
				int block_num = indirect[j];
     8f7:	8b 45 f8             	mov    -0x8(%rbp),%eax
     8fa:	48 98                	cltq   
     8fc:	48 8d 14 85 00 00 00 	lea    0x0(,%rax,4),%rdx
     903:	00 
     904:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
     908:	48 01 d0             	add    %rdx,%rax
     90b:	8b 00                	mov    (%rax),%eax
     90d:	89 45 d4             	mov    %eax,-0x2c(%rbp)
				free_bitfield[block_num/8] &= ~(1 << (block_num % 8));
     910:	48 8b 0d 00 00 00 00 	mov    0x0(%rip),%rcx        # 917 <erase+0x319>
     917:	8b 45 d4             	mov    -0x2c(%rbp),%eax
     91a:	8d 50 07             	lea    0x7(%rax),%edx
     91d:	85 c0                	test   %eax,%eax
     91f:	0f 48 c2             	cmovs  %edx,%eax
     922:	c1 f8 03             	sar    $0x3,%eax
     925:	48 63 d0             	movslq %eax,%rdx
     928:	48 8d 34 11          	lea    (%rcx,%rdx,1),%rsi
     92c:	48 8b 15 00 00 00 00 	mov    0x0(%rip),%rdx        # 933 <erase+0x335>
     933:	48 98                	cltq   
     935:	48 01 d0             	add    %rdx,%rax
     938:	0f b6 38             	movzbl (%rax),%edi
     93b:	8b 45 d4             	mov    -0x2c(%rbp),%eax
     93e:	99                   	cltd   
     93f:	c1 ea 1d             	shr    $0x1d,%edx
     942:	01 d0                	add    %edx,%eax
     944:	83 e0 07             	and    $0x7,%eax
     947:	29 d0                	sub    %edx,%eax
     949:	ba 01 00 00 00       	mov    $0x1,%edx
     94e:	89 c1                	mov    %eax,%ecx
     950:	d3 e2                	shl    %cl,%edx
     952:	89 d0                	mov    %edx,%eax
     954:	f7 d0                	not    %eax
     956:	21 f8                	and    %edi,%eax
     958:	88 06                	mov    %al,(%rsi)
			for(; j < block_size; j++){
     95a:	83 45 f8 01          	addl   $0x1,-0x8(%rbp)
     95e:	8b 05 00 00 00 00    	mov    0x0(%rip),%eax        # 964 <erase+0x366>
     964:	39 45 f8             	cmp    %eax,-0x8(%rbp)
     967:	7c 8e                	jl     8f7 <erase+0x2f9>
		while(i < 12 + block_size/sizeof(int) + (block_size/sizeof(int)) * (block_size/sizeof(int)) ){
     969:	8b 45 fc             	mov    -0x4(%rbp),%eax
     96c:	8b 15 00 00 00 00    	mov    0x0(%rip),%edx        # 972 <erase+0x374>
     972:	48 63 d2             	movslq %edx,%rdx
     975:	48 c1 ea 02          	shr    $0x2,%rdx
     979:	48 8d 4a 01          	lea    0x1(%rdx),%rcx
     97d:	8b 15 00 00 00 00    	mov    0x0(%rip),%edx        # 983 <erase+0x385>
     983:	48 63 d2             	movslq %edx,%rdx
     986:	48 c1 ea 02          	shr    $0x2,%rdx
     98a:	48 0f af d1          	imul   %rcx,%rdx
     98e:	48 83 c2 0c          	add    $0xc,%rdx
     992:	48 39 d0             	cmp    %rdx,%rax
     995:	0f 82 07 ff ff ff    	jb     8a2 <erase+0x2a4>
			}
		}
	}
	pthread_mutex_unlock(&free_block_list);
     99b:	48 8d 3d 00 00 00 00 	lea    0x0(%rip),%rdi        # 9a2 <erase+0x3a4>
     9a2:	e8 00 00 00 00       	callq  9a7 <erase+0x3a9>
	free(indirect);
     9a7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
     9ab:	48 89 c7             	mov    %rax,%rdi
     9ae:	e8 00 00 00 00       	callq  9b3 <erase+0x3b5>
	free(double_indirect);
     9b3:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
     9b7:	48 89 c7             	mov    %rax,%rdi
     9ba:	e8 00 00 00 00       	callq  9bf <erase+0x3c1>
	inodes[index].size = -1;
     9bf:	8b 45 f4             	mov    -0xc(%rbp),%eax
     9c2:	48 98                	cltq   
     9c4:	48 6b d0 5c          	imul   $0x5c,%rax,%rdx
     9c8:	48 8d 05 00 00 00 00 	lea    0x0(%rip),%rax        # 9cf <erase+0x3d1>
     9cf:	c7 04 02 ff ff ff ff 	movl   $0xffffffff,(%rdx,%rax,1)
}
     9d6:	90                   	nop
     9d7:	c9                   	leaveq 
     9d8:	c3                   	retq   

00000000000009d9 <write_ssfs>:



void write_ssfs(char* name, char input, int start_byte, int num_bytes, char* buffer){
     9d9:	55                   	push   %rbp
     9da:	48 89 e5             	mov    %rsp,%rbp
     9dd:	53                   	push   %rbx
     9de:	48 81 ec d8 00 00 00 	sub    $0xd8,%rsp
     9e5:	48 89 bd 38 ff ff ff 	mov    %rdi,-0xc8(%rbp)
     9ec:	89 f0                	mov    %esi,%eax
     9ee:	89 95 30 ff ff ff    	mov    %edx,-0xd0(%rbp)
     9f4:	89 8d 2c ff ff ff    	mov    %ecx,-0xd4(%rbp)
     9fa:	4c 89 85 20 ff ff ff 	mov    %r8,-0xe0(%rbp)
     a01:	88 85 34 ff ff ff    	mov    %al,-0xcc(%rbp)

	int index = find_file(name);
     a07:	48 8b 85 38 ff ff ff 	mov    -0xc8(%rbp),%rax
     a0e:	48 89 c7             	mov    %rax,%rdi
     a11:	e8 00 00 00 00       	callq  a16 <write_ssfs+0x3d>
     a16:	89 45 d0             	mov    %eax,-0x30(%rbp)
	pthread_mutex_lock(&inode_list);
     a19:	48 8d 3d 00 00 00 00 	lea    0x0(%rip),%rdi        # a20 <write_ssfs+0x47>
     a20:	e8 00 00 00 00       	callq  a25 <write_ssfs+0x4c>
	if(index < 0 || start_byte > inodes[index].size) {
     a25:	83 7d d0 00          	cmpl   $0x0,-0x30(%rbp)
     a29:	78 1b                	js     a46 <write_ssfs+0x6d>
     a2b:	8b 45 d0             	mov    -0x30(%rbp),%eax
     a2e:	48 98                	cltq   
     a30:	48 6b d0 5c          	imul   $0x5c,%rax,%rdx
     a34:	48 8d 05 00 00 00 00 	lea    0x0(%rip),%rax        # a3b <write_ssfs+0x62>
     a3b:	8b 04 02             	mov    (%rdx,%rax,1),%eax
     a3e:	3b 85 30 ff ff ff    	cmp    -0xd0(%rbp),%eax
     a44:	7d 2c                	jge    a72 <write_ssfs+0x99>
		printf("File \"%s\" not found!\n",name);
     a46:	48 8b 85 38 ff ff ff 	mov    -0xc8(%rbp),%rax
     a4d:	48 89 c6             	mov    %rax,%rsi
     a50:	48 8d 3d 00 00 00 00 	lea    0x0(%rip),%rdi        # a57 <write_ssfs+0x7e>
     a57:	b8 00 00 00 00       	mov    $0x0,%eax
     a5c:	e8 00 00 00 00       	callq  a61 <write_ssfs+0x88>
		pthread_mutex_unlock(&inode_list);
     a61:	48 8d 3d 00 00 00 00 	lea    0x0(%rip),%rdi        # a68 <write_ssfs+0x8f>
     a68:	e8 00 00 00 00       	callq  a6d <write_ssfs+0x94>
     a6d:	e9 39 06 00 00       	jmpq   10ab <write_ssfs+0x6d2>
		return;
	}

	char* data = (buffer)?buffer:malloc( (num_bytes / block_size + 1) * block_size);  //not an exact ceil, but memory is cheap and floatng point ops are not
     a72:	48 83 bd 20 ff ff ff 	cmpq   $0x0,-0xe0(%rbp)
     a79:	00 
     a7a:	75 27                	jne    aa3 <write_ssfs+0xca>
     a7c:	8b 1d 00 00 00 00    	mov    0x0(%rip),%ebx        # a82 <write_ssfs+0xa9>
     a82:	8b 85 2c ff ff ff    	mov    -0xd4(%rbp),%eax
     a88:	99                   	cltd   
     a89:	f7 fb                	idiv   %ebx
     a8b:	8d 50 01             	lea    0x1(%rax),%edx
     a8e:	8b 05 00 00 00 00    	mov    0x0(%rip),%eax        # a94 <write_ssfs+0xbb>
     a94:	0f af c2             	imul   %edx,%eax
     a97:	48 98                	cltq   
     a99:	48 89 c7             	mov    %rax,%rdi
     a9c:	e8 00 00 00 00       	callq  aa1 <write_ssfs+0xc8>
     aa1:	eb 07                	jmp    aaa <write_ssfs+0xd1>
     aa3:	48 8b 85 20 ff ff ff 	mov    -0xe0(%rbp),%rax
     aaa:	48 89 45 c8          	mov    %rax,-0x38(%rbp)

	int i;
	if(!buffer){
     aae:	48 83 bd 20 ff ff ff 	cmpq   $0x0,-0xe0(%rbp)
     ab5:	00 
     ab6:	75 2e                	jne    ae6 <write_ssfs+0x10d>
		for(i = 0; i < num_bytes; i++) data[i] = input;
     ab8:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%rbp)
     abf:	eb 1a                	jmp    adb <write_ssfs+0x102>
     ac1:	8b 45 ec             	mov    -0x14(%rbp),%eax
     ac4:	48 63 d0             	movslq %eax,%rdx
     ac7:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
     acb:	48 01 c2             	add    %rax,%rdx
     ace:	0f b6 85 34 ff ff ff 	movzbl -0xcc(%rbp),%eax
     ad5:	88 02                	mov    %al,(%rdx)
     ad7:	83 45 ec 01          	addl   $0x1,-0x14(%rbp)
     adb:	8b 45 ec             	mov    -0x14(%rbp),%eax
     ade:	3b 85 2c ff ff ff    	cmp    -0xd4(%rbp),%eax
     ae4:	7c db                	jl     ac1 <write_ssfs+0xe8>
	}
	int* indirect = malloc(block_size);
     ae6:	8b 05 00 00 00 00    	mov    0x0(%rip),%eax        # aec <write_ssfs+0x113>
     aec:	48 98                	cltq   
     aee:	48 89 c7             	mov    %rax,%rdi
     af1:	e8 00 00 00 00       	callq  af6 <write_ssfs+0x11d>
     af6:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
	int* double_indirect = malloc(block_size);
     afa:	8b 05 00 00 00 00    	mov    0x0(%rip),%eax        # b00 <write_ssfs+0x127>
     b00:	48 98                	cltq   
     b02:	48 89 c7             	mov    %rax,%rdi
     b05:	e8 00 00 00 00       	callq  b0a <write_ssfs+0x131>
     b0a:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
	if(!data || !indirect || !double_indirect){
     b0e:	48 83 7d c8 00       	cmpq   $0x0,-0x38(%rbp)
     b13:	74 0e                	je     b23 <write_ssfs+0x14a>
     b15:	48 83 7d c0 00       	cmpq   $0x0,-0x40(%rbp)
     b1a:	74 07                	je     b23 <write_ssfs+0x14a>
     b1c:	48 83 7d b8 00       	cmpq   $0x0,-0x48(%rbp)
     b21:	75 46                	jne    b69 <write_ssfs+0x190>
		perror("Allocation for read_ssfs failed!: ");
     b23:	48 8d 3d 00 00 00 00 	lea    0x0(%rip),%rdi        # b2a <write_ssfs+0x151>
     b2a:	e8 00 00 00 00       	callq  b2f <write_ssfs+0x156>
		free(data);
     b2f:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
     b33:	48 89 c7             	mov    %rax,%rdi
     b36:	e8 00 00 00 00       	callq  b3b <write_ssfs+0x162>
		free(indirect);
     b3b:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
     b3f:	48 89 c7             	mov    %rax,%rdi
     b42:	e8 00 00 00 00       	callq  b47 <write_ssfs+0x16e>
		free(double_indirect);
     b47:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
     b4b:	48 89 c7             	mov    %rax,%rdi
     b4e:	e8 00 00 00 00       	callq  b53 <write_ssfs+0x17a>
		pthread_mutex_unlock(&inode_list);
     b53:	48 8d 3d 00 00 00 00 	lea    0x0(%rip),%rdi        # b5a <write_ssfs+0x181>
     b5a:	e8 00 00 00 00       	callq  b5f <write_ssfs+0x186>
		exit(-1);
     b5f:	bf ff ff ff ff       	mov    $0xffffffff,%edi
     b64:	e8 00 00 00 00       	callq  b69 <write_ssfs+0x190>
	}
	 //allocate new blocks if necessary
	inode file_inode = inodes[index];
     b69:	8b 45 d0             	mov    -0x30(%rbp),%eax
     b6c:	48 98                	cltq   
     b6e:	48 6b d0 5c          	imul   $0x5c,%rax,%rdx
     b72:	48 8d 05 00 00 00 00 	lea    0x0(%rip),%rax        # b79 <write_ssfs+0x1a0>
     b79:	48 8b 0c 02          	mov    (%rdx,%rax,1),%rcx
     b7d:	48 89 8d 40 ff ff ff 	mov    %rcx,-0xc0(%rbp)
     b84:	48 8b 4c 02 08       	mov    0x8(%rdx,%rax,1),%rcx
     b89:	48 89 8d 48 ff ff ff 	mov    %rcx,-0xb8(%rbp)
     b90:	48 8b 4c 02 10       	mov    0x10(%rdx,%rax,1),%rcx
     b95:	48 89 8d 50 ff ff ff 	mov    %rcx,-0xb0(%rbp)
     b9c:	48 8b 4c 02 18       	mov    0x18(%rdx,%rax,1),%rcx
     ba1:	48 89 8d 58 ff ff ff 	mov    %rcx,-0xa8(%rbp)
     ba8:	48 8b 4c 02 20       	mov    0x20(%rdx,%rax,1),%rcx
     bad:	48 89 8d 60 ff ff ff 	mov    %rcx,-0xa0(%rbp)
     bb4:	48 8b 4c 02 28       	mov    0x28(%rdx,%rax,1),%rcx
     bb9:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
     bc0:	48 8b 4c 02 30       	mov    0x30(%rdx,%rax,1),%rcx
     bc5:	48 89 8d 70 ff ff ff 	mov    %rcx,-0x90(%rbp)
     bcc:	48 8b 4c 02 38       	mov    0x38(%rdx,%rax,1),%rcx
     bd1:	48 89 8d 78 ff ff ff 	mov    %rcx,-0x88(%rbp)
     bd8:	48 8b 4c 02 40       	mov    0x40(%rdx,%rax,1),%rcx
     bdd:	48 89 4d 80          	mov    %rcx,-0x80(%rbp)
     be1:	48 8b 4c 02 48       	mov    0x48(%rdx,%rax,1),%rcx
     be6:	48 89 4d 88          	mov    %rcx,-0x78(%rbp)
     bea:	48 8b 4c 02 50       	mov    0x50(%rdx,%rax,1),%rcx
     bef:	48 89 4d 90          	mov    %rcx,-0x70(%rbp)
     bf3:	8b 44 02 58          	mov    0x58(%rdx,%rax,1),%eax
     bf7:	89 45 98             	mov    %eax,-0x68(%rbp)
	int ptrs_per_block = block_size/sizeof(block_ptr);
     bfa:	8b 05 00 00 00 00    	mov    0x0(%rip),%eax        # c00 <write_ssfs+0x227>
     c00:	48 98                	cltq   
     c02:	48 c1 e8 02          	shr    $0x2,%rax
     c06:	89 45 b4             	mov    %eax,-0x4c(%rbp)
	int old_end_block = file_inode.size / block_size;
     c09:	8b 85 60 ff ff ff    	mov    -0xa0(%rbp),%eax
     c0f:	8b 1d 00 00 00 00    	mov    0x0(%rip),%ebx        # c15 <write_ssfs+0x23c>
     c15:	99                   	cltd   
     c16:	f7 fb                	idiv   %ebx
     c18:	89 45 e8             	mov    %eax,-0x18(%rbp)
	int new_end_block = (start_byte + num_bytes) / block_size;
     c1b:	8b 95 30 ff ff ff    	mov    -0xd0(%rbp),%edx
     c21:	8b 85 2c ff ff ff    	mov    -0xd4(%rbp),%eax
     c27:	01 d0                	add    %edx,%eax
     c29:	8b 1d 00 00 00 00    	mov    0x0(%rip),%ebx        # c2f <write_ssfs+0x256>
     c2f:	99                   	cltd   
     c30:	f7 fb                	idiv   %ebx
     c32:	89 45 b0             	mov    %eax,-0x50(%rbp)
	for(;old_end_block < new_end_block && old_end_block < 12; old_end_block++){
     c35:	eb 45                	jmp    c7c <write_ssfs+0x2a3>
		inodes[index].direct[old_end_block] = find_free_block();
     c37:	b8 00 00 00 00       	mov    $0x0,%eax
     c3c:	e8 00 00 00 00       	callq  c41 <write_ssfs+0x268>
     c41:	89 c6                	mov    %eax,%esi
     c43:	8b 45 e8             	mov    -0x18(%rbp),%eax
     c46:	48 63 c8             	movslq %eax,%rcx
     c49:	8b 45 d0             	mov    -0x30(%rbp),%eax
     c4c:	48 63 d0             	movslq %eax,%rdx
     c4f:	48 89 d0             	mov    %rdx,%rax
     c52:	48 01 c0             	add    %rax,%rax
     c55:	48 01 d0             	add    %rdx,%rax
     c58:	48 c1 e0 03          	shl    $0x3,%rax
     c5c:	48 29 d0             	sub    %rdx,%rax
     c5f:	48 01 c8             	add    %rcx,%rax
     c62:	48 83 c0 08          	add    $0x8,%rax
     c66:	48 8d 14 85 00 00 00 	lea    0x0(,%rax,4),%rdx
     c6d:	00 
     c6e:	48 8d 05 00 00 00 00 	lea    0x0(%rip),%rax        # c75 <write_ssfs+0x29c>
     c75:	89 34 02             	mov    %esi,(%rdx,%rax,1)
	for(;old_end_block < new_end_block && old_end_block < 12; old_end_block++){
     c78:	83 45 e8 01          	addl   $0x1,-0x18(%rbp)
     c7c:	8b 45 e8             	mov    -0x18(%rbp),%eax
     c7f:	3b 45 b0             	cmp    -0x50(%rbp),%eax
     c82:	7d 06                	jge    c8a <write_ssfs+0x2b1>
     c84:	83 7d e8 0b          	cmpl   $0xb,-0x18(%rbp)
     c88:	7e ad                	jle    c37 <write_ssfs+0x25e>
	}
	if(new_end_block >= 12 && new_end_block < 12 + ptrs_per_block ){ //no point in editing the indirect block if it doesn't have the end of the file
     c8a:	83 7d b0 0b          	cmpl   $0xb,-0x50(%rbp)
     c8e:	0f 8e 86 00 00 00    	jle    d1a <write_ssfs+0x341>
     c94:	8b 45 b4             	mov    -0x4c(%rbp),%eax
     c97:	83 c0 0c             	add    $0xc,%eax
     c9a:	3b 45 b0             	cmp    -0x50(%rbp),%eax
     c9d:	7e 7b                	jle    d1a <write_ssfs+0x341>
		request(inodes[index].indirect, indirect, 'r'); //We need to keep the old data
     c9f:	8b 45 d0             	mov    -0x30(%rbp),%eax
     ca2:	48 98                	cltq   
     ca4:	48 6b d0 5c          	imul   $0x5c,%rax,%rdx
     ca8:	48 8d 05 00 00 00 00 	lea    0x0(%rip),%rax        # caf <write_ssfs+0x2d6>
     caf:	8b 04 02             	mov    (%rdx,%rax,1),%eax
     cb2:	48 8b 4d c0          	mov    -0x40(%rbp),%rcx
     cb6:	ba 72 00 00 00       	mov    $0x72,%edx
     cbb:	48 89 ce             	mov    %rcx,%rsi
     cbe:	89 c7                	mov    %eax,%edi
     cc0:	e8 00 00 00 00       	callq  cc5 <write_ssfs+0x2ec>
		for(;old_end_block < new_end_block;old_end_block++){
     cc5:	eb 25                	jmp    cec <write_ssfs+0x313>
			indirect[old_end_block - 12] = find_free_block();
     cc7:	8b 45 e8             	mov    -0x18(%rbp),%eax
     cca:	48 98                	cltq   
     ccc:	48 c1 e0 02          	shl    $0x2,%rax
     cd0:	48 8d 50 d0          	lea    -0x30(%rax),%rdx
     cd4:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
     cd8:	48 8d 1c 02          	lea    (%rdx,%rax,1),%rbx
     cdc:	b8 00 00 00 00       	mov    $0x0,%eax
     ce1:	e8 00 00 00 00       	callq  ce6 <write_ssfs+0x30d>
     ce6:	89 03                	mov    %eax,(%rbx)
		for(;old_end_block < new_end_block;old_end_block++){
     ce8:	83 45 e8 01          	addl   $0x1,-0x18(%rbp)
     cec:	8b 45 e8             	mov    -0x18(%rbp),%eax
     cef:	3b 45 b0             	cmp    -0x50(%rbp),%eax
     cf2:	7c d3                	jl     cc7 <write_ssfs+0x2ee>
		}
		request(inodes[index].indirect, indirect, 'w');
     cf4:	8b 45 d0             	mov    -0x30(%rbp),%eax
     cf7:	48 98                	cltq   
     cf9:	48 6b d0 5c          	imul   $0x5c,%rax,%rdx
     cfd:	48 8d 05 00 00 00 00 	lea    0x0(%rip),%rax        # d04 <write_ssfs+0x32b>
     d04:	8b 04 02             	mov    (%rdx,%rax,1),%eax
     d07:	48 8b 4d c0          	mov    -0x40(%rbp),%rcx
     d0b:	ba 77 00 00 00       	mov    $0x77,%edx
     d10:	48 89 ce             	mov    %rcx,%rsi
     d13:	89 c7                	mov    %eax,%edi
     d15:	e8 00 00 00 00       	callq  d1a <write_ssfs+0x341>
	}
	if(old_end_block >= 12 + ptrs_per_block){
     d1a:	8b 45 b4             	mov    -0x4c(%rbp),%eax
     d1d:	83 c0 0c             	add    $0xc,%eax
     d20:	3b 45 e8             	cmp    -0x18(%rbp),%eax
     d23:	0f 8f 36 01 00 00    	jg     e5f <write_ssfs+0x486>
		request(inodes[index].double_indirect, double_indirect, 'r');
     d29:	8b 45 d0             	mov    -0x30(%rbp),%eax
     d2c:	48 98                	cltq   
     d2e:	48 6b d0 5c          	imul   $0x5c,%rax,%rdx
     d32:	48 8d 05 00 00 00 00 	lea    0x0(%rip),%rax        # d39 <write_ssfs+0x360>
     d39:	8b 04 02             	mov    (%rdx,%rax,1),%eax
     d3c:	48 8b 4d b8          	mov    -0x48(%rbp),%rcx
     d40:	ba 72 00 00 00       	mov    $0x72,%edx
     d45:	48 89 ce             	mov    %rcx,%rsi
     d48:	89 c7                	mov    %eax,%edi
     d4a:	e8 00 00 00 00       	callq  d4f <write_ssfs+0x376>
		int new_dbl_blk = (new_end_block - 12 - ptrs_per_block)/block_size/block_size;
     d4f:	8b 45 b0             	mov    -0x50(%rbp),%eax
     d52:	83 e8 0c             	sub    $0xc,%eax
     d55:	2b 45 b4             	sub    -0x4c(%rbp),%eax
     d58:	8b 1d 00 00 00 00    	mov    0x0(%rip),%ebx        # d5e <write_ssfs+0x385>
     d5e:	99                   	cltd   
     d5f:	f7 fb                	idiv   %ebx
     d61:	8b 1d 00 00 00 00    	mov    0x0(%rip),%ebx        # d67 <write_ssfs+0x38e>
     d67:	99                   	cltd   
     d68:	f7 fb                	idiv   %ebx
     d6a:	89 45 ac             	mov    %eax,-0x54(%rbp)
		int old_dbl_blk = (old_end_block - 12 - ptrs_per_block)/block_size/block_size;
     d6d:	8b 45 e8             	mov    -0x18(%rbp),%eax
     d70:	83 e8 0c             	sub    $0xc,%eax
     d73:	2b 45 b4             	sub    -0x4c(%rbp),%eax
     d76:	8b 1d 00 00 00 00    	mov    0x0(%rip),%ebx        # d7c <write_ssfs+0x3a3>
     d7c:	99                   	cltd   
     d7d:	f7 fb                	idiv   %ebx
     d7f:	8b 35 00 00 00 00    	mov    0x0(%rip),%esi        # d85 <write_ssfs+0x3ac>
     d85:	99                   	cltd   
     d86:	f7 fe                	idiv   %esi
     d88:	89 45 e4             	mov    %eax,-0x1c(%rbp)
		int k = old_dbl_blk;
     d8b:	8b 45 e4             	mov    -0x1c(%rbp),%eax
     d8e:	89 45 e0             	mov    %eax,-0x20(%rbp)
		for(;k < new_dbl_blk; k++){
     d91:	eb 25                	jmp    db8 <write_ssfs+0x3df>
			double_indirect[k] = find_free_block();
     d93:	8b 45 e0             	mov    -0x20(%rbp),%eax
     d96:	48 98                	cltq   
     d98:	48 8d 14 85 00 00 00 	lea    0x0(,%rax,4),%rdx
     d9f:	00 
     da0:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
     da4:	48 8d 1c 02          	lea    (%rdx,%rax,1),%rbx
     da8:	b8 00 00 00 00       	mov    $0x0,%eax
     dad:	e8 00 00 00 00       	callq  db2 <write_ssfs+0x3d9>
     db2:	89 03                	mov    %eax,(%rbx)
		for(;k < new_dbl_blk; k++){
     db4:	83 45 e0 01          	addl   $0x1,-0x20(%rbp)
     db8:	8b 45 e0             	mov    -0x20(%rbp),%eax
     dbb:	3b 45 ac             	cmp    -0x54(%rbp),%eax
     dbe:	7c d3                	jl     d93 <write_ssfs+0x3ba>
		}
		request(inodes[index].double_indirect, double_indirect, 'w');
     dc0:	8b 45 d0             	mov    -0x30(%rbp),%eax
     dc3:	48 98                	cltq   
     dc5:	48 6b d0 5c          	imul   $0x5c,%rax,%rdx
     dc9:	48 8d 05 00 00 00 00 	lea    0x0(%rip),%rax        # dd0 <write_ssfs+0x3f7>
     dd0:	8b 04 02             	mov    (%rdx,%rax,1),%eax
     dd3:	48 8b 4d b8          	mov    -0x48(%rbp),%rcx
     dd7:	ba 77 00 00 00       	mov    $0x77,%edx
     ddc:	48 89 ce             	mov    %rcx,%rsi
     ddf:	89 c7                	mov    %eax,%edi
     de1:	e8 00 00 00 00       	callq  de6 <write_ssfs+0x40d>
		while(old_dbl_blk < new_dbl_blk){
     de6:	eb 6f                	jmp    e57 <write_ssfs+0x47e>
			int m;
			for(m = 0; m < ptrs_per_block && old_end_block < new_end_block; m++){
     de8:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%rbp)
     def:	eb 29                	jmp    e1a <write_ssfs+0x441>
				old_end_block++;
     df1:	83 45 e8 01          	addl   $0x1,-0x18(%rbp)
				indirect[m] = find_free_block();
     df5:	8b 45 dc             	mov    -0x24(%rbp),%eax
     df8:	48 98                	cltq   
     dfa:	48 8d 14 85 00 00 00 	lea    0x0(,%rax,4),%rdx
     e01:	00 
     e02:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
     e06:	48 8d 1c 02          	lea    (%rdx,%rax,1),%rbx
     e0a:	b8 00 00 00 00       	mov    $0x0,%eax
     e0f:	e8 00 00 00 00       	callq  e14 <write_ssfs+0x43b>
     e14:	89 03                	mov    %eax,(%rbx)
			for(m = 0; m < ptrs_per_block && old_end_block < new_end_block; m++){
     e16:	83 45 dc 01          	addl   $0x1,-0x24(%rbp)
     e1a:	8b 45 dc             	mov    -0x24(%rbp),%eax
     e1d:	3b 45 b4             	cmp    -0x4c(%rbp),%eax
     e20:	7d 08                	jge    e2a <write_ssfs+0x451>
     e22:	8b 45 e8             	mov    -0x18(%rbp),%eax
     e25:	3b 45 b0             	cmp    -0x50(%rbp),%eax
     e28:	7c c7                	jl     df1 <write_ssfs+0x418>
			}
			request(double_indirect[old_dbl_blk], indirect, 'w');
     e2a:	8b 45 e4             	mov    -0x1c(%rbp),%eax
     e2d:	48 98                	cltq   
     e2f:	48 8d 14 85 00 00 00 	lea    0x0(,%rax,4),%rdx
     e36:	00 
     e37:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
     e3b:	48 01 d0             	add    %rdx,%rax
     e3e:	8b 00                	mov    (%rax),%eax
     e40:	48 8b 4d c0          	mov    -0x40(%rbp),%rcx
     e44:	ba 77 00 00 00       	mov    $0x77,%edx
     e49:	48 89 ce             	mov    %rcx,%rsi
     e4c:	89 c7                	mov    %eax,%edi
     e4e:	e8 00 00 00 00       	callq  e53 <write_ssfs+0x47a>
			old_dbl_blk++;
     e53:	83 45 e4 01          	addl   $0x1,-0x1c(%rbp)
		while(old_dbl_blk < new_dbl_blk){
     e57:	8b 45 e4             	mov    -0x1c(%rbp),%eax
     e5a:	3b 45 ac             	cmp    -0x54(%rbp),%eax
     e5d:	7c 89                	jl     de8 <write_ssfs+0x40f>
		}

	}

	int start_block_ind = start_byte/block_size; //The start byte is in the file's start_block_indth data block
     e5f:	8b 1d 00 00 00 00    	mov    0x0(%rip),%ebx        # e65 <write_ssfs+0x48c>
     e65:	8b 85 30 ff ff ff    	mov    -0xd0(%rbp),%eax
     e6b:	99                   	cltd   
     e6c:	f7 fb                	idiv   %ebx
     e6e:	89 45 a8             	mov    %eax,-0x58(%rbp)
	int curr_block_ind = start_block_ind;//keep track of which block we need to read from
     e71:	8b 45 a8             	mov    -0x58(%rbp),%eax
     e74:	89 45 d8             	mov    %eax,-0x28(%rbp)
	int end_block_ind = (start_byte + num_bytes)/block_size;
     e77:	8b 95 30 ff ff ff    	mov    -0xd0(%rbp),%edx
     e7d:	8b 85 2c ff ff ff    	mov    -0xd4(%rbp),%eax
     e83:	01 d0                	add    %edx,%eax
     e85:	8b 35 00 00 00 00    	mov    0x0(%rip),%esi        # e8b <write_ssfs+0x4b2>
     e8b:	99                   	cltd   
     e8c:	f7 fe                	idiv   %esi
     e8e:	89 45 a4             	mov    %eax,-0x5c(%rbp)
	for(; curr_block_ind < 12 && curr_block_ind <= end_block_ind; curr_block_ind++){
     e91:	eb 5d                	jmp    ef0 <write_ssfs+0x517>
		request(inodes[index].direct[i], data + curr_block_ind*block_size, 'r');
     e93:	8b 05 00 00 00 00    	mov    0x0(%rip),%eax        # e99 <write_ssfs+0x4c0>
     e99:	0f af 45 d8          	imul   -0x28(%rbp),%eax
     e9d:	48 63 d0             	movslq %eax,%rdx
     ea0:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
     ea4:	48 8d 0c 02          	lea    (%rdx,%rax,1),%rcx
     ea8:	8b 45 ec             	mov    -0x14(%rbp),%eax
     eab:	48 63 f0             	movslq %eax,%rsi
     eae:	8b 45 d0             	mov    -0x30(%rbp),%eax
     eb1:	48 63 d0             	movslq %eax,%rdx
     eb4:	48 89 d0             	mov    %rdx,%rax
     eb7:	48 01 c0             	add    %rax,%rax
     eba:	48 01 d0             	add    %rdx,%rax
     ebd:	48 c1 e0 03          	shl    $0x3,%rax
     ec1:	48 29 d0             	sub    %rdx,%rax
     ec4:	48 01 f0             	add    %rsi,%rax
     ec7:	48 83 c0 08          	add    $0x8,%rax
     ecb:	48 8d 14 85 00 00 00 	lea    0x0(,%rax,4),%rdx
     ed2:	00 
     ed3:	48 8d 05 00 00 00 00 	lea    0x0(%rip),%rax        # eda <write_ssfs+0x501>
     eda:	8b 04 02             	mov    (%rdx,%rax,1),%eax
     edd:	ba 72 00 00 00       	mov    $0x72,%edx
     ee2:	48 89 ce             	mov    %rcx,%rsi
     ee5:	89 c7                	mov    %eax,%edi
     ee7:	e8 00 00 00 00       	callq  eec <write_ssfs+0x513>
	for(; curr_block_ind < 12 && curr_block_ind <= end_block_ind; curr_block_ind++){
     eec:	83 45 d8 01          	addl   $0x1,-0x28(%rbp)
     ef0:	83 7d d8 0b          	cmpl   $0xb,-0x28(%rbp)
     ef4:	7f 08                	jg     efe <write_ssfs+0x525>
     ef6:	8b 45 d8             	mov    -0x28(%rbp),%eax
     ef9:	3b 45 a4             	cmp    -0x5c(%rbp),%eax
     efc:	7e 95                	jle    e93 <write_ssfs+0x4ba>
	}

	if(curr_block_ind == 12){//the 0th through 11th blocks are direct blocks
     efe:	83 7d d8 0c          	cmpl   $0xc,-0x28(%rbp)
     f02:	75 79                	jne    f7d <write_ssfs+0x5a4>
		request(inodes[index].indirect, indirect, 'r');
     f04:	8b 45 d0             	mov    -0x30(%rbp),%eax
     f07:	48 98                	cltq   
     f09:	48 6b d0 5c          	imul   $0x5c,%rax,%rdx
     f0d:	48 8d 05 00 00 00 00 	lea    0x0(%rip),%rax        # f14 <write_ssfs+0x53b>
     f14:	8b 04 02             	mov    (%rdx,%rax,1),%eax
     f17:	48 8b 4d c0          	mov    -0x40(%rbp),%rcx
     f1b:	ba 72 00 00 00       	mov    $0x72,%edx
     f20:	48 89 ce             	mov    %rcx,%rsi
     f23:	89 c7                	mov    %eax,%edi
     f25:	e8 00 00 00 00       	callq  f2a <write_ssfs+0x551>
		for(; curr_block_ind < 12 + ptrs_per_block  && curr_block_ind <= end_block_ind; curr_block_ind++){
     f2a:	eb 3e                	jmp    f6a <write_ssfs+0x591>
		request(indirect[curr_block_ind - 12], data + curr_block_ind*block_size, 'w');
     f2c:	8b 05 00 00 00 00    	mov    0x0(%rip),%eax        # f32 <write_ssfs+0x559>
     f32:	0f af 45 d8          	imul   -0x28(%rbp),%eax
     f36:	48 63 d0             	movslq %eax,%rdx
     f39:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
     f3d:	48 8d 0c 02          	lea    (%rdx,%rax,1),%rcx
     f41:	8b 45 d8             	mov    -0x28(%rbp),%eax
     f44:	48 98                	cltq   
     f46:	48 c1 e0 02          	shl    $0x2,%rax
     f4a:	48 8d 50 d0          	lea    -0x30(%rax),%rdx
     f4e:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
     f52:	48 01 d0             	add    %rdx,%rax
     f55:	8b 00                	mov    (%rax),%eax
     f57:	ba 77 00 00 00       	mov    $0x77,%edx
     f5c:	48 89 ce             	mov    %rcx,%rsi
     f5f:	89 c7                	mov    %eax,%edi
     f61:	e8 00 00 00 00       	callq  f66 <write_ssfs+0x58d>
		for(; curr_block_ind < 12 + ptrs_per_block  && curr_block_ind <= end_block_ind; curr_block_ind++){
     f66:	83 45 d8 01          	addl   $0x1,-0x28(%rbp)
     f6a:	8b 45 b4             	mov    -0x4c(%rbp),%eax
     f6d:	83 c0 0c             	add    $0xc,%eax
     f70:	3b 45 d8             	cmp    -0x28(%rbp),%eax
     f73:	7e 08                	jle    f7d <write_ssfs+0x5a4>
     f75:	8b 45 d8             	mov    -0x28(%rbp),%eax
     f78:	3b 45 a4             	cmp    -0x5c(%rbp),%eax
     f7b:	7e af                	jle    f2c <write_ssfs+0x553>

		}
	}
	int indirect_end_block = 12 + ptrs_per_block;
     f7d:	8b 45 b4             	mov    -0x4c(%rbp),%eax
     f80:	83 c0 0c             	add    $0xc,%eax
     f83:	89 45 a0             	mov    %eax,-0x60(%rbp)
	if(curr_block_ind == indirect_end_block) {
     f86:	8b 45 d8             	mov    -0x28(%rbp),%eax
     f89:	3b 45 a0             	cmp    -0x60(%rbp),%eax
     f8c:	0f 85 cd 00 00 00    	jne    105f <write_ssfs+0x686>
		request(inodes[index].double_indirect, double_indirect, 'r');
     f92:	8b 45 d0             	mov    -0x30(%rbp),%eax
     f95:	48 98                	cltq   
     f97:	48 6b d0 5c          	imul   $0x5c,%rax,%rdx
     f9b:	48 8d 05 00 00 00 00 	lea    0x0(%rip),%rax        # fa2 <write_ssfs+0x5c9>
     fa2:	8b 04 02             	mov    (%rdx,%rax,1),%eax
     fa5:	48 8b 4d b8          	mov    -0x48(%rbp),%rcx
     fa9:	ba 72 00 00 00       	mov    $0x72,%edx
     fae:	48 89 ce             	mov    %rcx,%rsi
     fb1:	89 c7                	mov    %eax,%edi
     fb3:	e8 00 00 00 00       	callq  fb8 <write_ssfs+0x5df>
		while(curr_block_ind < indirect_end_block + ptrs_per_block*ptrs_per_block){
     fb8:	e9 8b 00 00 00       	jmpq   1048 <write_ssfs+0x66f>
			request(double_indirect[(curr_block_ind - indirect_end_block) / block_size], indirect, 'r');
     fbd:	8b 45 d8             	mov    -0x28(%rbp),%eax
     fc0:	2b 45 a0             	sub    -0x60(%rbp),%eax
     fc3:	8b 1d 00 00 00 00    	mov    0x0(%rip),%ebx        # fc9 <write_ssfs+0x5f0>
     fc9:	99                   	cltd   
     fca:	f7 fb                	idiv   %ebx
     fcc:	48 98                	cltq   
     fce:	48 8d 14 85 00 00 00 	lea    0x0(,%rax,4),%rdx
     fd5:	00 
     fd6:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
     fda:	48 01 d0             	add    %rdx,%rax
     fdd:	8b 00                	mov    (%rax),%eax
     fdf:	48 8b 4d c0          	mov    -0x40(%rbp),%rcx
     fe3:	ba 72 00 00 00       	mov    $0x72,%edx
     fe8:	48 89 ce             	mov    %rcx,%rsi
     feb:	89 c7                	mov    %eax,%edi
     fed:	e8 00 00 00 00       	callq  ff2 <write_ssfs+0x619>
			for(int i = 0; i < block_size; i++){
     ff2:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%rbp)
     ff9:	eb 42                	jmp    103d <write_ssfs+0x664>
				request(indirect[curr_block_ind - 12], data + curr_block_ind*block_size, 'w'); \
     ffb:	8b 05 00 00 00 00    	mov    0x0(%rip),%eax        # 1001 <write_ssfs+0x628>
    1001:	0f af 45 d8          	imul   -0x28(%rbp),%eax
    1005:	48 63 d0             	movslq %eax,%rdx
    1008:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
    100c:	48 8d 0c 02          	lea    (%rdx,%rax,1),%rcx
    1010:	8b 45 d8             	mov    -0x28(%rbp),%eax
    1013:	48 98                	cltq   
    1015:	48 c1 e0 02          	shl    $0x2,%rax
    1019:	48 8d 50 d0          	lea    -0x30(%rax),%rdx
    101d:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
    1021:	48 01 d0             	add    %rdx,%rax
    1024:	8b 00                	mov    (%rax),%eax
    1026:	ba 77 00 00 00       	mov    $0x77,%edx
    102b:	48 89 ce             	mov    %rcx,%rsi
    102e:	89 c7                	mov    %eax,%edi
    1030:	e8 00 00 00 00       	callq  1035 <write_ssfs+0x65c>
				curr_block_ind++;
    1035:	83 45 d8 01          	addl   $0x1,-0x28(%rbp)
			for(int i = 0; i < block_size; i++){
    1039:	83 45 d4 01          	addl   $0x1,-0x2c(%rbp)
    103d:	8b 05 00 00 00 00    	mov    0x0(%rip),%eax        # 1043 <write_ssfs+0x66a>
    1043:	39 45 d4             	cmp    %eax,-0x2c(%rbp)
    1046:	7c b3                	jl     ffb <write_ssfs+0x622>
		while(curr_block_ind < indirect_end_block + ptrs_per_block*ptrs_per_block){
    1048:	8b 45 b4             	mov    -0x4c(%rbp),%eax
    104b:	0f af 45 b4          	imul   -0x4c(%rbp),%eax
    104f:	89 c2                	mov    %eax,%edx
    1051:	8b 45 a0             	mov    -0x60(%rbp),%eax
    1054:	01 d0                	add    %edx,%eax
    1056:	3b 45 d8             	cmp    -0x28(%rbp),%eax
    1059:	0f 8f 5e ff ff ff    	jg     fbd <write_ssfs+0x5e4>
			}
		}
	}
	pthread_mutex_unlock(&inode_list);
    105f:	48 8d 3d 00 00 00 00 	lea    0x0(%rip),%rdi        # 1066 <write_ssfs+0x68d>
    1066:	e8 00 00 00 00       	callq  106b <write_ssfs+0x692>
	write(1 ,data + start_byte, num_bytes);
    106b:	8b 85 2c ff ff ff    	mov    -0xd4(%rbp),%eax
    1071:	48 98                	cltq   
    1073:	8b 95 30 ff ff ff    	mov    -0xd0(%rbp),%edx
    1079:	48 63 ca             	movslq %edx,%rcx
    107c:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
    1080:	48 01 d1             	add    %rdx,%rcx
    1083:	48 89 c2             	mov    %rax,%rdx
    1086:	48 89 ce             	mov    %rcx,%rsi
    1089:	bf 01 00 00 00       	mov    $0x1,%edi
    108e:	e8 00 00 00 00       	callq  1093 <write_ssfs+0x6ba>
	free(data);
    1093:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
    1097:	48 89 c7             	mov    %rax,%rdi
    109a:	e8 00 00 00 00       	callq  109f <write_ssfs+0x6c6>
	free(indirect);
    109f:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
    10a3:	48 89 c7             	mov    %rax,%rdi
    10a6:	e8 00 00 00 00       	callq  10ab <write_ssfs+0x6d2>

}
    10ab:	48 81 c4 d8 00 00 00 	add    $0xd8,%rsp
    10b2:	5b                   	pop    %rbx
    10b3:	5d                   	pop    %rbp
    10b4:	c3                   	retq   

00000000000010b5 <read_ssfs>:
void read_ssfs(char* name, int start_byte, int num_bytes){
    10b5:	55                   	push   %rbp
    10b6:	48 89 e5             	mov    %rsp,%rbp
    10b9:	48 81 ec b0 00 00 00 	sub    $0xb0,%rsp
    10c0:	48 89 bd 58 ff ff ff 	mov    %rdi,-0xa8(%rbp)
    10c7:	89 b5 54 ff ff ff    	mov    %esi,-0xac(%rbp)
    10cd:	89 95 50 ff ff ff    	mov    %edx,-0xb0(%rbp)
	int index = find_file(name);
    10d3:	48 8b 85 58 ff ff ff 	mov    -0xa8(%rbp),%rax
    10da:	48 89 c7             	mov    %rax,%rdi
    10dd:	e8 00 00 00 00       	callq  10e2 <read_ssfs+0x2d>
    10e2:	89 45 f4             	mov    %eax,-0xc(%rbp)
	if(index < 0) {
    10e5:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
    10e9:	79 20                	jns    110b <read_ssfs+0x56>
		printf("File \"%s\" not found!\n",name);
    10eb:	48 8b 85 58 ff ff ff 	mov    -0xa8(%rbp),%rax
    10f2:	48 89 c6             	mov    %rax,%rsi
    10f5:	48 8d 3d 00 00 00 00 	lea    0x0(%rip),%rdi        # 10fc <read_ssfs+0x47>
    10fc:	b8 00 00 00 00       	mov    $0x0,%eax
    1101:	e8 00 00 00 00       	callq  1106 <read_ssfs+0x51>
    1106:	e9 52 03 00 00       	jmpq   145d <read_ssfs+0x3a8>
		return;
	}
	pthread_mutex_lock(&inode_list);
    110b:	48 8d 3d 00 00 00 00 	lea    0x0(%rip),%rdi        # 1112 <read_ssfs+0x5d>
    1112:	e8 00 00 00 00       	callq  1117 <read_ssfs+0x62>
	inode file_inode = inodes[index];
    1117:	8b 45 f4             	mov    -0xc(%rbp),%eax
    111a:	48 98                	cltq   
    111c:	48 6b d0 5c          	imul   $0x5c,%rax,%rdx
    1120:	48 8d 05 00 00 00 00 	lea    0x0(%rip),%rax        # 1127 <read_ssfs+0x72>
    1127:	48 8b 0c 02          	mov    (%rdx,%rax,1),%rcx
    112b:	48 89 8d 60 ff ff ff 	mov    %rcx,-0xa0(%rbp)
    1132:	48 8b 4c 02 08       	mov    0x8(%rdx,%rax,1),%rcx
    1137:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
    113e:	48 8b 4c 02 10       	mov    0x10(%rdx,%rax,1),%rcx
    1143:	48 89 8d 70 ff ff ff 	mov    %rcx,-0x90(%rbp)
    114a:	48 8b 4c 02 18       	mov    0x18(%rdx,%rax,1),%rcx
    114f:	48 89 8d 78 ff ff ff 	mov    %rcx,-0x88(%rbp)
    1156:	48 8b 4c 02 20       	mov    0x20(%rdx,%rax,1),%rcx
    115b:	48 89 4d 80          	mov    %rcx,-0x80(%rbp)
    115f:	48 8b 4c 02 28       	mov    0x28(%rdx,%rax,1),%rcx
    1164:	48 89 4d 88          	mov    %rcx,-0x78(%rbp)
    1168:	48 8b 4c 02 30       	mov    0x30(%rdx,%rax,1),%rcx
    116d:	48 89 4d 90          	mov    %rcx,-0x70(%rbp)
    1171:	48 8b 4c 02 38       	mov    0x38(%rdx,%rax,1),%rcx
    1176:	48 89 4d 98          	mov    %rcx,-0x68(%rbp)
    117a:	48 8b 4c 02 40       	mov    0x40(%rdx,%rax,1),%rcx
    117f:	48 89 4d a0          	mov    %rcx,-0x60(%rbp)
    1183:	48 8b 4c 02 48       	mov    0x48(%rdx,%rax,1),%rcx
    1188:	48 89 4d a8          	mov    %rcx,-0x58(%rbp)
    118c:	48 8b 4c 02 50       	mov    0x50(%rdx,%rax,1),%rcx
    1191:	48 89 4d b0          	mov    %rcx,-0x50(%rbp)
    1195:	8b 44 02 58          	mov    0x58(%rdx,%rax,1),%eax
    1199:	89 45 b8             	mov    %eax,-0x48(%rbp)
	pthread_mutex_unlock(&inode_list);
    119c:	48 8d 3d 00 00 00 00 	lea    0x0(%rip),%rdi        # 11a3 <read_ssfs+0xee>
    11a3:	e8 00 00 00 00       	callq  11a8 <read_ssfs+0xf3>
	char* data = malloc( (num_bytes + 1) / block_size * block_size); //not an exact ceil, but memory is cheap and floatng point ops are not
    11a8:	8b 85 50 ff ff ff    	mov    -0xb0(%rbp),%eax
    11ae:	83 c0 01             	add    $0x1,%eax
    11b1:	8b 35 00 00 00 00    	mov    0x0(%rip),%esi        # 11b7 <read_ssfs+0x102>
    11b7:	99                   	cltd   
    11b8:	f7 fe                	idiv   %esi
    11ba:	89 c2                	mov    %eax,%edx
    11bc:	8b 05 00 00 00 00    	mov    0x0(%rip),%eax        # 11c2 <read_ssfs+0x10d>
    11c2:	0f af c2             	imul   %edx,%eax
    11c5:	48 98                	cltq   
    11c7:	48 89 c7             	mov    %rax,%rdi
    11ca:	e8 00 00 00 00       	callq  11cf <read_ssfs+0x11a>
    11cf:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
	int* indirect = malloc(block_size);
    11d3:	8b 05 00 00 00 00    	mov    0x0(%rip),%eax        # 11d9 <read_ssfs+0x124>
    11d9:	48 98                	cltq   
    11db:	48 89 c7             	mov    %rax,%rdi
    11de:	e8 00 00 00 00       	callq  11e3 <read_ssfs+0x12e>
    11e3:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
	int* double_indirect = malloc(block_size);
    11e7:	8b 05 00 00 00 00    	mov    0x0(%rip),%eax        # 11ed <read_ssfs+0x138>
    11ed:	48 98                	cltq   
    11ef:	48 89 c7             	mov    %rax,%rdi
    11f2:	e8 00 00 00 00       	callq  11f7 <read_ssfs+0x142>
    11f7:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
	if(!data || !indirect || !double_indirect){
    11fb:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
    1200:	74 0e                	je     1210 <read_ssfs+0x15b>
    1202:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
    1207:	74 07                	je     1210 <read_ssfs+0x15b>
    1209:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
    120e:	75 3a                	jne    124a <read_ssfs+0x195>
		perror("Allocation for read_ssfs failed!: ");
    1210:	48 8d 3d 00 00 00 00 	lea    0x0(%rip),%rdi        # 1217 <read_ssfs+0x162>
    1217:	e8 00 00 00 00       	callq  121c <read_ssfs+0x167>
		free(data);
    121c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1220:	48 89 c7             	mov    %rax,%rdi
    1223:	e8 00 00 00 00       	callq  1228 <read_ssfs+0x173>
		free(indirect);
    1228:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    122c:	48 89 c7             	mov    %rax,%rdi
    122f:	e8 00 00 00 00       	callq  1234 <read_ssfs+0x17f>
		free(double_indirect);
    1234:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    1238:	48 89 c7             	mov    %rax,%rdi
    123b:	e8 00 00 00 00       	callq  1240 <read_ssfs+0x18b>
		exit(-1);
    1240:	bf ff ff ff ff       	mov    $0xffffffff,%edi
    1245:	e8 00 00 00 00       	callq  124a <read_ssfs+0x195>
	}
	int start_block_ind = start_byte/block_size; //The start byte is in the file's start_block_indth data block
    124a:	8b 35 00 00 00 00    	mov    0x0(%rip),%esi        # 1250 <read_ssfs+0x19b>
    1250:	8b 85 54 ff ff ff    	mov    -0xac(%rbp),%eax
    1256:	99                   	cltd   
    1257:	f7 fe                	idiv   %esi
    1259:	89 45 d4             	mov    %eax,-0x2c(%rbp)
	int curr_block_ind = start_block_ind;//keep track of which block we need to read from
    125c:	8b 45 d4             	mov    -0x2c(%rbp),%eax
    125f:	89 45 fc             	mov    %eax,-0x4(%rbp)
	int end_block_ind = (start_byte + num_bytes)/block_size;
    1262:	8b 95 54 ff ff ff    	mov    -0xac(%rbp),%edx
    1268:	8b 85 50 ff ff ff    	mov    -0xb0(%rbp),%eax
    126e:	01 d0                	add    %edx,%eax
    1270:	8b 35 00 00 00 00    	mov    0x0(%rip),%esi        # 1276 <read_ssfs+0x1c1>
    1276:	99                   	cltd   
    1277:	f7 fe                	idiv   %esi
    1279:	89 45 d0             	mov    %eax,-0x30(%rbp)
	for(; curr_block_ind < 12 && curr_block_ind <= end_block_ind; curr_block_ind++){
    127c:	eb 38                	jmp    12b6 <read_ssfs+0x201>
		request(file_inode.direct[curr_block_ind], data + curr_block_ind*block_size, 'r');
    127e:	8b 05 00 00 00 00    	mov    0x0(%rip),%eax        # 1284 <read_ssfs+0x1cf>
    1284:	0f af 45 fc          	imul   -0x4(%rbp),%eax
    1288:	48 63 d0             	movslq %eax,%rdx
    128b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    128f:	48 8d 0c 02          	lea    (%rdx,%rax,1),%rcx
    1293:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1296:	48 98                	cltq   
    1298:	48 83 c0 08          	add    $0x8,%rax
    129c:	8b 84 85 64 ff ff ff 	mov    -0x9c(%rbp,%rax,4),%eax
    12a3:	ba 72 00 00 00       	mov    $0x72,%edx
    12a8:	48 89 ce             	mov    %rcx,%rsi
    12ab:	89 c7                	mov    %eax,%edi
    12ad:	e8 00 00 00 00       	callq  12b2 <read_ssfs+0x1fd>
	for(; curr_block_ind < 12 && curr_block_ind <= end_block_ind; curr_block_ind++){
    12b2:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
    12b6:	83 7d fc 0b          	cmpl   $0xb,-0x4(%rbp)
    12ba:	7f 08                	jg     12c4 <read_ssfs+0x20f>
    12bc:	8b 45 fc             	mov    -0x4(%rbp),%eax
    12bf:	3b 45 d0             	cmp    -0x30(%rbp),%eax
    12c2:	7e ba                	jle    127e <read_ssfs+0x1c9>
	}
	int ptrs_per_block = block_size/sizeof(block_ptr);
    12c4:	8b 05 00 00 00 00    	mov    0x0(%rip),%eax        # 12ca <read_ssfs+0x215>
    12ca:	48 98                	cltq   
    12cc:	48 c1 e8 02          	shr    $0x2,%rax
    12d0:	89 45 cc             	mov    %eax,-0x34(%rbp)

	if(curr_block_ind == 12){//the 0th through 11th blocks are direct blocks
    12d3:	83 7d fc 0c          	cmpl   $0xc,-0x4(%rbp)
    12d7:	75 69                	jne    1342 <read_ssfs+0x28d>
		request(file_inode.indirect, indirect, 'r');
    12d9:	8b 45 b4             	mov    -0x4c(%rbp),%eax
    12dc:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
    12e0:	ba 72 00 00 00       	mov    $0x72,%edx
    12e5:	48 89 ce             	mov    %rcx,%rsi
    12e8:	89 c7                	mov    %eax,%edi
    12ea:	e8 00 00 00 00       	callq  12ef <read_ssfs+0x23a>
		for(; curr_block_ind < 12 + ptrs_per_block  && curr_block_ind <= end_block_ind; curr_block_ind++){
    12ef:	eb 3e                	jmp    132f <read_ssfs+0x27a>
		request(indirect[curr_block_ind - 12], data + curr_block_ind*block_size, 'r');
    12f1:	8b 05 00 00 00 00    	mov    0x0(%rip),%eax        # 12f7 <read_ssfs+0x242>
    12f7:	0f af 45 fc          	imul   -0x4(%rbp),%eax
    12fb:	48 63 d0             	movslq %eax,%rdx
    12fe:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1302:	48 8d 0c 02          	lea    (%rdx,%rax,1),%rcx
    1306:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1309:	48 98                	cltq   
    130b:	48 c1 e0 02          	shl    $0x2,%rax
    130f:	48 8d 50 d0          	lea    -0x30(%rax),%rdx
    1313:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    1317:	48 01 d0             	add    %rdx,%rax
    131a:	8b 00                	mov    (%rax),%eax
    131c:	ba 72 00 00 00       	mov    $0x72,%edx
    1321:	48 89 ce             	mov    %rcx,%rsi
    1324:	89 c7                	mov    %eax,%edi
    1326:	e8 00 00 00 00       	callq  132b <read_ssfs+0x276>
		for(; curr_block_ind < 12 + ptrs_per_block  && curr_block_ind <= end_block_ind; curr_block_ind++){
    132b:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
    132f:	8b 45 cc             	mov    -0x34(%rbp),%eax
    1332:	83 c0 0c             	add    $0xc,%eax
    1335:	3b 45 fc             	cmp    -0x4(%rbp),%eax
    1338:	7e 08                	jle    1342 <read_ssfs+0x28d>
    133a:	8b 45 fc             	mov    -0x4(%rbp),%eax
    133d:	3b 45 d0             	cmp    -0x30(%rbp),%eax
    1340:	7e af                	jle    12f1 <read_ssfs+0x23c>

		}
	}
	int indirect_end_block = 12 + ptrs_per_block;
    1342:	8b 45 cc             	mov    -0x34(%rbp),%eax
    1345:	83 c0 0c             	add    $0xc,%eax
    1348:	89 45 c8             	mov    %eax,-0x38(%rbp)
	if(curr_block_ind == indirect_end_block) {
    134b:	8b 45 fc             	mov    -0x4(%rbp),%eax
    134e:	3b 45 c8             	cmp    -0x38(%rbp),%eax
    1351:	0f 85 c6 00 00 00    	jne    141d <read_ssfs+0x368>
		request(file_inode.double_indirect, double_indirect, 'r');
    1357:	8b 45 b8             	mov    -0x48(%rbp),%eax
    135a:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
    135e:	ba 72 00 00 00       	mov    $0x72,%edx
    1363:	48 89 ce             	mov    %rcx,%rsi
    1366:	89 c7                	mov    %eax,%edi
    1368:	e8 00 00 00 00       	callq  136d <read_ssfs+0x2b8>
		while(curr_block_ind < indirect_end_block + ptrs_per_block*ptrs_per_block){
    136d:	e9 94 00 00 00       	jmpq   1406 <read_ssfs+0x351>
			request(double_indirect[(curr_block_ind - indirect_end_block) / block_size], indirect, 'r');
    1372:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1375:	2b 45 c8             	sub    -0x38(%rbp),%eax
    1378:	8b 35 00 00 00 00    	mov    0x0(%rip),%esi        # 137e <read_ssfs+0x2c9>
    137e:	99                   	cltd   
    137f:	f7 fe                	idiv   %esi
    1381:	48 98                	cltq   
    1383:	48 8d 14 85 00 00 00 	lea    0x0(,%rax,4),%rdx
    138a:	00 
    138b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    138f:	48 01 d0             	add    %rdx,%rax
    1392:	8b 00                	mov    (%rax),%eax
    1394:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
    1398:	ba 72 00 00 00       	mov    $0x72,%edx
    139d:	48 89 ce             	mov    %rcx,%rsi
    13a0:	89 c7                	mov    %eax,%edi
    13a2:	e8 00 00 00 00       	callq  13a7 <read_ssfs+0x2f2>
			for(int i = 0; i < block_size; i++){
    13a7:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%rbp)
    13ae:	eb 4b                	jmp    13fb <read_ssfs+0x346>
				request(indirect[(curr_block_ind - 12) % ptrs_per_block], data + curr_block_ind*block_size, 'r'); \
    13b0:	8b 05 00 00 00 00    	mov    0x0(%rip),%eax        # 13b6 <read_ssfs+0x301>
    13b6:	0f af 45 fc          	imul   -0x4(%rbp),%eax
    13ba:	48 63 d0             	movslq %eax,%rdx
    13bd:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    13c1:	48 8d 0c 02          	lea    (%rdx,%rax,1),%rcx
    13c5:	8b 45 fc             	mov    -0x4(%rbp),%eax
    13c8:	83 e8 0c             	sub    $0xc,%eax
    13cb:	99                   	cltd   
    13cc:	f7 7d cc             	idivl  -0x34(%rbp)
    13cf:	89 d0                	mov    %edx,%eax
    13d1:	48 98                	cltq   
    13d3:	48 8d 14 85 00 00 00 	lea    0x0(,%rax,4),%rdx
    13da:	00 
    13db:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    13df:	48 01 d0             	add    %rdx,%rax
    13e2:	8b 00                	mov    (%rax),%eax
    13e4:	ba 72 00 00 00       	mov    $0x72,%edx
    13e9:	48 89 ce             	mov    %rcx,%rsi
    13ec:	89 c7                	mov    %eax,%edi
    13ee:	e8 00 00 00 00       	callq  13f3 <read_ssfs+0x33e>
				curr_block_ind++;
    13f3:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
			for(int i = 0; i < block_size; i++){
    13f7:	83 45 f8 01          	addl   $0x1,-0x8(%rbp)
    13fb:	8b 05 00 00 00 00    	mov    0x0(%rip),%eax        # 1401 <read_ssfs+0x34c>
    1401:	39 45 f8             	cmp    %eax,-0x8(%rbp)
    1404:	7c aa                	jl     13b0 <read_ssfs+0x2fb>
		while(curr_block_ind < indirect_end_block + ptrs_per_block*ptrs_per_block){
    1406:	8b 45 cc             	mov    -0x34(%rbp),%eax
    1409:	0f af 45 cc          	imul   -0x34(%rbp),%eax
    140d:	89 c2                	mov    %eax,%edx
    140f:	8b 45 c8             	mov    -0x38(%rbp),%eax
    1412:	01 d0                	add    %edx,%eax
    1414:	3b 45 fc             	cmp    -0x4(%rbp),%eax
    1417:	0f 8f 55 ff ff ff    	jg     1372 <read_ssfs+0x2bd>
			}
		}
	}
	write(1 ,data + start_byte, num_bytes);
    141d:	8b 85 50 ff ff ff    	mov    -0xb0(%rbp),%eax
    1423:	48 98                	cltq   
    1425:	8b 95 54 ff ff ff    	mov    -0xac(%rbp),%edx
    142b:	48 63 ca             	movslq %edx,%rcx
    142e:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
    1432:	48 01 d1             	add    %rdx,%rcx
    1435:	48 89 c2             	mov    %rax,%rdx
    1438:	48 89 ce             	mov    %rcx,%rsi
    143b:	bf 01 00 00 00       	mov    $0x1,%edi
    1440:	e8 00 00 00 00       	callq  1445 <read_ssfs+0x390>
	free(data);
    1445:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1449:	48 89 c7             	mov    %rax,%rdi
    144c:	e8 00 00 00 00       	callq  1451 <read_ssfs+0x39c>
	free(indirect);
    1451:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    1455:	48 89 c7             	mov    %rax,%rdi
    1458:	e8 00 00 00 00       	callq  145d <read_ssfs+0x3a8>
}
    145d:	c9                   	leaveq 
    145e:	c3                   	retq   

000000000000145f <list>:

void list(){
    145f:	55                   	push   %rbp
    1460:	48 89 e5             	mov    %rsp,%rbp
    1463:	48 83 ec 10          	sub    $0x10,%rsp
	pthread_mutex_lock(&inode_list);
    1467:	48 8d 3d 00 00 00 00 	lea    0x0(%rip),%rdi        # 146e <list+0xf>
    146e:	e8 00 00 00 00       	callq  1473 <list+0x14>
	for(int i = 0; i < max_files; i++){
    1473:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
    147a:	eb 58                	jmp    14d4 <list+0x75>
		if(inodes[i].size >= 0){
    147c:	8b 45 fc             	mov    -0x4(%rbp),%eax
    147f:	48 98                	cltq   
    1481:	48 6b d0 5c          	imul   $0x5c,%rax,%rdx
    1485:	48 8d 05 00 00 00 00 	lea    0x0(%rip),%rax        # 148c <list+0x2d>
    148c:	8b 04 02             	mov    (%rdx,%rax,1),%eax
    148f:	85 c0                	test   %eax,%eax
    1491:	78 3d                	js     14d0 <list+0x71>
			printf("Name: %s Size: %d\n",inodes[i].name,inodes[i].size);
    1493:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1496:	48 98                	cltq   
    1498:	48 6b d0 5c          	imul   $0x5c,%rax,%rdx
    149c:	48 8d 05 00 00 00 00 	lea    0x0(%rip),%rax        # 14a3 <list+0x44>
    14a3:	8b 04 02             	mov    (%rdx,%rax,1),%eax
    14a6:	8b 55 fc             	mov    -0x4(%rbp),%edx
    14a9:	48 63 d2             	movslq %edx,%rdx
    14ac:	48 6b ca 5c          	imul   $0x5c,%rdx,%rcx
    14b0:	48 8d 15 00 00 00 00 	lea    0x0(%rip),%rdx        # 14b7 <list+0x58>
    14b7:	48 01 d1             	add    %rdx,%rcx
    14ba:	89 c2                	mov    %eax,%edx
    14bc:	48 89 ce             	mov    %rcx,%rsi
    14bf:	48 8d 3d 00 00 00 00 	lea    0x0(%rip),%rdi        # 14c6 <list+0x67>
    14c6:	b8 00 00 00 00       	mov    $0x0,%eax
    14cb:	e8 00 00 00 00       	callq  14d0 <list+0x71>
	for(int i = 0; i < max_files; i++){
    14d0:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
    14d4:	81 7d fc ff 00 00 00 	cmpl   $0xff,-0x4(%rbp)
    14db:	7e 9f                	jle    147c <list+0x1d>
		}
	}
	pthread_mutex_unlock(&inode_list);
    14dd:	48 8d 3d 00 00 00 00 	lea    0x0(%rip),%rdi        # 14e4 <list+0x85>
    14e4:	e8 00 00 00 00       	callq  14e9 <list+0x8a>
}
    14e9:	90                   	nop
    14ea:	c9                   	leaveq 
    14eb:	c3                   	retq   

00000000000014ec <shutdown>:

void shutdown(){
    14ec:	55                   	push   %rbp
    14ed:	48 89 e5             	mov    %rsp,%rbp
	pthread_cond_signal(&request_end);
    14f0:	48 8d 3d 00 00 00 00 	lea    0x0(%rip),%rdi        # 14f7 <shutdown+0xb>
    14f7:	e8 00 00 00 00       	callq  14fc <shutdown+0x10>
}
    14fc:	90                   	nop
    14fd:	5d                   	pop    %rbp
    14fe:	c3                   	retq   
