[gMean, numPix] = calcula_valor_medio_region_histograma(h, gIni, gFin);

addpath("Funciones");
h = imhist(I);

%% Establecer un valor de umbral T inicial

gIni = 1;
gFin = 256;

Tini = calcula_valor_medio_region_histograma(h, gIni, gFin);

Tini = round(Tini);


varCambio = True;
while (varCambio == True)
    %% 2. Establecer dos agrupaciones de pixeles: G1 y G2
    
    gIni = 1;
    gFin = Tini;
    
    m1 = calcula_valor_medio_region_histograma(h, gIni, gFin);
    
    
    gIni = Tini+1;
    gFin = 256;
    
    m2 = calcula_valor_medio_region_histograma(h, gIni, gFin);
    
    %% 3. Calcular media de intensidad
    
    T = (m1+m2)/2;
    
    if (abs(T-Tini) < umbralParada)
        varCambio = false;
    else
        Tini = round(T);
    end

end

unbral = T-1;
%% 4.