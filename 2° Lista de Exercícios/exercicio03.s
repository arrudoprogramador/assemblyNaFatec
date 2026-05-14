.data
	msg0: .asciiz"Digite o mês do seu nascimento: "
	msg1: .asciiz"Digite o ano do seu nascimento: "
	msg2: .asciiz"Digite o mês atual: "
	msg3: .asciiz"Digite o ano atual: "
	msg4: .asciiz"Sua idade em meses é: "
	msg5: .asciiz"Digite números válidos!\n"
.text

main:
	li $v0, 4
	la $a0, msg0
	syscall
	
	# Mês nascimento
	li $v0, 5
	syscall
	add $t0, $v0, 0
	
	
	li $v0, 4
	la $a0, msg1
	syscall
	
	# Ano nascimento
	li $v0, 5
	syscall
	add $t1, $v0, 0
	
	
	li $v0, 4
	la $a0, msg2
	syscall
	
	# Mês atual
	li $v0, 5
	syscall
	add $t2, $v0, 0
	
	
	li $v0, 4
	la $a0, msg3
	syscall
	
	# Ano atual
	li $v0, 5
	syscall
	add $t3, $v0, 0
	
	
	bgt $t1, $t3, invalido
	blt $t2, $t0, logica
	
	j faça
	
	logica:
		add $t3, $t3, -1
		add $t2, $t2, 12
	
	faça:
		mul $t4, $t1, 12
		add $t4, $t4, $t0
		
		mul $t5, $t3, 12
		add $t5, $t5, $t2
		
		sub $t6, $t5, $t4
		
		li $v0, 4
		la $a0, msg4
		syscall
	
		li $v0, 1
		add $a0, $t6, 0
		syscall
		
		j fim
		
	
	invalido:
		li $v0, 4
		la $a0, msg5
		syscall
		
		j main
	
	fim:
		li $v0, 10
		syscall
	