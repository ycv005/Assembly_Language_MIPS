.data

.text
main:
    li $v0, 5
    syscall

    move $t0, $v0
    #calling the factorial value
    #so we need the user input value as the argument for the factorial function
    move $a0, $t0     #$a0 will be acting as the argument for the given function
    jal findfact
    #storing the result
    move $s0, $v0

    #display the result
    li $v0, 1
    move $a0, $s0
    syscall

    li $v0, 10
    syscall

    findfact:
        sub $sp, $sp, 8
        sw $ra, 0($sp)
        sw $s0, 4($sp)

        #base case or when to stop the recursion

        li $v0, 1
        beq $a0, 0, factdone

        move $s0, $a0
        sub $a0, $a0, 1

        jal findfact

        mul $v0, $v0, $s0

        factdone:
            lw $ra, 0($sp)
            lw $s0, 4($sp)
            add $sp, $sp, 8
            jr $ra