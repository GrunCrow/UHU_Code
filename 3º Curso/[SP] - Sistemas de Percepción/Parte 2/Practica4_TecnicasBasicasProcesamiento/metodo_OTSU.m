%% Método OTSU

h = imhist(I);

gIni = 1;
gFin = 256;

% mu = nivel medio de gris de la img
% w1 = n1/n
% n = numPix dela img

[gMedio, numPix] = calcula_valor_medio_region_histograma(h, gIni, gFin);


%% 2. Calcular varianza entre calses para cada posicion, los niveles de grises desde el 2 al 255, descartando el 1 y 256

varianzaEntreClases = zeros(size(h));

for g=2:255
    varianzaEntreClases(g) = calcula_varianza_entre_clases(g, h, numPix);
end

%% 3. Calculo nivel de gris umbral (aquel que maximiza la varianza entre clases)

[varMax, gMax] = max(varianzaEntreClases);

T = gMax - 1;





function T_otsu = function_otsu(I)
    
function var = calcula_varianza_entre_clases ...

function



