function [IbinFilt] = funcion_elimina_regiones_ruidosas(Ibin)

%   La función funcion_elimina_regiones_ruidosas elimina las agrupaciones
%   conexas con una cantidad de píxeles igual al 0.1% del número total de
%   píxeles de la imagen.

    [N,M] = size(Ibin); % Sacamos el tamaño de la imagen
    Ibin2 = bwareaopen(Ibin, round(0.001*N*M)); % Eliminamos las 
                                                % componentes de menos del 
                                                % 0.1% del total de 
                                                % píxeles (NxM)
    % Si hay agrupaciones en la imagen resultante
    if sum(Ibin2>0)
        Ietiq = bwlabel(Ibin2); %La etiquetamos
        
        stats = regionprops(Ietiq,'Area'); %Le calculamos las areas 
                                           % a los objetos de la imagen
        areas = cat(1,stats.Area);
        numPix = floor(max(areas)/5);       % Calculamos el número de 
                                            % píxeles del objeto de mayor 
                                            % area dividido entre 5
                                            % (Segunda condición).
        
        IbinFilt = bwareaopen(Ibin2,numPix);
    else
        IbinFilt = Ibin2;
    end

end