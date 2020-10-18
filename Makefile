# Samantha Foley
#
# CS441/541: Project 3
#
#####################################################################
#
# Type "make" or "make mysh" to compile your code
# 
# Type "make clean" to remove the executable (and any object files)
#
#####################################################################

CC=gcc
CFLAGS=-Wall -g

#
# List all of the binary programs you want to build here
# Separate each program with a single space
#
all: mysh

#
# Main shell program
#
mysh: mysh.c mysh.h 
	$(CC) -o mysh mysh.c  $(CFLAGS)


#
# Cleanup the files that we have created
#
clean:
	$(RM) mysh *.o
	$(RM) -rf *.dSYM *~

#
# Tests
#
include given-tests/Makefile
