.data
    mile: .float 1.6
.text
main:
    li $v0, 2 # 2 is system call code for printing the float
    lwc1 $f12, mile  
    syscall

    li $v0, 10
    syscall

#---------code explaination----------#
#integer and float both are different. interger are load using lw while float is load using lwc1. All the floating register
#are store in the coprocessor one. There are $f0-$f31 single precision floating register.
#To load from coprocessor one, we use lwc1(load woed coprocessor one)
