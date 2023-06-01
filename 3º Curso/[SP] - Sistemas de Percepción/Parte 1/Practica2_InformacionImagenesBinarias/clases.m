addpath("Practica2_InformacionImagenesBinarias/")
load("Ietiq_gold.mat")
I = imread("ImagenBinaria.tif");


%  matriz etiquetada, cada pixel tiene una etiqueta, si fondo etiqueta = 0,
%  primera x = 1, segunda x = 2, ... . Num maximo de etiqueta es el numero
%  de objetos en una imagen

%  Ib = Ietiq == 1 -> para ver lo que señala la primera etiqueta
% [f1, c1] = find(Ib) -> calcula el centroide par dar el area
%  o A1 = sum(Ib(:)) o A1 = length(f1)
% figure, imshow(I), hold on, plot(mean(c1),mean(f1), '*r')
% title(['Area: ' num2str(A1)])

% con imtool podemos ver qe etiqueta tiene cada objeto pasando el raton por
% encima del objeto

imtool(Ietiq)

close all;

N = max(Ietiq(:));

for i = 1:N

    Ib = Ietiq == i;
    [f,c] = find(Ib);
    figure, imshow(I), hold on, plot(mean(c), mean(f), '*r');
    title(['Area ' num2str(length(f))]);

end


close all;

% Para que pixeles tengan conectividad, tienen que darse dos comdiciones
%   - Vecinos: hay que definir de cuanto, 3*3 = 8.

Ib = [I I];

imtool(Ib);
f = 250; c = 566; Ib(f,c);

%  vecindad tipo 8
v8 = Ib(f-1:f+1,c-1:c+1);

valores = v8(v8 > 0);

% ind = find(v8);
% valores = v8Vector(v8Vector == 1);


v4 = [Ib(f,c-1:2:c+1) Ib(f-1:2:f+1,c)']

valores = v4(v4 == Ib(f,c))

% coordenadas de pixeles conectividad tipo 8
[f,c] = find(v8);