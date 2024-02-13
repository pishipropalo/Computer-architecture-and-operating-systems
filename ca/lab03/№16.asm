	.text
main:
	  addi a7, zero, 5
          ecall
          add t0, zero, a0

          addi a7, zero, 5
          ecall
          add t1, zero, a0  
         
	  slti t0, t0, -5
          
          slti t1, t1, 10
          not t1, t1
          
          and t2, t1, t0
	  
          add a0, zero, t2
          addi a7, zero, 1
          ecall 
