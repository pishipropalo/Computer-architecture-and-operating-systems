    .text
main:

    addi a7, zero, 5
    ecall
    add t0, zero, a0

    addi a7, zero, 5
    ecall
    add t1, zero, a0

    slli t2, t0, 2
    
    sub t2, t2, t1
    
    addi t2, t2, 5
    
    srai t2, t2, 1
    
    add a0, zero, t2
    addi a7, zero, 1
    ecall
