.data
	array: .space 12	#telling assembler to reserve 12 bytes
    line: .asciiz "\n"
.text
main:
	addi $s0, $zero, 5
	addi $s1, $zero, 8
	addi $s2, $zero, 10
	addi $t0, $zero, 0
	
	sw $s0, array($t0)  #storing the value of the $s0 at array(0)
	jal increment       #increasing the $t0 by 4
	
	sw $s1, array($t0)  #storing the value of the $s0 at array(4)
	jal increment
	
	sw $s2, array($t0)  #storing the value of the $s0 at array(8)
	
	addi $t0, $zero, 0	#$t is now equal to 0, as we will be using it again
	
	while:
		bgt $t0, 8 exit     #excueting 1 step less than total step as we are using less than
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
		addi $t0, $t0, 4
		jr $ra
    
    newline:
        li $v0, 4
        la $a0, line
        syscall
        jr $ra