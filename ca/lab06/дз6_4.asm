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

.macro exit
    li a0, 10  
    li a7, 93
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
    print_empty
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

.macro compare(%size, %adress, %comp_func)
    beqz %comp_func, comp1
    li s10, 10
    rem s8, s5, s10
    rem s9, s4, s10
    bgt s8, s9, ret2
    li s11, 1
    j end_compare
ret2:
    li s11, 0
    j end_compare
    
comp1:
    bgt s4, s5, ret1
    li s11, 1
    j end_compare
ret1:
    li s11, 0
    j end_compare
end_compare:

.end_macro
.text

main:          
     read_int(a3)
     read_int(a4)
     j input_loop
     

input_loop:
     beq t4, a3, end_loop
     read_int(t5)
     listadd(t5)
     addi t4, t4, 1
     j input_loop

end_loop:
     beqz a4, sort_t_is_0
     
     j sort_t_is_1

sort_t_is_0:

     li a0, 0
     add a1, s0, zero
     li s1, 0
     li s2, 0
     addi s6, a3, -1
     j for_t_is_0
for_t_is_0:

     beq s1, s6, end_for_t_is_0
     neg s1, s1
     add s7, s6, s1
     j for_in_for_t_is_0
     
     
for_in_for_t_is_0:
     
     beq s2, s7, end_for_in_for_t_is_0
     listget(s4, s2)
     addi s3, s2, 1
     listget(s5, s3)
     compare(a3, sp, a4)

     bnez s11, change_t_is_0
     addi s2, s2, 1
     j for_in_for_t_is_0
change_t_is_0:

     swap_elements(s2, s3)
     addi s2, s2, 1
     j for_in_for_t_is_0
     
end_for_in_for_t_is_0:

     li s2, 0
     neg s1, s1
     addi s1, s1, 1
     j for_t_is_0
end_for_t_is_0:
      print_list(a3)
      exit
  
  
  
sort_t_is_1:

     li a0, 0
     add a1, s0, zero
     li s1, 0
     li s2, 0
     addi s6, a3, -1
     j for_t_is_1
for_t_is_1:

     beq s1, s6, end_for_t_is_1
     neg s1, s1
     add s7, s6, s1
     j for_in_for_t_is_1
     
     
for_in_for_t_is_1:
     
     beq s2, s7, end_for_in_for_t_is_1
     listget(s4, s2)
     addi s3, s2, 1
     listget(s5, s3)
     compare(a3, sp, a4)

     bnez s11, change_t_is_1
     addi s2, s2, 1
     j for_in_for_t_is_1
change_t_is_1:

     swap_elements(s2, s3)
     addi s2, s2, 1
     j for_in_for_t_is_0
     
end_for_in_for_t_is_1:

     li s2, 0
     neg s1, s1
     addi s1, s1, 1
     j for_t_is_0
end_for_t_is_1:
      print_list(a3)
      exit