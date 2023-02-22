.MODEL small

.DATA
color db 0Eh 

.CODE
	MOV AX,seg color
	MOV DS,AX
	
	MOV AL, 13h
      	MOV AH, 0
       	INT 10h
        
	MOV AX, 0A000h   ; Elegimos la dirección de memoria en modo gráfico
	MOV ES, AX
pinta_pixel:	
	MOV AL, color
	MOV ES:[SI], AL
       	ADD SI, 2
      	CMP SI, 319 
	JBE pinta_pixel
	
	MOV AH, 4ch
    	INT 21h	      	
END