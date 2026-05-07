.data
	msg0: .asciiz"\nDigite o primeiro ano do período estimado:"
	msg1: .asciiz"\nDigite o segundo ano do período estimado:"
	msg2: .asciiz"Os anos não bissextos entre:"
	msg3: .asciiz" e "
	msg4: .asciiz" são: \n"
		
.text
main:
	# Exibição da mensagem de primeira entrada
	li $v0, 4
	la $a0, msg0
	syscall
	
	# Primeira entrada
	li $v0, 5
	syscall
	add $t0, $v0, 0
	
	# Exibição da mensagem de segunda entrada
	li $v0, 4
	la $a0, msg1
	syscall
	
	# Segunda entrada
	li $v0, 5
	syscall
	add $t1, $v0, 0
	
	# Se a primeima entrada for maior que a segunda...
	bgt $t0, $t1, se
	
	# Agora se a segunda entrada for maior que a primeira...
	bgt $t1, $t0, else
	
	se:
		# Looping: enquanto a primeira entrada for MAIOR ou igual a segunda
		bge $t0, $t1, faça
		
		faça: 
			# Necessário implementar uma lógica para número que terminem com '00', pois esses tem que serem divididos por 400
			
		
			# Calculo para verificar se o ano é divisível por 4
			
			
			
			add $t1, $t1, 1
	
	
	
	
	else:
		# Looping: enquanto a primeira entrada for MENOR ou igual a segunda
		bge $t1, $t0, to
		
		to: 
			# Lógica para número que terminem com '00', pois esses tem que serem divididos por 400
		
		add $t0, $t0, 1
		
		
		
		j fim
		
		
		
	fim:
		li $v0, 10
		syscall