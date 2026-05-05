.data 
	msg1: .asciiz"\nDigite o valor da largura do terreno: "
	msg2: .asciiz"\nDigite o valor da altura do terreno: "
	msg3: .asciiz"\nResultado: "

.text

main:
	# Eu preciso atribuir uma função ao v0, como uma impressão de string (4)
	li $v0, 4
	# la é para chamada de strings e as strings são acessadas pelo registrador a0
	la $a0, msg1
	syscall
	# com a chamada do syscall aparecerá a msg1
	
	# Aqui eu atribuo uma outra função, agora é a leitura de um número int (5) e será armazenado em v0 novamente
	li $v0, 5
	syscall
	# Atribuição ao v0
	move $t0, $v0
	# jogo em outro registrador para que v0 fique livre para as próximas etapas
	
	# repito o processo de exibir mensagem e coletar dado do usuário
	li $v0, 4
	la $a0, msg2
	syscall
	
	li $v0, 5
	syscall
	move $t1, $v0
	
	# Aqui eu faço a conversão esperada
	mul $t2, $t1, $t0
	
	# Chamada de string "Resultado", função 4 dnv
	li $v0, 4
	la $a0, msg3
	syscall
	
	# função para imprimir um número inteiro (1)
	li $v0, 1
	# Movo o valor a ser apresentado à variável de exibição
	move $a0, $t2
	syscall
	
	# Encerro o programa
	li $v0, 10
	syscall
	
	
	
	
	
	
