.data
#.data is the section where all the variables are declared or initalized
# to comment in assembly language, # is used

    message: .asciiz "Hello, World. This is the 1st program in Assembly language\n"

#message is variable which store my string
#.asciiz is the data type which tell to store the given input into string format where null terminator is automatically added.
#.ascii is the data type which tell to store the given input into string format where null terminator is not automatically added.

.text
#text segment is the segment where all the code is written

main:
    li $v0, 4 # 4 is the system call code for printing the "string". For printing integer it is 1.

    #li is the load immediate. Here 4 is load in the $v0 register
#To request a service, a program loads the system call code into register $v0 and 
    #the arguments into registers $a0, ..., $a3 (or $f12 for floating point values). 
    #System calls that return values put their result in register $v0 (or $f0 for floating point results).
    
    la $a0, message #to print out our message, we have to load the address of the variable "message" to the register $a0
    syscall #invoking the system to call the function which is stored in $v0. Here, we are calling the print function which is specified in $v0

#when to use li and la instruction
    #If you are loading something which will be used as address then used la other wise use li


    li $v0, 10 # 10 is the system call code to terimate the program
    syscall  #program is terminated

