
binary_search:

     sub s1, a3, a2
     li s11, 2
     div s1, s1, s11
     add s1, s1, a2

     bgt a2, a3, not_found
     li s11, 4
     mul t0, s11, s1
     add t0, t0, a0
     lw s6, (t0)
     
     beq s6, a1, found
     bgt s6, a1, req_left
     j req_right
     
req_left:

     addi a3, s1, -1
     j binary_search

req_right: 

     addi a2, s1, 1
     j binary_search
      
not_found:

     li a0, -1
     jr ra

found:
     add a0, s1, zero
     jr ra
     