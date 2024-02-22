main:
	  addi a7, zero, 5
          ecall
          add t0, zero, a0

          addi a7, zero, 5
          ecall
          add t1, zero, a0  
          
          addi a7, zero, 5
          ecall
          add t3, zero, a0

          addi a7, zero, 5
          ecall
          add t4, zero, a0  
          
          add t2, t0, t3
          
          add t5, t1, t4
	 
          add a0, zero, t2
          addi a7, zero, 1
          ecall 
          
          addi a0, zero, 10  
          addi a7, zero, 11
          ecall    
	  
	  add a0, zero, t5
          addi a7, zero, 1
          ecall 
          
          addi a0, zero, 10  
          addi a7, zero, 11
          ecall    