#-----Question 4 Part B-----
IF:     blt t1, t0, ELSE

THEN:   slli t2, t1, 2  # t2 = t1 * 4
        add t1, t2, t1  # t1 = t2 + t1
        srai t1, t1 1   # t1 = t1 / 2
        sub t0, t1, t0  # t0 = t1 - t0
        andi t0, t0, 31 # t0 = t0 % 31
        j ENDIF

ELSE:   slli t2, t1, 1  # t2 = t1 * 2 
        add t1, t2, t1  # t1 = t2 + t1
        add t0, t1, t0  # t0 = t1 + t0
        slli t2, t0, 4  # t2 = t0 * 16   
        slli t3, t0, 1  # t3 = t0 * 2      
        sub t0, t2, t3  # t0 = t2 - t3  

j ENDIF



