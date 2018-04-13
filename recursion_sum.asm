.data
	msg: .asciiz "Enter number(number >=1)- "
.text
main:
	li $v0, 4
	la $a0, msg
	syscall

	li $v0, 5
	syscall
	move $a1, $v0

	jal sum

  move $t1, $v0
	li $v0, 1
	move $a0, $t1
	syscall

	li $v0, 10
	syscall

sum:
	add $sp, $sp, -8
	sw $s0, 0($sp)
	sw $ra, 4($sp)

	move $s0, $a1

	#base case when, n=1
	li $v0, 1
	beq $a1, 1, sumdone

	sub $a1, $a1, 1

	jal sum

	sum $v0, $v0, $s0

sumdone:
	lw $s0, 0($sp)
	lw $ra, 4($sp)
	add $sp, $sp, 8
	jr $ra
