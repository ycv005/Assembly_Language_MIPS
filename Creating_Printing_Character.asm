.data
    msg: .byte 'a'
.text
main:
    li $v0, 4
    la $a0 msg
    syscall

    li $v0, 10
    syscall

#-------code explanation---------#
#.byte(8 bits) is the data type which can be used to store character and integer(non fractional numbers)
