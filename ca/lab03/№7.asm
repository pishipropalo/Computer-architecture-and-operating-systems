    .text
main:

    addi a7, zero, 5
    ecall
    add t0, zero, a0

    addi a7, zero, 5
    ecall
    add t1, zero, a0
    
    addi t5, zero, 2
    mul t3, t0, t5
    
    mul t3, t3, t0
    
    addi t6, zero, 3
    mul t4, t1, t6
    
    sub t2, t3, t4  
    
    addi t2, t2, 4
    
    add a0, zero, t2
    addi a7, zero, 1
    ecall
