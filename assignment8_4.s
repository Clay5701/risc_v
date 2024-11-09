.data
    array: .word 2, 1, 3, 4, 5, 6
    length: .word 6

.text
    la a0, array
    lw a1, length

selectionSort:  addi sp, sp, -40
                sw s0, 0(sp)
                sw s1, 4(sp)
                sw s2, 8(sp)
                sw s3, 12(sp)
                sw s4, 16(sp)
                sw s5, 20(sp)
                sw s6, 24(sp)
                sw s7, 28(sp)
                sw s8, 32(sp)
                sw ra, 36(sp)

                add s0, zero, zero
                add s2, a0, zero
                add s6, a1, zero
                addi s3, s6, -1

            FOR2:   bge s0, s3, Exit1
                    slli s4, s0, 2
                    add s4, s2, s4
                    add a0, s4, zero 
                    sub a1, s6, s0 

                    jal ra, findMinimum

                    add s1, a0, s0

                IF1:    beq s1, s0, ENDIF1
                THEN1:  slli s1, s1, 2
                        add s1, s2, s1
                        lw s7, 0(s4)
                        lw s8, 0(s1)
                        sw s8, 0(s4)
                        sw s7, 0(s1)

                ENDIF1: addi s0, s0, 1
                        j FOR2
            
            Exit1:  lw s0, 0(sp)
                    lw s1, 4(sp)
                    lw s2, 8(sp)
                    lw s3, 12(sp)
                    lw s4, 16(sp)
                    lw s5, 20(sp)
                    lw s6, 24(sp)
                    lw s7, 28(sp)
                    lw s8, 32(sp)
                    lw ra, 36(sp)
                    addi sp, sp, 40

                    jr ra
                

findMinimum:    add t0, zero, zero
                addi t1, zero, 1
                lw t3, 0(a0)

            FOR1:   bge t1, a1, Exit
                    slli t2, t1, 2
                    add t2, a0, t2
                    lw t4, 0(t2)

                IF:     bge t4, t3, ENDIF
                THEN:   add t0, t1, zero
                        add t3, t4, zero

                ENDIF:  addi t1, t1, 1
                        j FOR1
                        
            Exit:   add a0, t0, zero
                    jr ra