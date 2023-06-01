function Io = funcion_visualiza(Ii, Ib, Color, flagRepresenta)
% donde:
%  Ii: imagen de entrada, que puede ser en color o en escala de grises.
% Imagen etiquetada
%  Ib: matriz binaria del mismo número de filas y columnas que la imagen de
% entrada, puede ser tipo logical o double.
%  Color: vector con 3 valores de 0 a 255, con la codificación RGB de un
% determinado color.
%  flagRepresenta: variable opcional que, cuando se pasa como un true
% lógico, indica a la función que debe generar una ventana tipo figure con la
% representación de la imagen de salida.
%  Io: imagen en color de salida que representa la información de Ib (‘1s’
% binarios) en el color especificado en Color, sobre la imagen de entrada Ii.
    
%     imagen intensidad = mismos valores paar RGB para cada pixel

%     IR = uint8(zeros(size(Ii)));
%     IG = uint8(zeros(size(Ii)));
%     IB = uint8(zeros(size(Ii)));
    
    Io = Ii;
    Ib = cat(3,Ib,Ib,Ib); % Imagen binaria concatenada

    if(size(Ii,3) == 1) %   Si un canal == escala de grises
        IR = Ii;        %   Así que los 3 canalaes con los mismos valores
        IG = Ii;        
        IB = Ii;        
        Io = cat(3,IR,IG,IB);      %   Concatenamos las 3 matrices iguales para obtener una imagen en "color" y poder trabajar con ella.
                                %   Hacemos lo mismo con la matriz binaria para poder aplicarla a las 3 capas.
    end

                                                                    %   Una vez tenemos la imagen con 3                                                                      %   dimensiones.
    IR = uint8(Io(:,:,1));                                                      %   Obtenemos el componente rojo de la imagen.
    IG = uint8(Io(:,:,2));                                                      %   Obtenemos el componente verde.
    IB = uint8(Io(:,:,3));                                                      %   Obtenemos el componente azul.


    IR(Ib(:,:,1) | Ib(:,:,2) | Ib(:,:,3)) = Color(1);                    %   Para cualquier pixel, si una de sus componentes RGB cumple la condición,  
    IG(Ib(:,:,1) | Ib(:,:,2) | Ib(:,:,3)) = Color(2);                    %   tenemos que cambiarle el color al pixel. 
    IB(Ib(:,:,1) | Ib(:,:,2) | Ib(:,:,3)) = Color(3);                    %

    Io = cat(3,IR,IG,IB);
    
    if flagRepresenta
        imtool(Io);
    end

end

    