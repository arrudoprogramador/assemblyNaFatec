.data
	msg0: .asciiz"Digite A: "
	msg1: .asciiz"Digite B: "
	msg2: .asciiz"Digite C: "
	msg3: .asciiz"Delta "
	msg4: .asciiz" possui duas raízes reais"
	msg5: .asciiz" possui uma raiz real"
	msg6: .asciiz" não possui raízes reais"
	
.text

main:
	# VAlor de A
	li $v0, 4
	la $a0, msg0
	syscall
	
	li $v0, 5
	syscall
	add $t0, $v0, 0
	
	# VAlor de b
	li $v0, 4
	la $a0, msg1
	syscall
	
	li $v0, 5
	syscall
	add $t1, $v0, 0
	
	# VAlor de c
	li $v0, 4
	la $a0, msg2
	syscall
	
	li $v0, 5
	syscall
	add $t2, $v0, 0
	
	# t3 = B ao quadrado, t4 = a . c
	mul $t3, $t1, $t1
	mul $t4, $t0, $t2
	
	# t5 = -4.(t4)
	mul $t5, $t4, -4
	
	# (b*b) + (-4.a.c)
	add $t6, $t3, $t5
	
	li $v0, 4
	la $a0, msg3
	syscall
	
	li $v0, 1
	mul $a0, $t6, 1
	syscall
	
	bgtz $t6, duasRaizes
	beqz $t6, umaRaiz
	bltz $t6, semRaiz
	
	duasRaizes:
		li $v0, 4
		la $a0, msg4
		syscall
		
		j fim
	
	umaRaiz:
		li $v0, 4
		la $a0, msg5
		syscall
		
		j fim
	semRaiz:
		li $v0, 4
		la $a0, msg6
		syscall
	
		j fim
		
	fim:
		li $v0, 10
		syscall
	
	
	