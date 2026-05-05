.data
	msg0: .asciiz"\nDigite sua altura em centímetros (necessário 15 entradas): "
	msg1: .asciiz"\nA menor altura é: "
	msg2: .asciiz"\nA maior altura é: "
	
.text

main:
	li $v0, 4
	la $a0, msg0
	syscall
		
	li $v0, 5
	syscall
	move $t0, $v0
	move $t1, $v0
	
	faça:
		bge $s0, 15, fim
		
		addi $s0, $s0, 1
		
		li $v0, 4
		la $a0, msg0
		syscall
		
		li $v0, 5
		syscall
	
		blt $v0, $t0, seMenor
		bgt $v0, $t1, seMaior
		
	 	seMenor:
			move $t0, $v0 
			
			j faça
		seMaior:
			move $t1, $v0
			
			j faça
			
	fim:	
		li $v0, 4
		la $a0, msg1
		syscall
		
		li $v0, 1
		move $a0, $t0
		syscall
		
		li $v0, 4
		la $a0, msg2
		syscall
		
		li $v0, 1
		move $a0, $t1
		syscall
		
		li $v0, 10
		syscall
