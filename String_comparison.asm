#Program for the string comparison
.data
    msg1: .asciiz "Enter the string-"
    msg2: .asciiz "Given String are equal"
    msg3: .asciiz "Given string are not equal"
    str1: .space 100    #telling assembler to reserve the space about 100 bytes and address of the 1st byte is store in the str1
    str2: .space 100
.text
main:
    li $v0, 4
    la $a0, msg1
    syscall

    li $v0, 8
    la $a0, str1
    la $a1, 100
    syscall

    move $t0, $a0

    li $v0, 4
    la $a0, msg1
    syscall

    li $v0, 8
    la $a0, str2
    la $a1, 100
    syscall

    move $t1, $a0

    move $a0, $t0
    move $a1, $t1
    jal comparison
exit:
    li $v0, 10
    syscall

comparison:
    lb $s0, 0($a0)       #this way, i am loading the value present in the $a0 to the $s0
    lb $s1, 0($a1)
    bne $s0, $s1, notequal      #if they are equal, assemble will jump to the notequal label
    beq $s0, $zero, equal    #the reason I didn't choose $s0, $s1, bcoz it will quit when character is equal. But might think why 0? it to tell whether my string comes to an end or not
    #also, if the string will be same then notequal label will not excuted thus at last when string comes to an end, equal label will be executed.
    addi $a0, $a0, 1    #moving to next byte means, next character
    addi $a1, $a1, 1
    j comparison

equal:
    li $v0, 4
    la $a0, msg2
    syscall

    j exit  #finally, jump to the exit label

notequal:
    li $v0, 4
    la $a0, msg3
    syscall
    j exit