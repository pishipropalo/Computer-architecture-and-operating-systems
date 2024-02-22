
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
          blt t1, zero, pos
          j next
pos:
          neg t1, t1
          j next
next:
          addi t3, zero, 10
          blt t1, t3, end_for
          li t6, 10
          rem t5, t1, t6
          add t2, t2, t5
          div t1, t1, t6
          j next
end_for:
          add t2, t1, t2
          print_int(t2)