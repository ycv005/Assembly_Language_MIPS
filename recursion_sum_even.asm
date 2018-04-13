.data
	msg: .asciiz "Enter number(number >=1)- "
	msg1: .asciiz "odd"
.text
main:
	li $v0, 4
	la $a0, msg
	syscall

	li $v0, 5
	syscall
	move $a1, $v0

  	jal even

	move $a1, $v0
	jal sum

  	move $t1, $v0
	li $v0, 1
	move $a0, $t1
	syscall

	li $v0, 10
	syscall

sum:
	sub $sp, $sp, 8
	sw $s0, 0($sp)
	sw $ra, 4($sp)

	move $s0, $a1

	#base case when, n=1
	li $v0, 0
	beq $a1, 1, sumdone
	beq $a1, 0, sumdone
	sub $a1, $a1, 2

	jal sum

	add $v0, $v0, $s0

sumdone:
	lw $s0, 0($sp)
	lw $ra, 4($sp)
	add $sp, $sp, 8
	jr $ra

even:
	move $a2, $a1
	addi $t2, $zero, 2
	div $a1, $t2
    mflo $s0	#quotient
	mfhi $s1	#remainder

    bne $s1, 0, odd

    jr $ra

odd:
	sub $v0, $a2, 1
	jr $ra
