	.text
main:
	  addi a7, zero, 5
          ecall
          add t0, zero, a0

          li t1, -1
          slli t1, t1, 5
          
          and t2, t0, t1
	  
          add a0, zero, t2
          addi a7, zero, 1
          ecall 
