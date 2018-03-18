.data
	msg1: .asciiz "Given inputs are equal"
	msg2: .asciiz "Given inputs are not equal"
.text
main:
	addi $t0, $zero, 10
	addi $t1, $zero, 20

	
	
	beq $t0, $t1, printmsg1	#beq is the branch equal instruction which compare $t0==$t1 & if they are equal then jump to the given label
	bne $t0, $t1, printmsg2	#bne is the branch not equal instruction which compare $t0!=$t1 & if result is true i.e., both are not equal then it will jump to the label

return_here:
	li $v0, 10
	syscall

printmsg1:
	li $v0, 4
	la $a0, msg1
	syscall
	j return_here

printmsg2:
	li $v0, 4
	la $a0, msg2
	syscall
	j return_here