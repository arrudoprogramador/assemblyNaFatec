.data
	msg0: .asciiz"Digite o salário atual: \n"
	msg1: .asciiz"Salário após o reajuste: \n"
	
.text

main:
	# Receber salário
	li $v0, 4
	la $a0, msg0
	syscall
	
	li $v0, 5
	syscall
	move $t0, $v0
	
	
	# Aumento de 25%
	mul $t1, $t0, 25
	
	div $t2, $t1, 100
	
	add $t3, $t2, $t0
	
	li $v0, 4
	la $a0, msg1
	syscall
	
	li $v0, 1
	move $a0, $t3
	syscall
	
	
	li $v0, 10
	syscall
