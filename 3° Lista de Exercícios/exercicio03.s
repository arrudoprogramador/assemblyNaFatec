.data
	msg0: .asciiz"Digite a primeira entrada: "
	msg1: .asciiz"Digite a segunda entrada: "
	msg2: .asciiz"A diferença entre "
	msg3: .asciiz" e "
	msg4: .asciiz" é de: "
.text

main:
	li $v0, 4
	la $a0, msg0
	syscall
	
	li $v0, 5
	syscall
	add $t0, $v0, 0
	
	li $v0, 4
	la $a0, msg1
	syscall
	
	li $v0, 5
	syscall
	add $t1, $v0, 0
	
	li $v0, 4
	la $a0, msg2
	syscall
	
	bgt $t0, $t1, primeiroMaior
	bgt $t1, $t0, segundoMaior
	
	primeiroMaior:
		sub $t2, $t0, $t1
		
		li $v0, 1
		move $a0, $t0
		syscall
		
		li $v0, 4
		la $a0, msg3
		syscall
		
		li $v0, 1
		move $a0, $t1
		syscall
	
		li $v0, 4
		la $a0, msg4
		syscall
		
		li $v0, 1
		move $a0, $t2
		syscall
		
		j fim
		
	segundoMaior:
		sub $t2, $t1, $t0
		
		li $v0, 1
		move $a0, $t1
		syscall
		
		li $v0, 4
		la $a0, msg3
		syscall
		
		li $v0, 1
		move $a0, $t0
		syscall
	
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