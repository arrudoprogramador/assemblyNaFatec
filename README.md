<h1 align="center">Exercícios de Assembly MIPS</h1>

<p align="center">
Arquitetura e Organização de Computadores — FATEC ZL
<br>
Prof. Leandro Colevati
</p>

<hr>

<h2>Lista 1 — Fundamentos</h2>

<ol>
<li>
A imobiliária <strong>Imóbilis</strong> vende apenas terrenos retangulares. Faça um algoritmo para ler as dimensões de um terreno e exibir sua área.
</li>

<li>
Uma fábrica de camisetas produz os tamanhos:
<ul>
<li>Pequeno — R$10</li>
<li>Médio — R$12</li>
<li>Grande — R$15</li>
</ul>

Desenvolva um algoritmo que receba a quantidade vendida de cada tamanho e informe o valor arrecadado.
</li>

<li>
A empresa <strong>Hipotheticus</strong> paga:
<ul>
<li>R$10 por hora normal</li>
<li>R$15 por hora extra</li>
</ul>

Faça um algoritmo que calcule:
<ul>
<li>Salário bruto</li>
<li>Salário líquido</li>
</ul>

Considere também um valor de desconto informado pelo usuário.
</li>

<li>
Faça um algoritmo que calcule a área de um trapézio utilizando apenas números inteiros.

<br><br>

Fórmula:

\[
A = \frac{(BaseMaior + BaseMenor) \times Altura}{2}
\]

</li>

<li>
Faça um algoritmo que receba os valores dos catetos de um triângulo e calcule a hipotenusa.
</li>

<li>
Leia dois valores inteiros <strong>A</strong> e <strong>B</strong>:
<ul>
<li>Se forem iguais, some os valores;</li>
<li>Se forem diferentes, multiplique A por B.</li>
</ul>

Armazene o resultado em uma variável <strong>C</strong> e exiba seu conteúdo.
</li>

<li>
Leia um número inteiro:
<ul>
<li>Se for par, some 5;</li>
<li>Se for ímpar, some 8.</li>
</ul>

Exiba o resultado final.
</li>

<li>
Encontre:
<ul>
<li>O dobro do número, caso seja positivo;</li>
<li>O triplo do número, caso seja negativo.</li>
</ul>
</li>

<li>
Leia dois números inteiros e exiba sua divisão.

O segundo número não pode ser zero. O programa deve solicitar novamente até receber um valor válido.
</li>

<li>
No Assembly MIPS existe a instrução <strong>REM</strong>, responsável por retornar o resto da divisão.

Sem utilizar a instrução <strong>REM</strong>, desenvolva um algoritmo utilizando apenas:
<ul>
<li>DIV</li>
<li>MUL</li>
<li>SUB</li>
</ul>

O programa deve calcular o resto da divisão do maior valor pelo menor.
</li>

<li>
Leia uma quantidade desconhecida de números inteiros e conte quantos pertencem aos seguintes intervalos:
<ul>
<li>[0 – 25]</li>
<li>[26 – 50]</li>
<li>[51 – 75]</li>
<li>[76 – 100]</li>
</ul>

A leitura termina quando for digitado um número negativo.

Validar a entrada para aceitar apenas números entre 0 e 100.
</li>

<li>
Leia a altura, em centímetros, de 15 pessoas e exiba:
<ul>
<li>A menor altura do grupo;</li>
<li>A maior altura do grupo.</li>
</ul>
</li>
</ol>

<hr>

<h2>Lista 2 — Estruturas Condicionais</h2>

<ol>
<li>
Elabore um programa que converta um valor em dólar (US$) para real (R$).

Considere:
<ul>
<li>1 dólar = R$5;</li>
<li>Utilizar apenas números inteiros.</li>
</ul>
</li>

<li>
Leia dois valores em registradores e realize a troca de seus conteúdos.

Exiba os valores após a troca.
</li>

<li>
Leia:
<ul>
<li>Mês e ano de nascimento;</li>
<li>Mês e ano atual.</li>
</ul>

Calcule a idade da pessoa em meses.
</li>

<li>
A empresa <strong>ABC LTDA</strong> concederá um aumento de 25% aos funcionários.

Desenvolva um algoritmo que leia o salário atual e informe o novo salário.

Utilize apenas números inteiros:
<ul>
<li>Multiplique o salário por 25;</li>
<li>Divida o resultado por 100.</li>
</ul>
</li>

<li>
Leia os coeficientes <strong>A</strong>, <strong>B</strong> e <strong>C</strong> de uma equação do segundo grau e analise o valor de DELTA:

<ul>
<li>Δ &gt; 0 → “DUAS RAÍZES REAIS”;</li>
<li>Δ = 0 → “UMA RAIZ REAL”;</li>
<li>Δ &lt; 0 → “NÃO EXISTEM RAÍZES REAIS”.</li>
</ul>

Não é necessário calcular as raízes.
</li>

<li>
Leia dois números e informe:
<ul>
<li>Se são iguais;</li>
<li>Se forem diferentes, exiba o maior e o menor.</li>
</ul>
</li>

<li>
Leia um número inteiro entre 100 e 999 e exiba:

<pre>
CENTENA = x
DEZENA  = y
UNIDADE = z
</pre>

Exemplo:

<pre>
Entrada: 517

Saída:
CENTENA = 5
DEZENA  = 1
UNIDADE = 7
</pre>

Validar a entrada.
</li>

<li>
A loja <strong>Vende Tudo</strong> comercializa produtos com valores entre R$1000 e R$9999.

O valor das parcelas deve estar entre R$100 e R$500.

O programa deve calcular a quantidade de parcelas necessárias.

A última parcela poderá possuir valor inferior às demais.
</li>
</ol>

<hr>

<h2>Lista 3 — Operações Matemáticas e Repetição</h2>

<ol>
<li>
Receba comprimento, largura e altura de um paralelepípedo e calcule seu volume.
</li>

<li>
Receba o raio de uma circunferência e calcule seu comprimento.

Considere:
<ul>
<li>π = 3.</li>
</ul>
</li>

<li>
Leia dois valores inteiros e mostre a diferença entre o maior e o menor valor.
</li>

<li>
Leia quatro notas bimestrais de um aluno, calcule a média aritmética e exiba:

<ul>
<li>“APROVADO”, se média ≥ 6;</li>
<li>“EXAME”, se média ≥ 3 e &lt; 6;</li>
<li>“RETIDO”, se média &lt; 3.</li>
</ul>
</li>

<li>
Leia dois números inteiros, identifique o maior valor e calcule a soma dos números ímpares existentes entre eles.
</li>

<li>
Leia 10 números inteiros positivos e exiba:
<ul>
<li>O maior valor;</li>
<li>O menor valor.</li>
</ul>

Caso um número negativo seja informado, ele deverá ser desconsiderado e solicitado novamente.
</li>
</ol>

<hr>

<h2>Atividade Avaliativa</h2>

<p>
Desenvolva um algoritmo que leia dois anos e exiba todos os anos não bissextos existentes entre eles.
</p>

<p>
A diferença entre os anos não pode ser superior a 1000. Caso seja, os valores deverão ser solicitados novamente.
</p>


Arquitetura e Organização de Computadores FATEC ZL
Prof. Leandro Colevati Assembly MIPS
