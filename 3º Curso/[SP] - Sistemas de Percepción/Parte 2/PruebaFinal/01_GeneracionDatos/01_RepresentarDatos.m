clear, clc, close all

%% CARGAR CONJUNTO DE DATOS Y VARIABLES DEL PROBLEMA

pathMain = "Parte 2/PruebaFinal/";

addpath(pathMain + 'DatosGenerados')
addpath(pathMain + 'Funciones')
load ConjuntoDatosXY.mat
load nombresProblema.mat

%% REPRESENTAR LOS DATOS EN ESPACIOS DE CARACTERISTICAS DOS A DOS


% Cada gráfica en una ventana tipo figure. Utilizar la función:
% funcion_representa_datos(X,Y, espacioCcas, nombresProblema)
for i=1:2:size(X,2)-1
    funcion_representa_datos(X,Y, [i i+1], nombresProblema)
end

%% REPRESENTACIÓN HISTOGRAMA Y DIAGRAMA DE CAJAS DE CADA DESCRIPTOR
% Para cada descriptor, abrir dos ventanas tipo figure
% una para representar histogramas y otra para diagramas de caja

numClases = size(unique(Y),1);
numDescriptores = size(X,2);
codifClases = unique(Y);
nombreDescriptores = nombresProblema.descriptores;
nombreClases = nombresProblema.clases;
numMuestras = size(X,1);

for j=1:numDescriptores - 1 % se descarta el numero de euler
    
    % Valores máximo y mínimos para representar en la misma escala
    vMin = min(X(:,j)); 
    vMax = max(X(:,j));
    
    hFigure = figure; hold on
    bpFigure = figure; hold on
    
    for i=1:numClases
    
        Xij = X(Y==codifClases(i),j); % datos de la clase i del descriptor j 
        numDatosClase = size(Xij,1);

        figure(hFigure)
        subplot(numClases,1,i), hist(Xij),
        xlabel(nombreDescriptores{j})
        ylabel('Histograma')
        axis([ vMin vMax 0 numMuestras/4]) % inf para escala automática del eje y
        title(nombreClases{i})
        
        figure(bpFigure)
        subplot(1,numClases,i), boxplot(Xij)
        xlabel('Diagrama de Caja')
        ylabel(nombreDescriptores{j})
        axis([ 0 2 vMin vMax ])
        title(nombreClases{i})
    end
end