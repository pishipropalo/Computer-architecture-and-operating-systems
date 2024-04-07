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

.text
     addi a3, a3, 10
     j main
end_loop:
     print_empty

handler:
     csrrw  t0, uepc, zero
     addi   t0, t0, 28
     csrrw  zero, uepc, t0
     uret
main:
     
     la     t0, handler
     csrrw  zero, utvec, t0
     csrrsi zero, ustatus, 1
loop:
     beq t4, a3, end_loop

     li a7, 5
     ecall

     li a7, 1
     ecall
               
     print_empty
     
     addi t4, t4, 1
     j loop
