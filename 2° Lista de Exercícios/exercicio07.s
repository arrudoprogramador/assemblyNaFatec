.data
	msg0: .asciiz "Digite um número entre 100 e 999: "
	msg1: .asciiz "\nCENTENA = "
	msg2: .asciiz "\nDEZENA = "
	msg3: .asciiz "\nUNIDADE = "
	msg4: .asciiz "\nNúmero inválido!\n"

.text

main:
	# mensagem
	li $v0, 4
	la $a0, msg0
	syscall
	
	# leitura
	li $v0, 5
	syscall
	
	move $t0, $v0
	
	
	blt $t0, 100, invalido
	bgt $t0, 999, invalido
	
	
	
	div $t1, $t0, 100
	
	
	mul $t2, $t1, 100
	sub $t3, $t0, $t2
	
	
	div $t4, $t3, 10
	

	
	mul $t5, $t4, 10
	sub $t6, $t3, $t5
	
	li $v0, 4
	la $a0, msg1
	syscall
	
	li $v0, 1
	move $a0, $t1
	syscall
	
	
	li $v0, 4
	la $a0, msg2
	syscall
	
	li $v0, 1
	move $a0, $t4
	syscall
	
	
	li $v0, 4
	la $a0, msg3
	syscall
	
	li $v0, 1
	move $a0, $t6
	syscall
	
	j fim
	

invalido:
	li $v0, 4
	la $a0, msg4
	syscall
	

fim:
	li $v0, 10
	syscall