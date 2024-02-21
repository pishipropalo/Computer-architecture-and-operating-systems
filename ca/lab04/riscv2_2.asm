#program 2 with a smaller number of instructions
	.text
main:
	  addi a7, zero, 5
          ecall
          add t0, zero, a0

          addi a7, zero, 5
          ecall
          add t1, zero, a0  
         
	 mul t2, t0, t1
	 
         add a0, zero, t2
         addi a7, zero, 1
         ecall 
