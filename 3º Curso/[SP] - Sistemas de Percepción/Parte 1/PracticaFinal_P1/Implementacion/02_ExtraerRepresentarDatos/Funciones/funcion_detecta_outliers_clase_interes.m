%% Función Detecta Outliers. Dados un conjunto X e Y devuelve otro conjunto
%% X e Y sin valores anómalos.

function [Xo, Yo] = funcion_detecta_outliers_clase_interes(X,Y,PoI)

    valoresY = unique(Y);
    FoI = Y == valoresY(PoI);
    R = X(:,1); G = X(:,2); B = X(:,3);
    XColor = X(Y==1,:);
    media = mean(XColor); desviacion = std(XColor);
    factor_outlier = 3;
    
    Rmax = media(1) + factor_outlier*desviacion(1);
    Rmin = media(1) - factor_outlier*desviacion(1);
    
    Gmax = media(2) + factor_outlier*desviacion(2);
    Gmin = media(2) - factor_outlier*desviacion(2);
    
    Bmax = media(3) + factor_outlier*desviacion(3);
    Bmin = media(3) - factor_outlier*desviacion(3);
    
    Rout = (X(:,1) < Rmin | X(:,1) > Rmax);
    Gout = (X(:,2) < Gmin | X(:,2) > Gmax);
    Bout = (X(:,3) < Bmin | X(:,3) > Bmax);
    
    pos_outliers = unique([find(FoI & Rout) ; find(FoI & Gout) ; find(FoI & Bout)]);
    representa_datos_color_seguimiento(X,Y),
    hold on, plot3(R(pos_outliers),G(pos_outliers),B(pos_outliers),'ok')
    
    X(pos_outliers,:) = [];
    Y(pos_outliers,:) = [];
    
    Xo = X;
    Yo = Y;
end