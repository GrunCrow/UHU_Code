.MODEL SMALL
.CODE
	org 100h
Programa_Int:
	JMP Reside
	
	contador_int db 0

Rutina_Servicio PROC
	CLI

	;PUSH AX
	;PUSH DX
	;PUSH SI
	;PUSH DI

	INC contador_int
	CMP contador_int, 45 
	                      ;182 ; 10 segundos 
	                      ; 18,2 int/segundo
	JNE fin
	
	;MOV AH, 0
	;INT 16h

	;MOV AL, 03h
	;MOV AH, 0
	;INT 10h

	MOV AH, 4Ch
	INT 21h
fin:
	;POP DI
	;POP SI
	;POP DX
	;POP AX
	STI
	IRET
ENDP

Reside:

	MOV DX, OFFSET Rutina_Servicio
	MOV AX, 0
	MOV ES, AX ; ES vale 0. 
	MOV SI, 1Ch*4
    	CLI         ; BIESTABLE QUE RESETEA LAS INTERRUPCIONES.
        	    ; deshabilita las interrupciones (clear interruption) 
	mov ES:[SI],DX   ; 0000h:[1Ch*4] <- DX = offset rutina_tiempo
	MOV ES:[SI+2],CS ;en la siguiente posicion de memoria tenemos el 
	                 ; segmento de codigo (CS) de la rutina tiempo
	STI         ; BIESTABLE QUE REESTABLECE LAS INTERRUPCIONES
	            ; habilita las interrupciones (set interruption)
	MOV DX, OFFSET Reside
	INT 27h ; deja residente desde la etiqueta hacia atras (rutina)

END Programa_Int