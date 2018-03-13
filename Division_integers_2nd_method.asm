.data

.text
main:
    addi $t0, 30
    addi $t1, 6

    div $t0, $t1

    mflo $s0
    mfhi $s1

    li $v0, 1
    move $a0, $s0       #for printing the quotient stores in the LO register
    #move $a0, $s1      #for printing the remainder stores in the HI register
    syscall

    li $v0, 10
    syscall

#---------code explanation------------#
#div instruction can be performed using 2 or 3 parameters depending upon you. Here, we will be going with 2 para.
#while dividing, the quotient and remainder will be store in LO(acessible by mflo) and HI(acessible by mfhi) registers respectively.
