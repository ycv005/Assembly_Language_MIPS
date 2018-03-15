.data
    msg: .asciiz "Enter the number: "
.text
    main:
    li $v0, 4
    la $a0, msg
    syscall

    li $v0, 5               #5 is the system call code for taking user input for integer. The value of integer will be stored in the $v0.
    syscall

    move $t0, $v0      #To avoid data overwritten, we move the value from the $v to $t, because further $v will be used.

    li $v0, 4
    la $a0, msg
    syscall

    li $v0, 1
    move $a0, $t0
    syscall

    li $v0, 10
    syscall