
.data
ans_no:
    .string "N"
ans_yes:
    .string "Y"

.macro read_int (%x)
li a7, 5
ecall
addi %x, a0, 0
.end_macro
.macro print_int (%x)
add a0, zero, %x
li a7, 1
ecall 
          
li a0, 10  
li a7, 11
ecall
.end_macro

.text



    


main:
    addi t4, t4, 1
    addi t5, t5, 2
input_loop:

    read_int(t1)
    read_int(t2)
    read_int(t3)
    
    
    jal triangle_check
    beq s0, t4, print_yes
    beq s0, t5, print_no
    
    j input_loop

    

end:
    li a0, 10  
    li a7, 11
    ecall
    li a7, 93
    li a0, 10
    ecall
    
triangle_check: 
    add a3, t2, t1
    add a3, a3, t3
    
    beqz a3, end
    
    add a4, t1, t2
    add a5, t2, t3
    add a6, t3, t1
    
    blt a5, t1, triangle_not_possible
    blt a6, t2, triangle_not_possible
    blt a4, t3, triangle_not_possible

    addi s0, zero, 1
    jr ra
    

triangle_not_possible:
    addi s0, zero, 2
    jr ra
print_yes:
    li a7, 4
    la a0, ans_yes
    mv a1, zero
    ecall
    
    li a0, 10  
    li a7, 11
    ecall
    j input_loop
print_no:
    li a7, 4
    la a0, ans_no
    mv a1, zero
    ecall
    
    li a0, 10  
    li a7, 11
    ecall
    j input_loop