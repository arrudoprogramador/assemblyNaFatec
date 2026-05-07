.data
	msg1: .asciiz"Digite o valor de A: "
	msg2: .asciiz"Digite o valor de B: "
	msg3: .asciiz"Resto: "
	
.text

main:
	li $v0, 4
	la $a0, msg1
	syscall

	li $v0, 5
	syscall
	move $t0, $v0
	
	li $v0, 4
	la $a0, msg2
	syscall
	
	li $v0, 5
	syscall
	move $t1, $v0
	
	# Branch If Greater or Equal
	bge $t0, $t1, faça
	# Branch If Less
	blt $t0, $t1, senão
	
	faça: 	
		# t0 = 74, t1 = 5, t2 = 14.8, t3 = 70, t4 = 4
		div $t2, $t0, $t1
		
		mul $t3, $t1, $t2
		
		sub $t4, $t0, $t3
		
		li $v0, 4
		la $a0, msg3
		syscall
		
		li $v0, 1
		move $a0, $t4
		syscall 
		
		j fim
		
	senão:
		# t0 = 2, t1 = 5, t2 = 2, t3 = 4, t4 = 1 
		div $t2, $t1, $t0
		
		mul $t3, $t0, $t2
		
		sub $t4, $t1, $t3
		
		li $v0, 4
		la $a0, msg3
		syscall
		
		li $v0, 1
		move $a0, $t4
		syscall 
		
		j fim

	fim:
		li $v0, 10
		syscall
