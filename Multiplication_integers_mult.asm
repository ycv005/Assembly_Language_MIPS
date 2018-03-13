.data

.text
main:
    addi $t0, 5000
    addi $t1, 10

    mult $t0, $t1   #mult for signed multiplication and multu for the unsigned multiplication

    mflo $s0
    li $v0, 1
    add $a0, $zero, $s0
    syscall

    li $v0, 10
    syscall


    #--------code explanation--------#
#Pseudo-instructions will be translated into real instructions by the assembler. (If Move is used instead of add | move is a pseudo instruction | add is the real instruction)
#addi is the instruction when used then there is no need to take variables from the memory because address field of instruction(addi) acts as operand and it accept the value there only.
#mult is instruction which only takes two parameters and multiplication result is stored in the two special registers{HI(high) & LO(low)}, which are only used for storing the result of the multiplication and division.
#Remember that the result of two 32 bit numbers yields a 64 bit number. The result will store in HI and LO.
#The 32 most significant bits will be held in HI(accessible by mfhi instruction) while 32 least significant bits will be held in LO(accessible by mflo instruction).
