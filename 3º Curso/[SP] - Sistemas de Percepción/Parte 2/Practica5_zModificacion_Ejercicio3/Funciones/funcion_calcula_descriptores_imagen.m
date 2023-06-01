function [XImagen] = funcion_calcula_descriptores_imagen(Ietiq, N)
%   Genera Ximagen - matriz de N filas y 23 columnas (los 23 descriptores
%    generados en el orden indicado en la práctica)

    XImagen = zeros(N,23); % N instancias con 23 descriptores cada una
    stats = regionprops(Ietiq,'Area','Perimeter','Eccentricity', ...
        'Solidity','Extent','EulerNumber');
    
    % Calculamos la compacticidad: Perimetro^2/Area
    areas = cat(1,stats.Area);
    perimetros = cat(1,stats.Perimeter);
    XImagen(:,1) = (perimetros.^2)./areas;
    
    % Establecemos la Excentricidad
    XImagen(:,2) = cat(1,stats.Eccentricity);
    
    % Establecemos la Solidez_CHull
    XImagen(:,3) = cat(1,stats.Solidity);
    
    % Establecemos la Extension_BBox sin rotación
    XImagen(:,4) = cat(1,stats.Extent);
    
    % Calculamos la Extension_BBox con rotación (Invariable Rotacion) y los
    % momentos de Hu y los 10 DF
    X = [];
    
    for i=1:N
        %Para cada región de interés de la imagen etiquetada
        Ibin_i = Ietiq == i;
        %Calculamos la extensión invariable a la rotación
        extentIR = Funcion_Calcula_Extent(Ibin_i);
        %Calculamos los 7 momentos de hu
        m = Funcion_Calcula_Hu(Ibin_i);
        %Calculamos los 10 descriptores de Fourier
        DF = Funcion_Calcula_DF(Ibin_i,10);
        % Para cada objeto -> 
        % ExtentInvRot - [7 momentos Hu] - [10 descriptores de Fourier]
        X(i,:) = [extentIR m' DF'];
        
    end
    %Añadimos lo anterior a las últimas columnas de cada fila
    XImagen(:,5:22) = X;
    
    % Establecemos el numero de euler como último descriptor
    XImagen(:,23) = cat(1,stats.EulerNumber);
end