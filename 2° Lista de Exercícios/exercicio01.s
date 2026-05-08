.data
	msg0: .asciiz"Digite o valor em R$: "
	msg1: .asciiz"Valor em U$: "
	
.text

main:
	# Receber reais
	li $v0, 4
	la $a0, msg0
	syscall
	
	li $v0, 5
	syscall
	move $t0, $v0
	
	# Volume = altura x largura x comprimento
	mul $t1, $t0, 5
	
	li $v0, 4
	la $a0, msg1
	syscall
	
	li $v0, 1
	move $a0, $t1
	syscall
	
	li $v0, 10
	syscall
