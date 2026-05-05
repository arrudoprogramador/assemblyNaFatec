.data
	msg0: .asciiz"Digite a quantidade de camisetas pequenas:"
	msg1: .asciiz"\nDigite a quantidade de camisetas médias:"
	msg2: .asciiz"\nDigite a quantidade de camisetas grandes:"
	msg3: .asciiz"\nValor total:"

.text

main: 
	# Chamada de string
	li $v0, 4
	la $a0, msg0
	syscall
	
	# Camisetas pequenas em T0
	li $v0, 5
	syscall
	mul $t0, $v0, 10
	
	li $v0, 4
	la $a0, msg1
	syscall
	
	# Camisetas médias em T1
	li $v0, 5
	syscall
	mul $t1, $v0, 12
	
	li $v0, 4
	la $a0, msg2
	syscall
	
	# Camisetas grandes em T2
	li $v0, 5
	syscall
	mul $t2, $v0, 15
	
	# Processo de soma
	add $t3, $t0, $t1
	add $t3, $t3, $t2
	
	# Chamada de "Valor total"
	li $v0, 4
	la $a0, msg3
	syscall
	
	# Soma
	li $v0, 1
	add $a0, $t3, 0
	syscall
	
	# Fim
	li, $v0, 10
	syscall
	