.data

.text
main:
    addi $t0, 5000
    addi $t1, 10

    li $v0, 1
    div $a0, $t0, $t1
    syscall

    li $v0, 10
    syscall


#a0 stores the result of the division
