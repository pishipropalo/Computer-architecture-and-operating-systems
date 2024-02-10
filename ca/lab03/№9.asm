	.text
main:
	  addi a7, zero, 5
          ecall
          add t0, zero, a0

          addi a7, zero, 5
          ecall
          add t1, zero, a0  
          
          rem t3, t0, t1

          div t4, t0, t1
          mul t4, t4, t1
          
	  add t2, t3, t4
	  
          add a0, zero, t2
          addi a7, zero, 1
          ecall 
