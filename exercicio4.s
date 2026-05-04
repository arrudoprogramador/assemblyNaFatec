.data
	msg0: .asciiz"\nDigite o valor da base maior: "
	msg1: .asciiz"\nDigite o valor da base menor: "
	msg2: .asciiz"\nDigite o valor da altura: "
	msg3: .asciiz"\nÁrea: "

.text

main:
	li $v0, 4
	la $a0, msg0
	syscall
	
	# t0 -> Base maior
	li $v0, 5
	syscall
	move $t0, $v0
	
	li $v0, 4
	la $a0, msg1
	syscall
	
	# t1 -> Base menor
	li $v0, 5
	syscall
	move $t1, $v0
	
	# t2 -> soma das bases
	add $t2, $t0, $t1
	
	# Chama valor de altura
	li $v0, 4
	la $a0, msg2
	syscall
	
	# Recebe altura, t3 -> altura
	li $v0, 5
	syscall
	move $t3, $v0
	
	# T4 -> multiplicação
	mul $t4, $t2, $t3

	# T5 -> resultado final = divisão de (base * altura) por 2
	div $t5, $t4, 2

	# "Área: "
	li $v0, 4
	la $a0, msg3
	syscall

	# Exibe resultado
	li $v0, 1
	move $a0, $t5
	syscall

	# Fim
	li $v0, 10
	syscall