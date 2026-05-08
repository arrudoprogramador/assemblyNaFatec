.data
	msg0: .asciiz"Digite o raio da circunferência:"
	msg1: .asciiz"Comprimento:"
	
.text

main:
	#Raio
	li $v0, 4
	la $a0, msg0
	syscall
	
	li $v0, 5
	syscall
	move $t0, $v0
	
	add $t1, $t1, 3
	
	# Comprimento = 2pi.R
	#2pi
	mul $t2, $t1, 2
	
	# Vezes o raio
	mul $t3, $t2, $t0
	
	li $v0, 4
	la $a0, msg1
	syscall
	
	li $v0, 1
	move $a0, $t3
	syscall
	
	li $v0, 10
	syscall
