.data
    newline: .asciiz "\n"
.text
    main:               #main is our caller function
    addi $t0, 20
    
    jal addnum

    li $v0, 4
    la $a0, newline
    syscall
    
    li $v0, 1
    move $a0, $t0
    syscall

    li $v0, 10
    syscall

    addnum:             #addnum is our calle function
        li $v0, 1
        add $a0, $t0, 10
        syscall
        jr $ra

#----------code explanation------------#
#Caller function saves the value of temporary registers, argument registers, & value registers(function return value).
#Here, we are trying to modify the $t registers and it get modified for a instance as the caller save the value of the $t register and caller gives permission to the calle function to do so.
#So, here there is no need of storing value of the $t register in the stack.
