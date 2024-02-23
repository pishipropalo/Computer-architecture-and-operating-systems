
.macro read_int (%x)
li a7, 5
ecall
mv %x, a0
.end_macro
.macro print_int (%x)
add a0, zero, %x
li a7, 1
ecall 
          
li a0, 10  
li a7, 11
ecall
.end_macro
main:  


for:
          read_int(t1)
          li t6, -4
          mul t0, t1, t6
          add, sp, sp, t0
          mv t0, zero
          
next:
          beq t0, t1, end_for
          read_int(t3)
          li t6, 2
          rem t5, t3, t6
          beq t5, zero, even
          j end_if
even:    
          li t6, 4
          mul t6, t2, t6
          sw t3, (sp)
          addi t2, t2, 1
          addi sp, sp -4
          j end_if
end_if:
          addi t0,t0, 1
          j next
end_for:
          li t0, 0
          addi sp, sp, 4
          addi, t2, t2, -1
          blt t2, zero, end
          j loop

loop:
          beq t0, t2, end_loop
          lw t3, (sp)
          print_int(t3)
          addi t0, t0, 1
          addi sp, sp, 4
          j loop
          
end_loop:
         lw t3, (sp)
         print_int(t3)
end:
         li a0, 10  
         li a7, 11
         ecall
