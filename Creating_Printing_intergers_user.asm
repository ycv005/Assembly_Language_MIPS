#1st method is to take or print integer from the register
.data
    msg: .asciiz "Enter the number here= "
.text
main:
    li $v0, 4
    la $a0, msg
    syscall

    li $t0, 18
    move $a0, $t0
    li $v0, 1
    syscall

    li $v0, 10
    syscall 


#--------code explanation---------# 
#$a0 is used to store integers, characters, and string "output"
#first printing the message then printing the integer
