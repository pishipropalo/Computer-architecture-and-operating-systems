
.data
ans_plus:
    .string "+"
ans_minus:
    .string "-"
ans_stick:
    .string "|"
ans_space:
    .string " "

.macro print_line (%x, %p, %m)
loop:
    beq t3, %x, end_loop
    print_str(%p)
    print_str(%m)
    addi t3, t3, 1
    j loop
end_loop:
    print_str(%p)
    addi t3, zero, 0
.end_macro

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
main:

input_loop:

    read_int(t1)
    read_int(t2)
    
loop:
    beq t4, t2, end
    print_line(t1, ans_plus, ans_minus)
    print_empty
    print_line(t1, ans_stick, ans_space)
    print_empty
    addi t4, t4, 1
    j loop
end:
    print_line(t1, ans_plus, ans_minus)
    print_empty
    print_empty