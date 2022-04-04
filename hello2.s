/* -----------------------------------------------
* UNIVERSIDAD DEL VALLE DE GUATEMALA 
* Organización de computadoras y Assembler
* Ciclo 1 - 2022
*
* hello2.s
* Suma dos valores numéricos: valor1 y valor2, al-
* macenados en memoria. El resultado se guarda en 
* suma.
* Imprime en pantalla el mensaje y resultado, uti-
* lizando programación mixta.
*
* R0: inicio de cadena o mensaje a imprimir.
* R1: valor numérico resultado de suma.
 ----------------------------------------------- */
 
 
.text
.align 2
.global main
.type main,%function

main:

	stmfd sp!, {lr}	/* SP = R13 link register */
	/* ----- Carga valor1 en R1 ----- */
	
	ldr r0,=valor1				@@ carga dirección de la localidad de memoria donde está valor1 al R0
	ldr r1,[r0]					@@ carga valor contenido (de la localidad) hacia el R1

	/* ----- Carga valor2 en R2 ----- */

	ldr r0,=valor2
	ldr r2,[r0]

	add r3,r1,r2				@@ suma R1 y R2, y el resultado lo guarda en R3
	
	ldr r0,=suma				@@ guarda resultado en "variable" suma
	str r3,[r0]

	/* ----- Imprime resultado ----- */

	ldr r0,=formato				@@ carga inicio de mensaje a imprimir.
	mov r1,r3					@@ mueve resultado de R3 a R1 a imprimir
	bl printf
	
	/* salida correcta */
	mov r0, #0
	mov r3, #0
	ldmfd sp!, {lr}	/* R13 = SP */
	bx lr

.data
.align 2
formato:
	.asciz "El resultado de la suma es: %d\n"
valor1:
	.word 25
valor2:
	.word 15
suma:
	.word 0
