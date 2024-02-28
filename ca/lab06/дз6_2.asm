
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
input_loop:

    read_int(t1)
    read_int(t2)
    read_int(t3)
    
    add a3, t2, t1
    add a3, a3, t3
    
    beqz a3, end
    
    jal triangle_check

    li a0, 10  
    li a7, 11
    ecall
    
    j input_loop

    

end:
    li a0, 10  
    li a7, 11
    ecall
    li a7, 93
    li a0, 10
    ecall
    
triangle_check: 

    add a4, t1, t2
    add a5, t2, t3
    add a6, t3, t1
    
    blt a5, t1, triangle_not_possible
    blt a6, t2, triangle_not_possible
    blt a4, t3, triangle_not_possible

    li a7, 4
    la a0, ans_yes
    mv a1, zero
    ecall
    jr ra
    

triangle_not_possible:
    li a7, 4
    la a0, ans_no
    mv a1, zero
    ecall
    jr ra
    