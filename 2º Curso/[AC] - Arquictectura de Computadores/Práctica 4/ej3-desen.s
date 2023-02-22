;***********************************************
;**** EJERCICIO 3  PRACTICA 4 AC 2020-2021 *****
;***********************************************
;
;Para i = 0 hasta i = 9, con i = i + 1
;C[i] = A[i] - B[i]
;
;

		.data	;Declaracion de variables
A:              .word 10, 9, 8, 7, 6, 5, 4, 3, 2, 1  ;Vector A     A[0] A[4].... 
B:				.word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10  ;Vector B
C: 				.word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0  ;Vector C


		.text	;Contiene el conjunto de instrucciones del programa
main:			addi r1,r0,10		;Numero de iteraciones
				addi r2,r0,A		;Direccion del primer elemento de A (r2)
				addi r3,r0,B		;Direccion del primer elemento de B (r3)
				addi r7,r0,C		;Direccion del primer elemento de C (r7)
				
				
				;***** i (= 0) -> A[0] *****
				lw r4,0(r2)			;Cargamos en r4 el valor de A(i)
				lw r5,0(r3)			;Cargamos en r5 el valor de B(i)
				sub r6,r4,r5        ;Restamos el contenido de r4 por el contenido de r5 y lo guardo en r6
				sw 0(r7),r6			;Cargamos en C(i) el contenido de r6(resultado de sub)
				
				;***** i+1 (= 1) -> A[4] *****
				lw r4,4(r2)			
				lw r5,4(r3)			
				sub r6,r4,r5     
				sw 4(r7),r6

				;***** i+2 (= 2) -> A[8] *****
				lw r4,8(r2)			
				lw r5,8(r3)			
				sub r6,r4,r5     
				sw 8(r7),r6	
				
				;***** i+3 (= 3) -> A[12] *****
				lw r4,12(r2)			
				lw r5,12(r3)			
				sub r6,r4,r5     
				sw 12(r7),r6
				
				;***** i+4 (= 4) -> A[16] *****
				lw r4,16(r2)			
				lw r5,16(r3)			
				sub r6,r4,r5     
				sw 16(r7),r6
				
				;***** i+5 (= 5) -> A[20] *****
				lw r4,20(r2)			
				lw r5,20(r3)			
				sub r6,r4,r5     
				sw 20(r7),r6
				
				;***** i+6 (= 6) -> A[24] *****
				lw r4,24(r2)			
				lw r5,24(r3)			
				sub r6,r4,r5     
				sw 24(r7),r6
				
				;***** i+7 (= 7) -> A[28] *****
				lw r4,28(r2)			
				lw r5,28(r3)			
				sub r6,r4,r5     
				sw 28(r7),r6
				
				;***** i+8 (= 8) -> A[32] *****
				lw r4,32(r2)			
				lw r5,32(r3)			
				sub r6,r4,r5     
				sw 32(r7),r6
				
				;***** i+9 (= 9) -> A[36] *****
				lw r4,36(r2)			
				lw r5,36(r3)			
				sub r6,r4,r5     
				sw 36(r7),r6
				
				trap 6			  ;Fin del programa
				
				