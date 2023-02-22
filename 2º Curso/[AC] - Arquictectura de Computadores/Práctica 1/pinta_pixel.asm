.MODEL small

.DATA
color db 01h    
contador dw 00h
fin_linea dw 00h    ;280h
                    ;320d -> 140h x 2
                    ;modo grafico = 200 filas x 320 colum 
npant dw 00h
aux dw 00h

.CODE
	MOV AX,seg color
	MOV DS,AX 
	MOV fin_linea, 00h
	
	MOV AL, 13h    ;int sw para establecer el modo de pantalla en modo grafco
    MOV AH, 0
    INT 10h
        
	MOV AX, 0A000h   ; Elegimos la dirección de memoria en modo gráfico
	MOV ES, AX
	
	MOV SI, 280h  ;no se pita en las dos primeras lineas
reset_color:
	MOV color, 01h
	JMP pinta_pixel
cambia_color:
    ADD color, 01h
    MOV SI, 280h
    MOV contador, 00h 
    MOV aux, SI
    MOV SI, npant
    MOV ES:[SI], AL
    MOV SI, aux
    ADD npant, 2
    CMP color, 07h
    JAE reset_color  
pinta_pixel:	
	MOV AL, color
	MOV ES:[SI], AL
       	ADD SI, 2
       	ADD fin_linea,02h
      	CMP fin_linea, 13Fh 
    JBE pinta_pixel  
    
    ;hacemos salto de linea:
    ADD SI,280h  ;500h
    MOV fin_linea, 00h
    
    ;incremento contador para saber cuando termina 
    ADD contador, 01h
    CMP contador, 13Fh
    JAE cambia_color 

	JMP pinta_pixel 
	
	MOV AH, 4ch
    	INT 21h	      	
END