.data
	msg1: .asciiz "$t0 is less than $t2"
	msg2: .asciiz "$t0 is not less than $t2"
.text
main:
	addi $t0, $zero, 40
	addi $t1, $zero, 20

	slt $s0, $t0, $t1	#slt is the set if less than instruction which compare $t0<$t1, if true then $s0=1 else $s0=0
	
	beq $s0, 1, printmsg1	#beq is the branch equal instruction which compare $t0==$t1 & if they are equal then jump to the given label
	bne $s0, 1, printmsg2	#bne is the branch not equal instruction which compare $t0!=$t1 & if result is true i.e., both are not equal then it will jump to the label

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