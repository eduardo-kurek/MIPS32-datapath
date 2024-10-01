addi $a0, $0, 0
addi $a1, $0, 5
jal sort
j exit

sort: 
    addi $sp, $sp, -20
    sw $ra, 16($sp)
    sw $s3, 12($sp) 		# n - 1
    sw $s2, 8($sp) 		# vec
    sw $s1, 4($sp) 		# j
    sw $s0, 0($sp) 		# i

    add $s2, $0, $a0 		# s2 = vec
    addi $s3, $a1, -1  		# s3 = n-1
    
    add $s0, $0, $0 		# i = 0
    for1: bge $s0, $s3, end1 	# if(i>=n-1) goto end1
    	
    	add $s1, $0, $0 	# j = 0
    	for2: sub $t0, $s3, $s0 # t0 = n-1-i
    	    slt $t1, $s1, $t0	#if(j>=n-1-i) goto end2
    	    addi $t2, $0, 1
	    bne $t1, $t2, end2
    	    
    	    # Condição do IF
    	    
    	    sll $t0, $s1, 2 	# t0 = j * 4
    	    add $t1, $s2, $t0 	# t1 = arr + (j*4)
    	    lw $t1, 0($t1) 	# t1 = arr[j]
    	    
    	    addi $t0, $s1, 1 	# t0 = j+1
    	    sll $t0, $t0, 2 	# t0 *= 4
    	    add $t2, $s2, $t0 	# t2 = arr + (j+1)*4
    	    lw $t2, 0($t2) 	# t2 = arr[j+1]
    	    
    	    if: ble $t1, $t2, endif
    	    	add $a1, $s1, $0 # a1 = j
    	    	jal swap
    	    endif:
    	    
    	    # Fim do IF
    	    
    	    addi $s1, $s1, 1 	# j++
	    j for2
    	end2:
    	
    	addi, $s0, $s0, 1 	# i++
    	j for1
    end1:
    lw $s0, 0($sp)
    lw $s1, 4($sp)
    lw $s2, 8($sp)
    lw $s3,12($sp)
    lw $ra,16($sp)
    addi $sp, $sp, 20
    jr $ra

swap:
    sll $t1, $a1, 2
    add $t1, $a0, $t1
    lw $t0, 0($t1)
    lw $t2, 4($t1)
    sw $t2, 0($t1)
    sw $t0, 4($t1)
    jr $ra

exit:
