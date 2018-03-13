.data

.text
main:
    addi $t0, $zero, 5
    addi $t1, $zero, 10

    li $v0, 1
    mul $a0, $t0, $t1
    syscall

    li $v0, 10
    syscall

#--------------code Explanation------------#
#this time we are not taking data from the memory part(.data section)
#using instruction, addi (add immediate) makes its address part of the instruction to work as operand. so that's why we are directly taking value in the register
#mulitplication can be done using 3 instruction i.e., mul, mult, sll. 
#mul- uses 3 parameters while mult uses 2
#sll(shift left logical) is very efficient way of multiply but it doesn't give much flexilibity as mul and mult gives
#So, mul and mult are more preferred than sll
