.data
.text
    main:                           #main is the caller(who calls other function/procedure)
        addi $a0, $zero, 10
        addi $a1, $zero, 15

        jal addnum

        li $v0, 1
        move $a0, $v1       #Everytime, we move the value to the argument register because, print is a function & to print the result we need to pass the result as argument
        syscall

    li $v0, 10
    syscall

    addnum:                     #addnum is the calle(the function which is called)
        add $v1, $a0, $a1       #At this very line, we are passing $s0, & $s1 as the argument and then they are used as input parameters
        jr $ra

#-------------code explanation--------------#
#$v are the registers who stores the result of the funtion. There are only 2 such registers
#$a are the registers who are used as the argument of a system or function call. There are only 4 such registers
#Since, we have the limited number of the registers. So, it may happens sometime that, value stored in the a registers will be lost due to overwritten
#To save from the data overwritten, caller and calle takes the responsiblity of storing the value of the particular registers.
#caller takes the responsibility of the register-argument, result value, & temporary
#calle takes the responsibility of the register-saved, & $ra
#calle and caller, stores the vale at MIPS stack