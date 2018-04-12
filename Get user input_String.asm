.data
    msg: .asciiz "Hello, "      #enter your name, here
    userinput: .space 30   #it is just like delcaring array of size 30 bytes and using it, user will give input
.text
    main:
    li $v0, 4
    la $a0, msg
    syscall

    li $v0, 8       #8 is the system call code for the getting string as input
    la $a0, userinput       #Always need to pass address of the variable to $a0 (stores the address where input has to given)
    la $a1, 30              #$a1 is used to tell my maximum length of the input is 30
    syscall

    move $t0, $a0
    
    li $v0, 4
    la $a0, msg
    syscall

    li $v0, 4
    move $a0, $t0   #we are not using here la instruction bcoz we are not loading memory from the memory.
    syscall

    li $v0, 10
    syscall
