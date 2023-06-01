function funcion_representa_muestras_clasificacion_binaria_con_frontera(X, Y, nombresProblema, coeficientes_d12)
    valoresClases = unique(Y);
    numClases = length(valoresClases);
    [numDatos, numAtributos] = size(X);
    
    % Representación de los datos
    nombreCcas = nombresProblema.descriptores;
    simbolos = nombresProblema.simbolos;
    leyenda = nombresProblema.clases;
    
%     figure;
%     hold on;
    
    if numAtributos == 2
        for i = 1:numClases
            FoI = Y == valoresClases(i);
            x1 = X(FoI, 1);
            x2 = X(FoI, 2);
            plot(x1, x2, simbolos{i}), hold on;
        end
        
        legend(leyenda{1}, leyenda{2});
        xlabel(nombreCcas{1});
        ylabel(nombreCcas{2});
        grid on;
        hold on;
        
    else
        for i = 1:numClases
            FoI = Y == valoresClases(i);
            x1 = X(FoI, 1);
            x2 = X(FoI, 2);
            x3 = X(FoI, 3);
            plot3(x1, x2, x3, simbolos{i}), hold on;
        end
        
        legend(leyenda{1}, leyenda{2});
        xlabel(nombreCcas{1});
        ylabel(nombreCcas{2});
        zlabel(nombreCcas{3});
        grid on;
        hold on;
    end
    
    if nargin == 4 && numAtributos == 2
        % Representamos fronteras de decisión (frontera de separación lineal)
        x1min = min(X(:, 1));
        x1max = max(X(:, 1));
        x2min = min(X(:, 2));
        x2max = max(X(:, 2));
        axis([x1min, x1max, x2min, x2max]);
        
        A = coeficientes_d12(1);
        B = coeficientes_d12(2);
        C = coeficientes_d12(3);
        
        x1Recta = x1min:0.01:x1max;
        x2Recta = -(A * x1Recta + C) / (B + eps);
        plot(x1Recta, x2Recta, 'g');
        legend(leyenda{1}, leyenda{2}, 'Frontera de separacion');
        
    elseif nargin == 4 && numAtributos == 3
        % Representamos fronteras de decisión (frontera de separación plana)
        x1min = min(X(:, 1));
        x1max = max(X(:, 1));
        x2min = min(X(:, 2));
        x2max = max(X(:, 2));
        x3min = min(X(:, 3));
        x3max = max(X(:, 3));
        axis([x1min, x1max, x2min, x2max, x3min, x3max]);
        
        A = coeficientes_d12(1);
        B = coeficientes_d12(2);
        C = coeficientes_d12(3);
        D = coeficientes_d12(4);
        
        Xmin = min(X(:));
        Xmax = max(X(:));
        paso = (Xmax - Xmin) / 100;
        
        [x1Plano, x2Plano] = meshgrid(Xmin:paso:Xmax);
        x3Plano = -(A * x1Plano + B * x2Plano + D) / (C + eps);
        surf(x1Plano, x2Plano, x3Plano);
        legend(leyenda{1}, leyenda{2}, 'Frontera de separacion');
    end
    
    hold off;
end
