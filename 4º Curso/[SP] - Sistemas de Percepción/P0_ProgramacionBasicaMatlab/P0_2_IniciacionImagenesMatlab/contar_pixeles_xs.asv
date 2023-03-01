addpath("P0_ProgramacionBasicaMatlab\P0_2_IniciacionImagenesMatlab\");

% Guarda en las posiciones de un vector llamado  conteoValores
% el número de veces que aparece en I cada uno de sus posiles valores.
% Para ello utiliza la función de matlab imhist
% Representa con stem la información de conteoValores

I=imread('X.jpg'); % Imagen en escala de grises - ver variable en workspace

conteoValores = imhist(I);

% Accede al numero de pixeles que hay en I con un nivel de gris 128
conteoValores(128+1)

% Representacion histograma con imhist
imshow(I), figure,imhist(I)

bin_mx = false(size(I));

px_de_x = 0;

umbral = 100;

for i=1:N
    for j=1:M
        if I(i,j) < umbral
            px_de_x = px_de_x + 1;
            bin_mx(i,j) = true;
        end
    end
end

Ib = I < umbral;
imshow(Ib);


imshow(bin_mx);