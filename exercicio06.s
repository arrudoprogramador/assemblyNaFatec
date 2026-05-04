.data
	msg1: .asciiz"Digite o valor de A: "
	msg2: .asciiz"Digite o valor de B: "
	msg3: .asciiz"Soma: "
	msg4: .asciiz"Produto: "
	
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
	
	# Branch If equal
	beq $t1, $t0, faça
	# Branch If not equal
	bne $t1, $t0, senão
	
	faça:
		add $t2, $t0, $t1
		
		li $v0, 4
		la $a0, msg3
		syscall
		
		li $v0, 1
		move $a0, $t2
		syscall 
		
		j fim
		
	senão:
		mul $t2, $t0, $t1
		
		li $v0, 4
		la $a0, msg4
		syscall
		
		li $v0, 1
		move $a0, $t2
		syscall 
		
		j fim

	fim:
		li $v0, 10
		syscall
