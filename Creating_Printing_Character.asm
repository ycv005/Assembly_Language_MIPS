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
#.byte is the data type which format the given input into a character.
