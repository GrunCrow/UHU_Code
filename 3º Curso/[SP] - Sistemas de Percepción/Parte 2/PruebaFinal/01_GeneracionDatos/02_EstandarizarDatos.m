clear, close all, clc

pathMain = "Parte 2/PruebaFinal/";

addpath(pathMain + 'DatosGenerados')
addpath(pathMain + 'Funciones')

load ConjuntoDatosXY.mat
load nombresProblema.mat

% Variables del problema
[numMuestras, numDescriptores] = size(X);
codifClases = unique(Y);
numClases = length(codifClases);

%% Estandarización

medias = mean(X);
desviaciones = std(X);
medias(end) = 0; % el ultimo descriptor (euler) no se toca
desviaciones(end) = 1;


Z = X;

for i=1:numDescriptores-1
    Z(:,i) = (X(:,i)-medias(i))/(desviaciones(i)+eps);
end

save(pathMain + 'DatosGenerados/conjunto_datos_estandarizados','Z','Y');
save(pathMain + 'DatosGenerados/datos_estandarizados','medias','desviaciones');