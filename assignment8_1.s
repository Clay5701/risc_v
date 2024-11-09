.data
    array: .word 2, 1, 3, 4, 5, 6
    length: .word 6
    value: .word 3

.text
    la a0, array
    lw a1, length
    lw a2, value

linearSearch:   add t0, zero, zero     # i = 0
                addi t3, zero, -1
            
            FOR:    bge t0, a1, EXIT
                    slli t1, t0, 2 
                    add t1, a0, t1 # a + i
                    lw t2, 0(t1) # *(a + 1)

                IF:     bne t2, a2, ELSE
                THEN:   add t3, t0, zero
                        j EXIT
                
                ELSE:   addi t0, t0, 1
                        j FOR
                
            EXIT:   add a0, t3, zero
                    jr ra

                