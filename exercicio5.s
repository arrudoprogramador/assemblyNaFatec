.data
	msg0: .asciiz"\nDigite o valor do primeiro cateto: "
	msg1: .asciiz"\nDigite o valor do segundo cateto: "
	msg2: .asciiz"\nO valor da hipotenusa é: "
.text

main:
	li $v0, 4
	la $a0, msg0
	syscall
	
	li $v0, 5
	syscall
	# cateto A -> t0
	move $t0, $v0
	
	li $v0, 4
	la $a0, msg1
	syscall
	
	li $v0, 5
	syscall
	# cateto B -> t1
	move $t1, $v0
	
	# t3 -> quadrado do cateto A
	mul $t3, $t0, $t0
	
	# t4 -> quadrado do cateto B
	mul $t4, $t1, $t1
	
	# t5 = soma dos quadrados dos catetos
	add $t5, $t4, $t3
	
	move $t6, $t5
	
	loop:
		# Branch Less than or equals zero
		blez $t6, fim
		
		# Rodará até ser 25, 5, 5
		
		mul $t7, $t6, $t6
		
		# Branch equals, compara se a multiplicação dos contadores é igual ao número que temos no $t5
		beq $t7, $t5, encontrou
	
		# Diminui um do contador a cada vez
		addi $t6, $t6, -1
		
		#retorna ao início do loop
		j loop		
	
	encontrou:
		# "Valor da hipotenusa:"
		li $v0, 4
		la $a0, msg2
		syscall
		
		# Apresenta $t6 = raíz quadrada da soma dos quadrados dos catetos
		li $v0, 1
		move $a0, $t6
		syscall
		
	fim:
		li $v0, 10
		syscall