.data
	msg0: .asciiz"Digite horas trabalhadas: "
	msg1: .asciiz"\nDigite horas extra: "
	msg2: .asciiz"\nSalário bruto: "
	msg3: .asciiz"\nDigite valor do desconto (se não houver, digite 0):"
	msg4: .asciiz"\nSalário líquido: "

.text

main:
	# Pede horas trabalhadas
	li $v0, 4
	la $a0, msg0
	syscall
	
	li $v0, 5
	syscall
	# t0 -> horas trabalhadas
	mul $t0, $v0, 10
	
	li $v0, 4
	la $a0, msg1
	syscall
	
	li $v0, 5
	syscall
	# t1 -> Horas extras
	mul $t1, $v0, 15
	
	# "Salario Bruto"
	li $v0, 4
	la $a0, msg2
	syscall
	
	# t2 -> Valor do salário bruto
	add $t2, $t1, $t0
	
	# Mostra o salário bruto
	li $v0, 1
	add $a0, $t2, 0
	syscall
	
	# Pedindo valor do desconto na folha
	li $v0, 4
	la $a0, msg3
	syscall
	
	li $v0, 5
	syscall
	# t3 -> Desconto
	add $t3, $v0,0
	
	# $t4 -> Salário líquido
	sub $t4, $t2, $t3
	
	# "Valor total"
	li $v0, 4		
	la $a0, msg4
	syscall
	
	# Mostra valor
	li $v0, 1
	add $a0, $t4, 0
	syscall
	
	# Fim
	li $v0, 10
	syscall