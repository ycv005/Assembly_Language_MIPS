.data
    newline: .asciiz "\n"
.text
    main:               #main is our caller function
    addi $s0, $zero, 20
    
    jal addnum

    li $v0, 4
    la $a0, newline
    syscall
    
    li $v0, 1
    move $a0, $s0
    syscall

    li $v0, 10
    syscall

    addnum:             #addnum is our calle function
        add $sp, $sp, -4
        sw $s0, 0($sp)
        add $s0, $s0, 10
        
        li $v0, 1
        move $a0, $s0
        syscall

        lw $s0, 0($sp)
        addi $sp, $sp, 4
        
        jr $ra

#-----------code explanation------------#
#Here, save register will be overwrite in the calle funciton so to prevent this, we are saving the value of the $s0 in the stack using stack pointer register($sp)
#In MIPS, the stack grows in the downward mannner. so to allocate a memory, we add -4 to the stack pointer register(pointing at the top of the stack).
#Since, we are storing a value from a register to the the memory, so will be using sw(store word instruction) to store the value of the $s0 in the stack.
#After performing an action and if the work of the overwrite register($s0) is finish then restore the value from the memory(stack) to the register using load word instruction.
#It is important to free up the space in the stack which was allocated for any purpose. Thus, adding 4 to the stack pointer  