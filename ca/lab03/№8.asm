	.text
main:
	  addi a7, zero, 5
          ecall
          add t0, zero, a0

          addi a7, zero, 5
          ecall
          add t1, zero, a0  

          addi t0, t0, 5 
          div t4, t0, t1
          
	  addi t1, t1, -1 
          addi t6, zero, 10
          div t2, t6, t1
	  
	  add t2, t2, t4
	  
          add a0, zero, t2
          addi a7, zero, 1
          ecall 
