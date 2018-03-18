.data
	msg: .asciiz "Loop comes to an end"
    line: .asciiz "\n"
.text
main:
	addi $t0, $zero, 0
	
	while:
		bgt $t0, 10 exit  #bgt is the branch greater than instruction, compare $t>10, if true then exit label will be executed.
		
		addi $t0, $t0, 1
		
		jal printnumber
        jal newline
		
		j while	#Here, we are jumping to the while unconditionally
	
	exit:
        jal newline
		li $v0, 4
		la $a0, msg
		syscall
		
		li $v0, 10
		syscall
	
	printnumber:
		li $v0, 1
		move $a0, $t0
		syscall
		jr $ra

    newline:
        li $v0, 4
        la $a0, line
        syscall
        jr $ra