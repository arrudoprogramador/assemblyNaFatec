.data
	msg1: .asciiz"Digite o valor de altura:"
	msg2: .asciiz"Digite o valor de largura:"
	msg3: .asciiz"Digite o valor do comprimento:"
	msg4: .asciiz"Volume: "
	
.text

main:
	#Altura]
	li $v0, 4
	la $a0, msg1
	syscall
	
	li $v0, 5
	syscall
	move $t0, $v0
	
			
	#Largura
	li $v0, 4
	la $a0, msg2
	syscall
	
	li $v0, 5
	syscall
	move $t1, $v0
	
	#Comprimento
	li $v0, 4
	la $a0, msg3
	syscall
	
	li $v0, 5
	syscall	
	move $t2, $v0
	
	# Volume = altura x largura x comprimento
	mul $t3, $t0, $t1
	mul $t4, $t3, $t2
	
	li $v0, 4
	la $a0, msg4
	syscall
	
	li $v0, 1
	move $a0, $t4
	syscall
	
	li $v0, 10
	syscall
