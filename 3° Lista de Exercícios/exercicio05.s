.data
	msg0: .asciiz "Digite o primeiro número: "
	msg1: .asciiz "Digite o segundo número: "
	msg2: .asciiz "A soma dos números ímpares é: "

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
	
	li $t3, 0
	
	bgt $t0, $t1, primeiroMaior
	ble $t0, $t1, segundoMaior
	
primeiroMaior:
	blt $t0, $t1, fim
	
	rem $t2, $t0, 2
	
	beqz $t2, continue1
	
	add $t3, $t3, $t0
	
	continue1:
		add $t1, $t1, 1
	
		j primeiroMaior
	
segundoMaior:
	bgt $t0, $t1, fim
	
	rem $t2, $t0, 2
	
	beqz $t2, continue2
	
	add $t3, $t3, $t0
	
	continue2:
		add $t0, $t0, 1
	
		j segundoMaior
	
fim:
	li $v0, 4
	la $a0, msg2
	syscall
	
	li $v0, 1
	move $a0, $t3
	syscall
	
	li $v0, 10
	syscall