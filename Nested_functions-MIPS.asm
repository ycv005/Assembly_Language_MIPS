.data
    newline: .asciiz "\n"
.text
    main:               #main is our caller function
    addi $s0, $zero, 20
    
    jal addnum
    
    li $v0, 1
    move $a0, $s0
    syscall

    li $v0, 10
    syscall

    addnum:             #addnum is our calle function
        add $sp, $sp, -8        #-8? because we need to store the value of the $ra and $s0 in the stack such that each of them will take only 4 byte
        sw $s0, 0($sp)          #storing the value of the $s0 reg. in the starting of the stack
        sw $ra, 4($sp)          #stroing the value of the $ra reg. at the top of the stack.

        add $s0, $s0, 10

        li $v0, 1
        move $a0, $s0
        syscall

        jal addnewline          #calling function inside a function modified the value of $ra. To avoid this, we store the value of $ra in stack before this step.

        lw $s0, 0($sp)
        lw $ra, 4($sp)
        addi $sp, $sp, 8
        
        jr $ra

    addnewline:
        li $v0, 4
        la $a0, newline
        syscall

        jr $ra

#-----------code explanation------------#
#Here, we are calling function wihtin a function so, so the address stores in $ra will be modified and thus we caught in a infinity loop.
#So that's why we are storing the value of $ra and $s0, in the stack so that we can retreive those data again.
