.data
	msg0: .asciiz"Digite o primeiro valor: \n"
	msg1: .asciiz"Digite o segundo valor: \n"
	msg2: .asciiz"Valoles invertidos: \n"
	msg3: .asciiz" e "
	
.text

main:
	# Receber primeiro
	li $v0, 4
	la $a0, msg0
	syscall
	
	li $v0, 5
	syscall
	move $t0, $v0
	
	# Receber segundo
	li $v0, 4
	la $a0, msg1
	syscall
	
	li $v0, 5
	syscall
	move $t1, $v0
	
	# coriga = primeiro
	move $t2, $t0
	
	# Primeiro = Segundo  
	move $t0, $t1
	
	# Segundo = coringa
	move $t1, $t2
	
	li $v0, 4
	la $a0, msg2
	syscall
	
	li $v0, 1
	move $a0, $t0
	syscall
	
	li $v0, 4
	la $a0, msg3
	syscall
	
	li $v0, 1
	move $a0, $t1
	syscall
	
	li $v0, 10
	syscall
