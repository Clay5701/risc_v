#-----Question 4 Part A-----
IF:     bge t1, t0, ELSE

THEN:   addi t0, t0, -6
        slli t2, t0, 1
        slli t3, t0, 2
        add t2, t2, t3
        add t0, t2, t0
        srai t0, t0, 1
        j ENDIF

ELSE:   addi t1, t1, 7
        srai t1, t1, 4

ENDIF: