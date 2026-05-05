.data
	msg1: .asciiz"\nDigite o valor de A: "
	msg2: .asciiz"\nDigite o valor de B: "
	msg3: .asciiz"\nResultado: "
	msg4: .asciiz"\nVocê precisa digitar um valor maior que 0 para essa divisão! "
	
.text

main:
	li $v0, 4
	la $a0, msg1
	syscall

	li $v0, 5
	syscall
	move $t0, $v0
	
	
	li $v0, 4
	la $a0, msg2
	syscall
	
	li $v0, 5
	syscall
	move $t1, $v0
	
	# Branch if Greater Than Zero
	bgtz $t1, faça
	# Branch if EQual Zero
	beqz $t1, senão
	
	faça:
		div $t2, $t0, $t1
		
		li $v0, 4
		la $a0, msg3
		syscall
		
		li $v0, 1
		move $a0, $t2
		syscall 
		
		j fim
		
	senão:
		li $v0, 4
		la $a0, msg4
		syscall
		
		li $v0, 4
		la $a0, msg2
		syscall
	
		li $v0, 5
		syscall
		move $t1, $v0
		
		j senão

	fim:
		li $v0, 10
		syscall
