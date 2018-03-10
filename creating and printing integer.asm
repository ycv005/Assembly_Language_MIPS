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