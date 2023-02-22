.MODEL small

.DATA
color db 01h    
contador db 00h
fin_linea dw 00h    ;280h?
                    ;320d -> 140h x 2
                    ;modo grafico = 200 filas x 320 colum 

.CODE
	MOV AX,seg color
	MOV DS,AX
	
	MOV AL, 13h    ;int sw para establecer el modo de pantalla en modo grafco
    MOV AH, 0
    INT 10h
        
	MOV AX, 0A000h   ; Elegimos la dirección de memoria en modo gráfico
	MOV ES, AX
reset_color:
	MOV color, 01h
	JMP pinta_pixel   
pinta_pixel:	
	MOV AL, color
	MOV ES:[SI], AL
       	ADD SI, 2
       	ADD fin_linea,2
      	CMP fin_linea, 280h 
    JBE pinta_pixel
	
	;cuando se compare con 319 y sea == sale del bucle
	ADD contador, 01h
	;MOV AH, contador
	
	        ;poner esto cuando haya que cambiar el color
	        
        	ADD color, 01h
        	CMP color, 07h
        	JAE reset_color 
        	
        	;dsadasdsdadasdasdasdasjbdashdjasdjasmdasdas
	MOV fin_linea,00h
	CMP contador, 200	
	
	JBE pinta_pixel 
	
	
	
	MOV AH, 4ch
    	INT 21h	      	
END