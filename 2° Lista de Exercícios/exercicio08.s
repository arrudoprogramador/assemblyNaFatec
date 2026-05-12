.data
	msg0: .asciiz "Digite o valor do produto: "
	msg1: .asciiz "Quantidade de parcelas: "
	msg2: .asciiz "Digite um valor válido!\n"

.text

main:
	li $v0, 4
	la $a0, msg0
	syscall
	
	li $v0, 5
	syscall
	add $t0, $v0, 0
	
	# validação
	blt $t0, 1000, invalido
	bgt $t0, 9999, invalido
	
	# quantidade inicial de parcelas
	div $t1, $t0, 500
	
	# verifica resto
	mul $t2, $t1, 500
	sub $t3, $t0, $t2
	
	beq $t3, 0, mostrar
	bgt $t3, 0, somaParcela
	
	
	somaParcela:
		addi $t1, $t1, 1
		j mostrar
	
	
	mostrar:
		li $v0, 4
		la $a0, msg1
		syscall
		
		li $v0, 1
		move $a0, $t1
		syscall
		
		j fim
	
	
	invalido:
		li $v0, 4
		la $a0, msg2
		syscall
		
		j fim
	
	
	fim:
		li $v0, 10
		syscall