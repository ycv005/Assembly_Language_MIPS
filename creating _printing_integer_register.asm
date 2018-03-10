#1st method is to take or print integer from the register
.data

.text
main:
    li $t0, 10        #storing the value 10 in temporary reg 
    move $a0, $t0       #to get result, we need data to be store in register. So we move the value 10 to $a0 from $t0
    li $v0, 1         # 1 is the system call code for printing integer
    syscall

    li $v0, 10
    syscall 


#--------code explanation---------# 
#$a0 is used to store integers, characters, and string "output"
#We were using la instruction command in printing string because we are storing the data in variable and then loading into the register



#Another method for printing integer
#   .data
#        msg: .word 23
#    .text
#    main:
#        li $v0, 1   #system call code for printing integer, it also tell the system to be ready for the printing int
#        lw $a0, msg
#        syscall
#
#        li $v0, 10
#        syscall 


#--------code explanation---------# 
#$a0 is used to store integers, characters, and string "output"
#first printing the message then printing the integer
#to store a integer, we need 4 byte and .word is of 4 byte
#to store a character, we need 1 byte and .byte is the same.
