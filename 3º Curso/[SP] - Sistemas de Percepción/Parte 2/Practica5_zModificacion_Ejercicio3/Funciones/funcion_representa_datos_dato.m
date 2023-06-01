function funcion_representa_datos_dato(X,Y,espacioCcas, nombresProblema, Xi)

    codifClases = unique(Y);
    numClases = length(codifClases);

    if length(espacioCcas) == 2 % Si el espacio de ccas es de 2 dimensiones
        for i=1:numClases
            datosClase = X(Y==codifClases(i),espacioCcas);
            plot(datosClase(:,1), datosClase(:,2),nombresProblema.simbolos{i}), hold on
        end
        xlabel(nombresProblema.descriptores{espacioCcas(1)}), hold on
        ylabel(nombresProblema.descriptores{espacioCcas(2)}), hold on
    elseif length(espacioCcas) == 3 % Si el espacio de ccas es de 3 dimensiones o más
        
        for i=1:numClases
            datosClase = X(Y==codifClases(i),:);
            plot3(datosClase(:,1), datosClase(:,2),datosClase(:,3),nombresProblema.simbolos{i}), hold on
        end
        xlabel(nombresProblema.descriptores{1}), hold on
        ylabel(nombresProblema.descriptores{2}), hold on
        zlabel(nombresProblema.descriptores{3}), hold on
    else % solo de los 3 primeros
        espacioCcas_reducido = [espacioCcas(1) espacioCcas(2) espacioCcas(3)];
        for i=1:numClases
            datosClase = X(Y==codifClases(i),espacioCcas_reducido);
            plot3(datosClase(:,1), datosClase(:,2),datosClase(:,3),nombresProblema.simbolos{i}), hold on
        end
        xlabel(nombresProblema.descriptores{espacioCcas_reducido(1)}), hold on
        ylabel(nombresProblema.descriptores{espacioCcas_reducido(2)}), hold on
        zlabel(nombresProblema.descriptores{espacioCcas_reducido(3)})

        XiOI = Xi(1, espacioCcas_reducido);
        hold on, plot3(XiOI(1), XiOI(2), XiOI(3), 'ok', 'MarkerSize', 20)
    end
    legend(nombresProblema.clases);

    
end