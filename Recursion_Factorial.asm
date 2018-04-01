.data
.text
main:
    li $v0, 5
    syscall

    #calling the factorial value
    #so we need the user input value as the argument for the factorial function

    move $a0, $v0     #$a0 will be acting as the argument for the given function
    jal findfact
    #storing the result
    move $s0, $v0

    #display the result
    li $v0, 1
    move $a0, $s0
    syscall

    li $v0, 10
    syscall

    findfact:                   #create space in stack about 8 bytes to store the address present in the $ra and argument $a0 which will be moved to $s0
        sub $sp, $sp, 8
        sw $ra, 0($sp)
        sw $s0, 4($sp)

        #base case or when to stop the recursion

        li $v0, 1                   #before we jump to the factdone, assigning the value of the $v0 as 1.
        beq $a0, 0, factdone        #if the argument $a0 value is 0, then program will be jumped to the factdone

        move $s0, $a0               #argument will be used in every fucntion call, so we are storing its value to a other register
        sub $a0, $a0, 1             #$a0 = $a0 - 1

        jal findfact                

        mul $v0, $v0, $s0           #$v0 = $v0 x $s0

        factdone:
            lw $ra, 0($sp)
            lw $s0, 4($sp)
            add $sp, $sp, 8
            jr $ra              #when a0 equal to 0, it jump to the parent call 1st time jal fact else(a0 not equal to 0), it will jump 
                                #to the instruction next to the jal findfact that is mul and then factdone wil again come in role.
