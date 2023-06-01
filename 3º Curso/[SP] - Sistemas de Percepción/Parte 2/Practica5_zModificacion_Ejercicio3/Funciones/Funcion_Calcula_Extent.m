function extentIR =Funcion_Calcula_Extent(Ibin_i)

    %Centramos el objeto en la BBox
    I_centrada = Funcion_Centra_Objeto(Ibin_i);
    
    extentIR = 0;
    
    % Rotamos el objeto de 5 grados en 5 grados y escogemos el 'Extent' que
    % sea máximo.
    for i=0:5:355
        I_rotada = imrotate(I_centrada,5*i);
        stats = regionprops(I_rotada,'Extent');
        ExtentImagen = cat(1,stats.Extent);
        if ExtentImagen > extentIR
            extentIR = ExtentImagen;
        end
    end

end