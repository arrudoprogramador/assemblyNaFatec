.data
	msg0: .asciiz"Digite um número: "
	msg1: .asciiz"\nO maior número é: "
	msg2: .asciiz"\nO menor número é: "
	msg3: .asciiz"Você deverá digitar 10 números individualmente a seguir\n"
.text

main:
	li $v0, 4
	la $a0, msg3
	syscall
	
	li $v0, 4
	la $a0, msg0
	syscall
	
	li $v0, 5
	syscall
	add $t0, $v0, 0
	
	add $t2, $t0, 0
	add $t1, $t0, 0
	
faça:
	add $s0, $s0, 1
	bge $s0, 10, fim
	
	li $v0, 4
	la $a0, msg0
	syscall
	
	li $v0, 5
	syscall
	add $t0, $v0, 0
	
	bgt $t0, $t2, novoMaior
	blt $t0, $t1, novoMenor
	
	j faça
	                              
	novoMaior:
		add $t2, $t0, 0
		
		
		j faça
	
	 novoMenor:
	 	add $t1, $t0, 0
	 	
		j faça
	
	fim:
		li $v0, 4
		la $a0, msg1
		syscall
		
		li $v0, 1
		move $a0, $t2
		syscall
		
		li $v0, 4
		la $a0, msg2
		syscall
		
		li $v0, 1
		move $a0, $t1
		syscall
		
		li $v0, 10
		syscall                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
