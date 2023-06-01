I = imread("Matric.tif");

h = imhist(I);

%% Programación isodata

umbralParada = 0;

% Umbral Inicial

gIni = 1; gFin = 256;
[T, numPix] = calcula_Valor_medio_region_histograma(h, gIni, gFin);

% Repetir Iterativamente
flagCambio = true;

    gIni = 1; gFin = round(T);
    gMean1 = ...;
        calcula_valor_medio_region_histograma(h, gIni, gFin);

    gIni =



    ...

   if abs(T-newT) <= umbralParada
       %%% Salimos del bucle

        flagcambio = false;

   end

   T = newT

% Fin del bucle
T = T-1;

funcion_isodata(I, umbralParada);