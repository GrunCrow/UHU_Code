%% Función Detecta Outliers. Dados un conjunto X e Y devuelve otro conjunto
%% X e Y sin valores anómalos.

function [Xo, Yo] = funcion_detecta_outliers_clase_interes(X,Y,PoI)

    valoresY = unique(Y);
    FoI = Y == valoresY(PoI);
    R = X(:,1); G = X(:,2); B = X(:,3);
    XColor = X(Y==1,:);
    media = mean(XColor); desviacion = std(XColor);
    factor_outlier = 1.25;
    
    Rmax = media(1) + factor_outlier*desviacion(1);
    Rmin = media(1) - factor_outlier*desviacion(1);
    
%     Bmax = media(3) + factor_outlier*desviacion(3);
%     Bmin = media(3) - factor_outlier*desviacion(3);
    Bmax = 150;
    Bmin = 70;
    
    % [Q1-1.25*(Q3-Q1), Q3+1.25*(Q3-Q1)] 
    Rout = (X(:,1) < Rmin | X(:,1) > Rmax);
    Bout = (Bmin < X(:,3) & X(:,3) < Bmax);
    
    pos_outliers = unique([find(FoI & Rout & Bout)]);
    representa_datos_color_seguimiento(X,Y),
    hold on, plot3(R(pos_outliers),G(pos_outliers),B(pos_outliers),'ok')
    
    X(pos_outliers,:) = [];
    Y(pos_outliers,:) = [];
    
    Xo = X;
    Yo = Y;
end