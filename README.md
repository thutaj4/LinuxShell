# CS441/541 Shell Project

## Author(s):

Aj Thut, Jack Bates

## Date:

10/17/20


## Description:

Simple Unix shell program. Simulates the shell by taking in the user's commands and executeing the proccesses with similar functinality to the Unix shell.


## How to build the software

Implement both modes, interactive and batch.
For interactive mode, print out the prompt and then get the user's input, repeat this proccess until the user calls "exit"
For batch mode, take in and parse each line of every file passed in unitl the end of the last file is reached.

For each line of input, parse each command from the line and execute them using fork(), execvp(), and waitpid(). 

Implement builtin funtions such as: Jobs, Wait, fg, history, and exit.

Support background jobs and ensure each job is compleated before ending the program.


## How to use the software

Run the program with "./mysh.c"

The program can operate in two modes, batch or interactive mode.

Choose batch mode by passing in text files that contain the cammands to execute.
Place commands in text file, program can go through all files passed in and will exit once done.

Choose interactive mode by passing in no commands and enter them as the shell runs.


Can use file rederection using "<" or ">", put a process in the background with "&", and run more then one command on the same line with ";".

Call "exit" to end the program



## How the software was tested

Self Made tests:

Test1.txt: Basic tests to make sure we can parse a single or multiple commands on one line. 

Test2.txt: Tests for file redirection. Also checks that we ignore blank lines.

Test3.txt: Makes sure that builtin commands don't run in the background when the have an &.

Test4.txt: Checks multiple commands on one line. Also checks the fg, wait, and jobs function to make sure our job t array is storing processes correctly.  

Test5.txt: Another test with multiple commands on lines. Checks ignoring whitespace and lines with no commands. Also checks all builtin commands and makes sure they don't run in the background.  


Tested with the given tests along with exta test files to cover more cases


## Known bugs and problem areas

TODO
