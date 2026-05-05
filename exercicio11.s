.data
	msg0: .asciiz"\nQuantidade de números entre 0 e 25:"
	msg1: .asciiz"\nQuantidade de números entre 25 e 50:"
	msg2: .asciiz"\nQuantidade de números entre 50 e 75:"
	msg3: .asciiz"\nQuantidade de números entre 75 e 100:"
	msg4: .asciiz"Digite números para classificação(para finalizar, digite um valor negativo):\n"
	msg5: .asciiz"Valor inválido!!\n"

.text

main:

	faça:
		li $v0, 4
		la $a0, msg4
		syscall 
	
		li $v0, 5
		syscall
		
		blt $v0, 0, negativo
		
		blt $v0, 26, ate25
		blt $v0, 50, ate50
		blt $v0, 75, ate75
		blt $v0, 101, ate100
		
		bge $v0, 101, maior
		
		negativo:
		
			j fim
		
		ate25:
			add $t0, $t0, 1
			
			j faça	
		ate50:	
			add $t1, $t1, 1
			
			j faça
		ate75:
			add $t2, $t2, 1	
			
			j faça
		ate100:	
			add $t3, $t3, 1	
			
			j faça
			
		maior: 
			li $v0, 4
			la $a0, msg5
			syscall
			
			j faça
			
	fim:
		#Mostrar até 25
		li $v0, 4
		la $a0, msg0
		syscall
		
		li $v0, 1
		move $a0, $t0 
		syscall
	
		#Mostrar até 50
		li $v0, 4
		la $a0, msg1
		syscall
		
		li $v0, 1
		move $a0, $t1 
		syscall
		
		#Mostrar até 75
		li $v0, 4
		la $a0, msg2
		syscall
		
		li $v0, 1
		move $a0, $t2 
		syscall
		
		#Mostrar até 100
		li $v0, 4
		la $a0, msg3
		syscall
		
		li $v0, 1
		move $a0, $t3 
		syscall
	
	
	li $v0, 10
	syscall