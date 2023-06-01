function Io = funcion_visualiza(Ii, Ib, Color,flagRepresenta) 
%%  FUNCION_VISUALIZA
% ========================================================================
% ENTRADA:
% 
% - Ii: Imagen de entrada. Esta puede ser en color (3 dimensiones) o en
% escala de grises (2 dimensiones).
%
% - Ib: Imagen binaria que indica qué pixeles hay que cambiar de color.
%
% - Color: vector de 3 valores [0,255]. 
%           Indica el color del que se van a pintar los píxeles marcados 
%           por Ib.
% 
% - flagRepresenta: Es una variable booleana que indica si se debe mostrar
%                   la figura (True) o no (False).
% 
% SALIDA:
% 
% - Io: Imagen de salida que representa la imagen Ii con los píxeles 
%       indicados en Ib cambiados al color indicado en Color.
% 
% 
    Io = Ii;
    Ib = cat(3,Ib,Ib,Ib);
    if(size(Ii,3) == 1)                                                     %   Si la matriz tiene dos dimensiones quiere decir que es en escala de grises.
        R = Ii;                                                             %   Para generar una imagen en escala de grises
        G = Ii;                                                             %   que tenga 3 dimensiones tenemos que aplicar la misma
        B = Ii;                                                             %   matriz en las 3 dimensiones (R,G,B).
        Io = cat(3,R,G,B);                                                  %   Concatenamos las 3 matrices iguales para obtener una imagen en "color" y poder trabajar con ella.
                                                       %   Hacemos lo mismo con la matriz binaria para poder aplicarla a las 3 capas.
    end
                                                                            %   Una vez tenemos la imagen con 3                                                                      %   dimensiones.
        R = uint8(Io(:,:,1));                                                      %   Obtenemos el componente rojo de la imagen.
        G = uint8(Io(:,:,2));                                                      %   Obtenemos el componente verde.
        B = uint8(Io(:,:,3));                                                      %   Obtenemos el componente azul.


        R(Ib(:,:,1) | Ib(:,:,2) | Ib(:,:,3)) = Color(1);                    %   Para cualquier pixel, si una de sus componentes RGB cumple la condición,  
        G(Ib(:,:,1) | Ib(:,:,2) | Ib(:,:,3)) = Color(2);                    %   tenemos que cambiarle el color al pixel. 
        B(Ib(:,:,1) | Ib(:,:,2) | Ib(:,:,3)) = Color(3);                    %   
        Io = cat(3,R,G,B);                                                  %   Construimos una nueva imagen concatenando los 3 componentes.
        
        if(flagRepresenta)                                                  %   Si la opción flagRepresenta está activada
            imtool(Io);                                                     %   Tenemos que mostrar la imagen que hemos generado.
        end                                                                 %
end