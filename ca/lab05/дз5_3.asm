
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
          mv t0, zero
next:
          beq t0, t1, end_for
          read_int(t3)
          li t6, 2
          rem t5, t0, t6
          beq t5, zero, even
          li t6, -1
          mul t3, t3, t6
          add t2, t2, t3
          j end_if
even:
          add t2, t2, t3
          j end_if
end_if:
          addi t0,t0, 1
          j next
end_for:
          print_int(t2)