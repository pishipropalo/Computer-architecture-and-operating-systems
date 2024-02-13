	.text
main:
	  addi a7, zero, 5
          ecall
          add t0, zero, a0

          addi a7, zero, 5
          ecall
          add t1, zero, a0  
          
          li t3, 1
          sll t3, t3, t1
          
          or t2, t0, t3
	  
          add a0, zero, t2
          addi a7, zero, 1
          ecall 
