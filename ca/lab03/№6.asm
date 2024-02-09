    .text
main:

    addi a7, zero, 5
    ecall
    add t0, zero, a0

    addi a7, zero, 5
    ecall
    add t1, zero, a0

    slli t3, t0, 2
    add  t3, t3, t0
    add  t3, t3, t0
    
    slli t4, t1, 1
    add t4, t4, t1 
    
    sub t2, t3, t4
    
    add a0, zero, t2
    addi a7, zero, 1
    ecall
