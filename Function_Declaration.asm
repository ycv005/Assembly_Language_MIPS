.data
    msg: .asciiz "Here is how a function is defined"
.text
    main:                   #main is the function or label and also known as procedure
        jal message         #jal= jump and link instruction

    li $v0, 10
    syscall

    message:                #message is the other function
        li $v0, 4
        la $a0, msg
        syscall

        jr $ra              #jr is the register which stores the address of the next instruction at the time before jumping or going to any function call

#--------code explanation---------------#
#jal label: what this do, it jumps to the label and before jumping to the function, it allocation the address of the next instruction to the $ra.
#jr instruction is used to jump to the address stores in the $ra
