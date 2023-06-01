function Io = funcion_visualiza(Ii, Ib, Color,flagRepresenta) 

% - Ii: Imagen de entrada.
%               En color (3 dimensiones)
%               Escala de grises (2 dimensiones)
%
% - Ib: Imagen binaria que indica qué pixeles hay que cambiar de color
%
% - Color: vector de 3 valores [0,255]
%          Indica el color del que se van a pintar los píxeles marcados por Ib
% 
% - flagRepresenta: Indica si mostrar la imagen (true/false)
% 


 
% - Io: Imagen de salida que representa la imagen Ii con los píxeles 
%       indicados en Ib cambiados al color indicado en Color


    Io = Ii;
    Ib = cat(3,Ib,Ib,Ib);

    % Si matriz 2D (escala de grises) -> pasar a 3D ("color")
    if(size(Ii,3) == 1)                                                     
        R = Ii;
        G = Ii;
        B = Ii;
        % Aplicar la misma matriz en las 3 dimensiones -> escala de grises
        Io = cat(3,R,G,B);
    end
        
    % Obtener componentes RGB    
    R = uint8(Io(:,:,1));
    G = uint8(Io(:,:,2));
    B = uint8(Io(:,:,3));

    % Si uno de los px cumple la condición, cambiar de color
    R(Ib(:,:,1) | Ib(:,:,2) | Ib(:,:,3)) = Color(1);
    G(Ib(:,:,1) | Ib(:,:,2) | Ib(:,:,3)) = Color(2);
    B(Ib(:,:,1) | Ib(:,:,2) | Ib(:,:,3)) = Color(3);
    % Concatenar 3 componentes
    Io = cat(3,R,G,B);
    
    % Si representa, mostrar imagen
    if(flagRepresenta)
        imshow(Io);
    end
end