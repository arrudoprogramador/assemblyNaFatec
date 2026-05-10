.data
	msg0: .asciiz"Digite a primeira entrada: "
	msg1: .asciiz"Digite a segunda entrada: "
	msg2: .asciiz"Os números são iguais."
	msg3: .asciiz"O maior número é o: "
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
	la $a0, msg3
	syscall
	
	bgt $t0, $t1, primeiroMaior
	beq $t0, $t1, iguais
	blt $t0, $t1, segundoMaior
	                              
	primeiroMaior:
		li $v0, 1
		move $a0, $t0
		syscall
		
		j fim
	iguais:
		li $v0, 4
		la $a0, msg2
		syscall
		
		j fim
	
	 segundoMaior:
	 	li $v0, 1
	 	move $a0, $t1  
	 	syscall
	 	
		j fim
	
	fim:
		li $v0, 10
		syscall                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
