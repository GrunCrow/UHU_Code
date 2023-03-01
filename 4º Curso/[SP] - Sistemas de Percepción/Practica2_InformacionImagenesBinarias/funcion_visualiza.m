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

    [numFilas, numCol] = size(Ii);

    IR = uint8(zeros(size(Ii)));
    IG = uint8(zeros(size(Ii)));
    IB = uint8(zeros(size(Ii)));

    for fila = 1:numFilas
        for col = 1:numCol
            if Ib(fila, col) == true
                IR(fila, col) = Color(1);
                IG(fila, col) = Color(2);
                IB(fila, col) = Color(3);
            end
        end
    end
    
    Io = cat(3,IR,IG,IB);
    
    if flagRepresenta
        figure, imshow(Io);
    end

end

    