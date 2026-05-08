.data
	msg0: .asciiz"\nDigite o primeiro ano do período estimado:"
	msg1: .asciiz"\nDigite o segundo ano do período estimado:"
	msg2: .asciiz"\nOs anos não bissextos entre "
	msg3: .asciiz" e "
	msg4: .asciiz" são: \n"
	msg5: .asciiz"\n"
		
.text
main:

começo:
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
	
	# Igual
	beq $t0, $t1, diferençaPrimeiraEntradaMaior
	
	# Se a primeira entrada for maior que a segunda...
	bgt $t0, $t1, diferençaPrimeiraEntradaMaior
	
	# Agora se a segunda entrada for maior que a primeira...
	bgt $t1, $t0, diferençaPrimeiraEntradaMenor
	
	# Diferença
	diferençaPrimeiraEntradaMaior:
		sub $t2, $t0, $t1
		
		# Verifica se a diferença é maior igual a 1000
		bge $t2, 1000, começo
		
		# "Os anos não bissextos entre"
		li $v0, 4
		la $a0, msg2
		syscall
		
		# Primeira entrada
		li $v0, 1
		add $a0, $t1, 0
		syscall
		
		# "e"
		li $v0, 4
		la $a0, msg3
		syscall
		
		# Segunda entrada
		li $v0, 1
		add $a0, $t0, 0
		syscall
		
		# "e"
		li $v0, 4
		la $a0, msg4
		syscall
		
		j se
	
	diferençaPrimeiraEntradaMenor:
		sub $t2, $t1, $t0
		
		# Verifica se a diferença é maior igual a 1000
		bge $t2, 1000, começo
		
		# "Os anos não bissextos entre"
		li $v0, 4
		la $a0, msg2
		syscall
		
		# Primeira entrada
		li $v0, 1
		add $a0, $t1, 0
		syscall
		
		# "e"
		li $v0, 4
		la $a0, msg3
		syscall
		
		# Segunda entrada
		li $v0, 1
		add $a0, $t0, 0
		syscall
		
		# "e"
		li $v0, 4
		la $a0, msg4
		syscall
		
		j else
	
	se:
		# Looping: enquanto a primeira entrada for MAIOR ou igual a segunda
		bge $t0, $t1, faça
		j fim
		
		faça: 
			rem $s0, $t1, 400
			
			beqz $s0, bissexto
			
			# verifica se o ano é divisível por 100, se for, NÃO BISSEXTO
			segundaCondição:
				rem $s1, $t1, 100
				
				beqz $s1, nãoBissexto
				bgtz $s1, terceiraCondição
				
			# verifica se o ano é divisível por 400, se for, BISSEXTO
			terceiraCondição:
				rem $s2, $t1, 4
				
				beqz $s2, bissexto
				bgtz $s2, nãoBissexto
			
			bissexto:
				
				j contadorSe
			
			nãoBissexto:
				li $v0, 1
				mul $a0, $t1, 1
				syscall
				
				li $v0, 4
				la $a0, msg5
				syscall
			
				j contadorSe
			
			contadorSe:
			
				add $t1, $t1, 1
				j se
	
		j fim
		
	else:
		# Looping: enquanto a primeira entrada for MENOR ou igual a segunda
		bge $t1, $t0, to
		j fim
		
		to: 
			rem $s0, $t0, 400
			
			beqz $s0, leapYear
			bgtz $s0, secondCondition
			
			# verifica se o ano é divisível por 100, se for, NÃO BINÁRIO
			secondCondition:
				rem $s1, $t0, 100
				
				beqz $s1, noLeapYear
				bgtz $s1, thirdCondition	
						
			# verifica se o ano é divisível por 400, se for, BISSEXTO
			thirdCondition:
				rem $s2, $t0, 4
				
				bgtz $s2, noLeapYear
				beqz $s2, leapYear
			
			leapYear:
				
				j counterIf
			
			noLeapYear:
				li $v0, 1
				mul $a0, $t0, 1
				syscall
				
				li $v0, 4
				la $a0, msg5
				syscall
				
				j counterIf
			
			counterIf:
				add $t0, $t0, 1
				
				j else
		
		j fim
		
		
		
	fim:
		li $v0, 10
		syscall
