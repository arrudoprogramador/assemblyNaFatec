.data
	msg0: .asciiz"Digite a primeira nota: "
	msg1: .asciiz"Digite a segunda entrada: "
	msg2: .asciiz"Digite a terceira nota: "
	msg3: .asciiz"Digite a quarta nota: "
	msg4: .asciiz"APROVADO"
	msg5: .asciiz"EXAME"
	msg6: .asciiz"RETIDO"
	
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
	
	li $v0, 5
	syscall
	add $t2, $v0, 0
	
	li $v0, 4
	la $a0, msg3
	syscall
	
	li $v0, 5
	syscall
	add $t3, $v0, 0
	
	# SOMA DAS NOTAS
	add $t4, $t0, $t1
	add $t5, $t2, $t3
	add $t6, $t5, $t4
	
	# MÉDIA
	div $t7, $t6, 4
	
	bge $t7, 6, aprovado
	bge $t7, 3, exame
	blt $t7, 3, retido
	
	aprovado:
		
		li $v0, 4
		la $a0, msg4
		syscall
		
		
		j fim
		
	exame:
		
		li $v0, 4
		la $a0, msg5
		syscall
		
		
		j fim	
		
	retido:
		
		li $v0, 4
		la $a0, msg6
		syscall
		
		
		j fim	
	
	fim:
		li $v0, 10
		syscall