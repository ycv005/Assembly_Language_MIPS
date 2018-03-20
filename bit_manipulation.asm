#A Program to clear bit. Suppose we have 11 = 1011 (in binary) & when we apply bit manipulation for a clearing last bit, it changes from 1011 to 1010 that is 10(decimal)
#To do this we need a mask. 
.data
.text
main:
	li $v0, 5
	syscall
	move $a0, $v0
	jal bitmanipulate

    #when bitmanipulate function ends, the $v0 still have the result of the bitmanipulate.
    move $s0, $v0
    li $v0, 1
    move $a0, $s0
	syscall

	li $v0, 10          #terminating the program      
	syscall

    bitmanipulate:
        #making mask, following two line is the making of mask.
	    addi $s0, $zero, -1         #s0 = -1, so it will be presented as ...11111111 (32 times 1, if presenting number in 32 bit)
	    sll $s0, $s0, 1             #now $s0 = ...11111110, shifting one bit to left
	    
	    and $v0, $a0, $s0           #
        #$v0 store the result of the function 
	    jr $ra