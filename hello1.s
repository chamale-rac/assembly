/* -----------------------------------------------
* UNIVERSIDAD DEL VALLE DE GUATEMALA 
* Organización de computadoras y Assembler
* Ciclo 1 - 2022
*
* hello1.s
* Imprime en pantalla el mensaje utilizando pro-
* gramación mixta.
*
* R0: inicio de cadena o mensaje a imprimir.
* R1: valor numérico a imprimir, no se usa.
 ----------------------------------------------- */
.text											@@ Inicio de segmento de código
.align 2
.global main
.type main,%function

main:

	stmfd sp!, {lr}								@@ SP = R13 link register 

	ldr r0,=mensaje
	bl printf
	
	mov r0, #0									@@ salida correcta 
	mov r3, #0
	ldmfd sp!, {lr}	/* R13 = SP */
	bx lr

.data
.align 2
mensaje:
	.asciz "Hello World - CC3054\n"

