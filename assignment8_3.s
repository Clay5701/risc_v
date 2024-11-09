.data
    array: .word 2, 1, 3, 4, 5, 6
    length: .word 6

.text
    la a0, array
    lw a1, length

selectionSort:  addi sp, sp, -8
                sw s0, 0(sp)
                sw s1, 4(sp)

                add t0, zero, zero
                addi t1, a1, -1
            
            FOR1:   bge t0, t1, EXIT1
                    add t2, t0, zero
                    addi t3, t0, 1
                
                FOR2:   bge t3, a1, EXIT2
                        slli t4, t3, 2
                        add t4, a0, t4
                        lw s0, 0(t4)

                        slli t6, t2, 2
                        add t6, a0, t6
                        lw s1, 0(t6)

                    IF:     bge s0, s1, ENDIF
                    THEN:   add t2, t3, zero

                    ENDIF:  slli t4, t0, 2
                            add t4, a0, t4
                            lw s0, 0(t4)

                            slli t6, t2, 2
                            add t6, a0, t6
                            lw s1, 0(t6)

                            sw s0, 0(t6)
                            sw s1, 0(t4)

                        addi t3, t3, 1
                        j FOR2

                EXIT2:  addi t0, t0, 1
                        j FOR1

            EXIT1:  lw s0, 0(sp)
                    lw s1, 4(sp)
                    addi sp, sp, 8

                    jr ra   