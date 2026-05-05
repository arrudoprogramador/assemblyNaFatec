.data
	msg0: .asciiz"DIgite um número:"
	msg1: .asciiz"Resultado:"
.text

main:
	li $v0, 4
	la $a0, msg0
	syscall
	
	li $v0, 5
	syscall
	move $t0, $v0
	
	rem $t1, $t0, 2
	
	# Branch If Equal Zero
	beqz $t1, se
	# Branch If Not Equal Zero
	bnez $t1, senão
	
	se:
		add $t0, $t0, 5
		j fim
	
	senão:
		add $t0, $t0, 8
		j fim
	
	fim:
		li $v0, 4
		la $a0, msg1
		syscall
	
		li $v0, 1
		move $a0, $t0
		syscall
	
		li $v0, 10
		syscall	