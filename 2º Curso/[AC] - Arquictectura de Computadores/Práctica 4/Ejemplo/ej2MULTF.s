;***********************************************
;**** EJERCICIO 2  PRACTICA 4 AC 2018-2019 *****
;***********************************************
;
;********* FLOAT ***********
;
;Para i = 0 hasta i = 9, con i = i + 1
;A[i] = B * A[i] , siendo B = 2 
;
;

		.data	;Declaracion de variables
A:              .float 10, 9, 8, 7, 6, 5, 4, 3, 2, 1  ;Vector A     A[0] A[4].... 
B:				.float 2


				.text	;Contiene el conjunto de instrucciones del programa
main:			addi r1,r0,10		;Numero de iteraciones
				addi r2,r0,A		;Direccion del primer elemento de A
				lf f4,B   			;Cargamos B en r4
				
loop:			lf f3,0(r2)			;Cargamos en r3 el valor A(i) 
				multf f7,f3,f4       ;Multiplicamos el contenido de r3 por el contenido de r4 y lo guardo en r7
				sf 0(r2),f7			;Cargamos en X(i) el contenido de r7(resultado de mult)

cont:           addi r2,r2,4      ;sumo 4 para ir moviendome por el vector, nos vamos moviendo de 4 en 4, este es el puntero que me recorre A
                subi r1,r1,1     ;Comprobamos si hemos hecho las 10 iteraciones
                bnez r1,loop
				
				trap 6			  ;Fin del programa
				