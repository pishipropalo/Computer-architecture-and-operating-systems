
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
          addi s1, s1, 100
          addi s2, s2, 200
          addi s3, s3, 300
          addi s4, s4, 400
          addi s5, s5, 500
          addi s6, s6, 600
          addi s7, s7, 700

for:
          #print_int(s7)
          read_int(t1)
          li t6, -4
          mul s0, t1, t6
          add sp, sp, s0
          add t0, zero, zero
          addi t0, t0, -1
next: 
          #print_int(s1)
          add sp, s0, zero
          addi t0, t0, 1
          beq t1, t0, end_for
          beq t0, zero, first_loop
          j pre_loop
pre_loop:
          #print_int(s2)
          read_int(t6)
          li t5, 0
          j loop
loop: 
          #print_int(s3)
          beq t4, t5, end_loop
          lw t2, (sp)
          #print_int(t2)
          beq t2, t6, next
          addi t5, t5, 1
          addi sp, sp, 4
          j loop
first_loop:
          #print_int(s4)
          read_int(t6)
          print_int(t6)
          addi sp, sp, -4
          add s0, zero, sp
          sw t6, (sp)          
          addi t4, t4, 1
          j next
                 
end_loop:   
          #print_int(s5) 
          print_int(t6)
          #addi s0, s0, -4
          #mul t3, t4, s0
          #add sp, sp, t3
          add sp, s0, zero
          addi sp, sp, -4 
          sw t6, (sp) 
          add s0, zero, sp
          addi t4, t4, 1
          j next

end_for: 
         #print_int(s6)
         li a0, 10  
         li a7, 11
         ecall
