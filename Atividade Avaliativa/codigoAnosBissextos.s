.data
	msg0: .asciiz"\nDigite o primeiro ano do per�odo estimado:"
	msg1: .asciiz"\nDigite o segundo ano do per�odo estimado:"
	msg2: .asciiz"\nOs anos n�o bissextos entre "
	msg3: .asciiz" e "
	msg4: .asciiz" s�o: \n"
	msg5: .asciiz"\n"
		
.text

main:

come�o:
	# Exibi��o da mensagem de primeira entrada
	li $v0, 4
	la $a0, msg0
	syscall
	
	# Primeira entrada
	li $v0, 5
	syscall
	add $t0, $v0, 0
	
	# Exibi��o da mensagem de segunda entrada
	li $v0, 4
	la $a0, msg1
	syscall
	
	# Segunda entrada
	li $v0, 5
	syscall
	add $t1, $v0, 0
	
	# Igual
	beq $t0, $t1, diferen�aPrimeiraEntradaMaior
	
	# Se a primeira entrada for maior que a segunda...
	bgt $t0, $t1, diferen�aPrimeiraEntradaMaior
	
	# Agora se a segunda entrada for maior que a primeira...
	bgt $t1, $t0, diferen�aPrimeiraEntradaMenor
	
	# Diferen�a
	diferen�aPrimeiraEntradaMaior:
		sub $t2, $t0, $t1
		
		# Verifica se a diferen�a � maior igual a 1000
		bge $t2, 1000, come�o
		
		# "Os anos n�o bissextos entre"
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
	
	diferen�aPrimeiraEntradaMenor:
		sub $t2, $t1, $t0
		
		# Verifica se a diferen�a � maior igual a 1000
		bge $t2, 1000, come�o
		
		# "Os anos n�o bissextos entre"
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
		bge $t0, $t1, fa�a
		j fim
		
		fa�a: 
			rem $s0, $t1, 400
			
			beqz $s0, bissexto
			
			# verifica se o ano � divis�vel por 100, se for, N�O BISSEXTO
			segundaCondi��o:
				rem $s1, $t1, 100
				
				beqz $s1, n�oBissexto
				bgtz $s1, terceiraCondi��o
				
			# verifica se o ano � divis�vel por 400, se for, BISSEXTO
			terceiraCondi��o:
				rem $s2, $t1, 4
				
				beqz $s2, bissexto
				bgtz $s2, n�oBissexto
			
			bissexto:
				
				j contadorSe
			
			n�oBissexto:
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
			
			# verifica se o ano � divis�vel por 100, se for, N�O BIN�RIO
			secondCondition:
				rem $s1, $t0, 100
				
				beqz $s1, noLeapYear
				bgtz $s1, thirdCondition	
						
			# verifica se o ano � divis�vel por 400, se for, BISSEXTO
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
