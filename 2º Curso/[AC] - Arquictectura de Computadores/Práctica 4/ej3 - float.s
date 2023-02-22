;***********************************************
;**** EJERCICIO 3  PRACTICA 4 AC 2020-2021 *****
;***********************************************
;
;Para i = 0 hasta i = 9, con i = i + 1
;C[i] = A[i] - B[i]
;
;

		.data	;Declaracion de variables
A:              .float 10, 9, 8, 7, 6, 5, 4, 3, 2, 1  ;Vector A     A[0] A[4].... 
B:				.float 1, 2, 3, 4, 5, 6, 7, 8, 9, 10  ;Vector B
C: 				.float 0, 0, 0, 0, 0, 0, 0, 0, 0, 0  ;Vector C


				.text	;Contiene el conjunto de instrucciones del programa
main:			addi r1,r0,10		;Numero de iteraciones
				addi r2,r0,A		;Direccion del primer elemento de A (r2)
				addi r3,r0,B		;Direccion del primer elemento de B (r3)
				addi r7,r0,C		;Direccion del primer elemento de C (r7)
				
loop:			lw r4,0(r2)			;Cargamos en r4 el valor de A(i)
				lw r5,0(r3)			;Cargamos en r5 el valor de B(i)
				sub r6,r4,r5        ;Restamos el contenido de r4 por el contenido de r5 y lo guardo en r6
				sw 0(r7),r6			;Cargamos en C(i) el contenido de r6(resultado de sub)

cont:           addi r2,r2,4     ;sumo 4 para ir moviendome por el vector, nos vamos moviendo de 4 en 4, este es el puntero que me recorre A
				addi r3,r3,4     ;sumo 4 para ir moviendome por el vector, nos vamos moviendo de 4 en 4, este es el puntero que me recorre B
				addi r7,r7,4     ;sumo 4 para ir moviendome por el vector, nos vamos moviendo de 4 en 4, este es el puntero que me recorre C
                subi r1,r1,1     ;Comprobamos si hemos hecho las 10 iteraciones
                bnez r1,loop
				
				trap 6			  ;Fin del programa
				
				