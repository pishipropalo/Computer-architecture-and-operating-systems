.data 
ans_space:
    .string " "

.macro read_int (%x)
li a7, 5
ecall
addi %x, a0, 0
.end_macro

.macro print_int (%x)
add a0, zero, %x
li a7, 1
ecall 
.end_macro

.macro print_int1 (%x)
add a0, zero, %x
li a7, 1
ecall 
li a7, 4
la a0, ans_space
mv a1, zero
ecall
.end_macro


.macro print_str (%x)
    li a7, 4
    la a0, %x
    mv a1, zero
    ecall
.end_macro

.macro print_empty
    li a0, 10  
    li a7, 11
    ecall
.end_macro

.macro listadd(%reg)
    add sp, s0, zero
    addi sp, sp, -4 
    sw %reg, (sp) 
    add s0, zero, sp
.end_macro

.macro listget(%reg, %index)
    
    li t6, -4
    addi %index, %index, 1
    mul t0, %index, t6
    add sp, zero, t0
    
    lw %reg, (sp)

    
    add sp, s0, zero
    li t6, 0
    addi %index, %index, -1
.end_macro

.macro change_element(%val, %index)

    li t6, -4
    addi %index, %index, 1
    mul t0, %index, t6
    add sp, zero, t0
    sw %val, (sp)
    lw s5, (sp)

    add sp, s0, zero
    li t6, 0
    addi %index, %index, -1
   
    
.end_macro
# .macro listcreate(%x)
#     li t6, -4
#     mul t0, %x, t6
#     add sp, sp, t0
#     add s0, sp, zero
#     add t0, zero, zero
#     add t6, zero, zero
# .end_macro
.macro swap_elements(%index1, %index2)
    li t1, 0
    li t2, 0
    li t6, 0
    
    listget (t1, %index1)
    listget (t2, %index2)
    
    change_element(t1, %index2)
    change_element(t2, %index1)
    
    add sp, s0, zero
    li t1, 0
    li t2, 0
    li t6, 0
.end_macro

.macro print_list(%x)
print_loop:
    beqz sp, end_loop
    lw t5, (sp)
    print_int(t5)
    print_str(ans_space)
    addi sp, sp, 4
    j print_loop
end_loop:
    print_empty
    add sp, s0, zero
.end_macro 
   
.macro print_list1(%x)    
print_loop2:
    li s4, 0
    j while
while:

    bgeu s4, %x, end_while  
    
    listget(t5, s4)
    print_int(t5)
    print_str(ans_space)
    addi s4, s4, 1
    j while
end_while:
    print_empty
.end_macro
.text

main:          
     read_int(a3)
     j input_loop
     

input_loop:
     beq t4, a3, end_loop
     read_int(t5)
     listadd(t5)
     addi t4, t4, 1
     j input_loop

end_loop:
     
     #print_list1(a3)
     j sort
sort:

     li a0, 0
     add a1, s0, zero
     li s1, 0
     li s2, 0
     addi s6, a3, -1
     j for
for:

     beq s1, s6, end_for
     neg s1, s1
     add s7, s6, s1
     j for_in_for
     
     
for_in_for:

     beq s2, s7, end_for_in_for
     listget(s4, s2)
     addi s3, s2, 1
     listget(s5, s3)
     bgt s5, s4, change
     addi s2, s2, 1
     j for_in_for
change:
     swap_elements(s2, s3)
     addi s2, s2, 1
     j for_in_for
     
end_for_in_for:

     li s2, 0
     neg s1, s1
     addi s1, s1, 1
     j for
end_for:
      print_list(a3)