data segment
    a dw 500
    b dw 500
ends

stack segment
    dw   128  dup(0)
ends

code segment
start:

    ; add your code here 
    
    ;comentarios con ;
    
    mov ax, a   ; AX = A
    sub ax, b   ; AX = A-B  
            
    
mov ax, 4c00h
int 21h  

ends

end start
