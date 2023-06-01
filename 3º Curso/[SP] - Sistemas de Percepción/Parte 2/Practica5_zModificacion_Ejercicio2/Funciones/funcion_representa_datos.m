function funcion_representa_datos(X,Y,espacioCcas, nombresProblema)

    codifClases = unique(Y);
    numClases = length(codifClases);

    figure, hold on
    if length(espacioCcas) == 2 % Si el espacio de ccas es de 2 dimensiones
        for i=1:numClases
            datosClase = X(Y==codifClases(i),espacioCcas);
            plot(datosClase(:,1), datosClase(:,2),nombresProblema.simbolos{i})
        end
        xlabel(nombresProblema.descriptores{espacioCcas(1)})
        ylabel(nombresProblema.descriptores{espacioCcas(2)})
    else % Si el espacio de ccas es de 3 dimensiones
        for i=1:numClases
            datosClase = X(Y==codifClases(i),espacioCcas);
            plot3(datosClase(:,1), datosClase(:,2),datosClase(:,3),nombresProblema.simbolos{i})
        end
        xlabel(nombresProblema.descriptores{espacioCcas(1)})
        ylabel(nombresProblema.descriptores{espacioCcas(2)})
        zlabel(nombresProblema.descriptores{espacioCcas(3)})
    end
    legend(nombresProblema.clases);

    
end