.data
	msg1: .asciiz"Digite um número:"
.text

main:
	li $v0, 4
	la $a0, msg1
	syscall
	
	li $v0, 5
	syscall
	move $t0, $v0
	
	bgtz $t0, faça
	bltz $t0, senão
	
	faça:
		mul $t1, $t0, 2
		
		li $v0, 1
		move $a0, $t1
		syscall
		j end
	senão:
		mul $t1, $t0, 3
		
		li $v0, 1
		move $a0, $t1
		syscall
		j end
	
	end:
		li $v0, 10
		syscall