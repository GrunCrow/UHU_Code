;***********************************************
;**** EJERCICIO 2  PRACTICA 4 AC 2018-2019 *****
;***********************************************
;
;Para i = 0 hasta i = 9, con i = i + 1
;A[i] = B * A[i] , siendo B = 2 
;
;******* DESENROLLADO DE BUCLE *****************

		.data	;Declaracion de variables
A:              .word 10, 9, 8, 7, 6, 5, 4, 3, 2, 1  ;Vector A     A[0] A[4]....
B:				.word 2


				.text	;Contiene el conjunto de instrucciones del programa
main:			;addi r1,r0,10		;Numero de iteraciones
				addi r2,r0,A		;Direccion del primer elemento de A
				lw r4,B   			;Cargamos B en r4
				
				
				;***** 0 -> A[0] ******
loop:			lw r3,0(r2)			;Cargamos en r3 el valor A(i)  
				mult r7,r3,r4       ;Multiplicamos el contenido de r3 por el contenido de r4 y lo guardo en r7
				sw 0(r2),r7			;Cargamos en A(i) el contenido de r7(resultado de mult)
				
				;***** 1 -> A[4]******
cont:           addi r2,r2,4      
				lw r3,0(r2)			
				mult r7,r3,r4       
				sw 0(r2),r7	
				
				;***** 2 -> A[8] ******
				addi r2,r2,4      
				lw r3,0(r2)			
				mult r7,r3,r4       
				sw 0(r2),r7	
				
				;***** 3 -> A[12] ******
				addi r2,r2,4      
				lw r3,0(r2)			
				mult r7,r3,r4       
				sw 0(r2),r7	
				
				;***** 4 -> A[16] ******
				addi r2,r2,4      
				lw r3,0(r2)			
				mult r7,r3,r4       
				sw 0(r2),r7	
				
				;***** 5 -> A[20] ******
				addi r2,r2,4      
				lw r3,0(r2)			
				mult r7,r3,r4       
				sw 0(r2),r7	
				
				;***** 6 -> A[24] ******
				addi r2,r2,4     
				lw r3,0(r2)			
				mult r7,r3,r4       
				sw 0(r2),r7	
				
				;***** 7 -> A[28] ******
				addi r2,r2,4      
				lw r3,0(r2)			
				mult r7,r3,r4       
				sw 0(r2),r7	
				
				;***** 8 -> A[32] ******
				addi r2,r2,4      
				lw r3,0(r2)			
				mult r7,r3,r4       
				sw 0(r2),r7	
				
				;***** 9 -> A[36] ******
				addi r2,r2,4     
				lw r3,0(r2)			
				mult r7,r3,r4       
				sw 0(r2),r7	
				
				
				
				trap 6			  ;Fin del programa
				