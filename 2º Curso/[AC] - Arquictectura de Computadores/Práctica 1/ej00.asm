.MODEL small

.DATA
mensaje db 'Hola Mundo!*'

.CODE
	MOV AX,seg mensaje
	MOV DS,AX
	
	MOV AL, 03h
      	MOV AH, 0
       	INT 10h
        
	MOV AX, 0B800h   ; Elegimos la dirección de memoria en modo texto
	MOV ES, AX
pinta_cadena:	
	MOV AL, mensaje[SI]
	MOV AH, 0Eh
	MOV ES:[DI], AX
       	ADD DI, 2
      
	INC SI
	
	CMP mensaje[SI], '*'
	JNE pinta_cadena

	MOV AH, 4ch ;devuelve control a DOS
    	INT 21h	
	      	
END