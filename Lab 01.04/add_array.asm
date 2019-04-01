.data
msg: .asciiz "The result of addition is: "
array: .word 5,10,15,30      #the integer array

.text
 
la $t1,array
lw $t4, 0($t1)
addi $t6,$t4,0 
addi $t3, $t1,0
li $s0, 0

k:
add $s0, $s0, 1
bge $s0, 4, nk       #change 4 to length of array
addi $t3, $t3, 4
lw $t4, 0($t3)
add $t6, $t6, $t4
j k

nk:
li $v0,4 
la $a0,msg
syscall
 
li $v0,1
move $a0,$t6
syscall
 
li $v0,10
syscall
