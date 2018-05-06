#Carl Closs, Johan Ferreras, Peter Golden
SHELL := /bin/bash
NUM = 5
HEADERS = workloads.hpp policies.hpp
COMPILE = gcc
FLAGS = -g -O0  -Wall -Wextra -Wno-unused-parameter -lrt -pthread -lm
NAME1 = ssfs
NAME2 = ssfs_mkdsk
FILE =  Prog$(NUM)Closs_ccloss1.tar.gz
TESTOPTS = lol
DEBUG_OPTS = --silent -x cmds.txt
all: $(NAME1)
test: new $(NAME1)
	valgrind ./$(NAME1) TEST test1.txt
debug: new $(NAME1)
	gdb $(DEBUG_OPTS)
common: common.c
	$(COMPILE) -c common.c $(FLAGS)
time: 
	$(COMPILE) -c $(FLAGS)
push:
	#@read -p "commit message (input ctrl+C to stop the push process, 1 line only): " MESSAGE
	git add -A
	git commit #-m "$(MESSAGE)"
	git push 
	@#Only in bash, read can have a prompt,
	@#and put the entire imput string into an enviroment variable called $REPLY
$(NAME1): $(NAME1).c common.h disk_ops.c disk_sched.c 
	$(COMPILE) -c $(FLAGS) disk_ops.c disk_sched.c $(NAME1).c 
	$(COMPILE) $(FLAGS) $(NAME1).o disk_ops.o disk_sched.o -o $(NAME1)
$(NAME2): $(NAME2).c
	$(COMPILE) -c $(FLAGS) $(NAME2).c
	$(COMPILE) $(FLAGS) $(NAME2).o -o $(NAME2)
new: $(NAME2) clean 
	./$(NAME2) 1024 512 TEST
	chmod 0777 TEST
clean:
	rm -f *.o *.swp *.gch .go* $(NAME1) .nfs* DISK TEST
submit: $(NAME1) clean
	cd .. && 	tar -cvzf  $(FILE) Prog$(NUM)Closs_ccloss1
ifneq "$(findstring remote, $(HOSTNAME))"  "remote"
		firefox submit.htm
else 
		mutt -s "Prog$(NUM)_submission" ccloss1@binghamton.edu <submit.htm -a ../$(FILE)
endif
	#hack to determine whether we should use firefox or email to self
