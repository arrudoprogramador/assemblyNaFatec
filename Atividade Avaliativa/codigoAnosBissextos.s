.data
	msg0: .asciiz "Digite o primeiro ano do per�odo estimado: "
	msg1: .asciiz "\nDigite o segundo ano do per�odo estimado: "
	msg2: .asciiz "\nOs anos n�o bissextos entre "
	msg3: .asciiz " e "
	msg4: .asciiz " s�o: \n"
	msg5: .asciiz "\n"
	msg6: .asciiz "\nO intervalo deve ser de at� 1.000 anos\n"
		
.text

main:

inicio:
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
	beq $t0, $t1, validaPrimeiroAnoMaior
	
	# Se a primeira entrada for maior que a segunda...
	bgt $t0, $t1, validaPrimeiroAnoMaior
	
	# Agora se a segunda entrada for maior que a primeira...
	bgt $t1, $t0, validaPrimeiroAnoMenor
	
	# Diferen�a
	validaPrimeiroAnoMaior:
		sub $t2, $t0, $t1
		
		# Verifica se a diferen�a � maior que 1000
		bgt $t2, 1000, invalido
		
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
		
		# "s�o:"
		li $v0, 4
		la $a0, msg4
		syscall
		
		j loopCrescente
	
	validaPrimeiroAnoMenor:
		sub $t2, $t1, $t0
		
		# Verifica se a diferen�a � maior que 1000
		bgt $t2, 1000, invalido
		
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
		
		# "s�o:"
		li $v0, 4
		la $a0, msg4
		syscall
		
		j loopDecrescente
	
	loopCrescente:
		# Looping: enquanto a primeira entrada for MAIOR ou igual � segunda
		bge $t0, $t1, processaAnoCrescente
		j fim
		
		processaAnoCrescente: 
			rem $s0, $t1, 400
			
			beqz $s0, anoBissexto
			
			# verifica se o ano � divis�vel por 100
			verificaDivisivelPor100:
				rem $s1, $t1, 100
				
				bgtz $s1, verificaDivisivelPor4
				beqz $s1, anoNaoBissexto
				
			# verifica se o ano � divis�vel por 4
			verificaDivisivelPor4:
				rem $s2, $t1, 4
				
				beqz $s2, anoBissexto
				bgtz $s2, anoNaoBissexto
			
			anoBissexto:
				j incrementaAnoCrescente
			
			anoNaoBissexto:
				li $v0, 1
				mul $a0, $t1, 1
				syscall
				
				li $v0, 4
				la $a0, msg5
				syscall
			
				j incrementaAnoCrescente
			
			incrementaAnoCrescente:
				add $t1, $t1, 1
				j loopCrescente
	
		j fim
		
	loopDecrescente:
		# Looping: enquanto a primeira entrada for MENOR ou igual � segunda
		bge $t1, $t0, processaAnoDecrescente
		j fim
		
		processaAnoDecrescente: 
			rem $s0, $t0, 400
			
			beqz $s0, anoBissextoDecrescente
			bgtz $s0, verificaDivisivelPor100Decrescente
			
			# verifica se o ano � divis�vel por 100
			verificaDivisivelPor100Decrescente:
				rem $s1, $t0, 100
				
				bgtz $s1, verificaDivisivelPor4Decrescente
				beqz $s1, anoNaoBissextoDecrescente
						
			# verifica se o ano � divis�vel por 4
			verificaDivisivelPor4Decrescente:
				rem $s2, $t0, 4
				
				bgtz $s2, anoNaoBissextoDecrescente
				beqz $s2, anoBissextoDecrescente
			
			anoBissextoDecrescente:
				j incrementaAnoDecrescente
			
			anoNaoBissextoDecrescente:
				li $v0, 1
				mul $a0, $t0, 1
				syscall
				
				li $v0, 4
				la $a0, msg5
				syscall
				
				j incrementaAnoDecrescente
			
			incrementaAnoDecrescente:
				add $t0, $t0, 1
				
				j loopDecrescente
		
		j fim
		
	invalido:
		li $v0, 4
		la $a0, msg6
		syscall
		
		j inicio
		
	fim:
		li $v0, 10
		syscall