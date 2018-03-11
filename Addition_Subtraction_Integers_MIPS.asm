.data
    t1: .word 34
    t2: .word 16
.text
main:
    lw $t0, t1
    lw $t1, t2

    li $v0, 1
    add $a0, $t0, $t1    #use- sub $a0, $t0, $t1 #for subtraction
    syscall

    li $v0, 10
    syscall

#--------Code Explaination---------#
#using .word(4 bytes) to load the integers
#$t registers instead of $a because register are used as function arugments and system call arguments.
#$t registers are simply used to store the immediate value and that data will be lost acroos a function call.
#$s can be used instead of $t as both work same but they differentiate each other in term- how they are used. 
#$s used to save the value even across the function call
