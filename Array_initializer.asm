.data
	array: .word 10:3	#telling assembler to make a array of size 3 and each element initialized with 12. word=4 bytes. Thus, each element is of 4 bytes. 
    line: .asciiz "\n"
.text
main:	
	addi $t0, $zero, 0	#$t is now equal to 0
	
	while:
		bgt $t0, 8 exit     #each increment is done by 4, mean 8/4=2, we are running this loop for 3 times, 1st when $t0=0, then $t0=4, $t0=8
		li $v0, 1
		lw $a0, array($t0)	#loading value from the array, and $t0 is acting as the offset
		syscall
		jal increment
        jal newline
		
		j while	#jumping unconditionally to while
		
	exit:
	li $v0, 10
	syscall
		
	increment:
		addi, $t0, $t0, 4
		jr $ra

    newline:
        li $v0, 4
        la $a0, line
        syscall
        jr $ra