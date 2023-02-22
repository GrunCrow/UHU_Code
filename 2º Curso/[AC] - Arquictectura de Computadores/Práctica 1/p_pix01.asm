.MODEL small

.DATA
color db 01h 
fila dw 0
columna dw 0
borde_columna dw 319
borde_fila dw 199

.CODE
	MOV AX,seg color
	MOV DS,AX
	
	MOV AL, 13h; pantalla en modo gráfico
      	MOV AH, 0
       	INT 10h
        
	MOV AX, 0A000h   ; Elegimos la dirección de memoria en modo gráfico
	MOV ES, AX
	
	MOV AL, color
pinta_pixel:	
	
	MOV ES:[SI], AL
       	ADD SI, 1
	
      	CMP SI, 64000 ; máximo valor de SI = [(320 x 200)-1] ; corresponde con el píxel inferior derecho
	JB pinta_pixel
	
	;;;; borrame
	MOV SI, 0
	INC color
	INC color
	INC color
	MOV AL, color
	JMP pinta_pixel      	
END