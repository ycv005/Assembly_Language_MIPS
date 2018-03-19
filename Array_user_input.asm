.data
    line: .asciiz "\n"
	size: .asciiz "Enter the size of the array-"
	value: .asciiz "\nEnter the value for each element "
.text
main:
	li $v0, 4
	la $a0, size
	syscall

    li $v0, 5		#getting size of array from the user
	syscall
	move $t0, $v0

	#Going to create dynamic memory allocation
	sll $a0, $v0, 2		# sll performs $a0 = $v0 x 2^2 or in general #$a0 = $v0 x b means $a0 = $v0 x b^2
	li $v0, 9			#9 is the system code for service(sbrk) whoes work is to allocate dynamic memory
	syscall				#v0 store the address of the first byte of the dynamically allocated memory

	move $t1, $zero
	move $t4, $zero
	move $t2, $v0		#to avoid data overwritten, storing value in the $t0
	move $t3, $v0

    begin:
		bge $t1, $t0, while
		li $v0, 4
		la $a0, value
		syscall
		li $v0, 5		#user's value input
		syscall
		sw $v0, 0($t2)

		addi $t1, $t1, 1
		addi $t2, $t2, 4
		j begin

	while:
		bge $t4, $t0 exit
		li $v0, 1
		lw $a0, 0($t3)	#loading value from the memory
		syscall
		jal increment
        jal newline
		j while	#jumping unconditionally to while
		
	exit:
	    li $v0, 10
	    syscall

	increment:
		addi $t4, $t4, 1
		addi $t3, $t3, 4
		jr $ra
    
    newline:
        li $v0, 4
        la $a0, line
        syscall
        jr $ra

		#----------------Code Explanation-------------#
		#All the branch instruction
		#b	target		#  unconditional branch to program label target
		#beq	$t0,$t1,target	#  branch to target if  $t0 = $t1
		#blt	$t0,$t1,target	#  branch to target if  $t0 < $t1
		#ble	$t0,$t1,target	#  branch to target if  $t0 <= $t1
		#bgt	$t0,$t1,target	#  branch to target if  $t0 > $t1
		#bge	$t0,$t1,target	#  branch to target if  $t0 >= $t1
		#bne	$t0,$t1,target	#  branch to target if  $t0 != $t1