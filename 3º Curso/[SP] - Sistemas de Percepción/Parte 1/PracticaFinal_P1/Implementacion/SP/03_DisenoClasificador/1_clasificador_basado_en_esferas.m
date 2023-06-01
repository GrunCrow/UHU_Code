% Limpiamos el workspace y cerramos todas las figuras
clear, close all, clc

% Establecer el path donde se encuentran los archivos necesarios
pathsArchivos = "PracticaFinal_P1\Implementacion\03_DisenoClasificador\";

% Cargar las imagenes de calibracion
fichero = 'VariablesRequeridas\ImagenesCalibracion.mat';
load(pathsArchivos + fichero);

% Cargar los datos de color del objeto de interes y del fondo
fichero = 'VariablesRequeridas\XoYo_Color.mat';
load(pathsArchivos + fichero);

% Se añade la ruta de las funciones
addpath(pathsArchivos + 'Funciones');


% %% Primera aproximación: Establecer un prisma rectangular en el espacio RGB
% %asociado al color de seguimiento.
% 
% % valoresY = unique(Yo);
% % FoI = Yo == valoresY(2);
% % Fondo = Yo == valoresY(1);
% % xClase = Xo(FoI,:);
% % xFondo = Xo(Fondo,:);
% % 
% % valoresMinimos = min(xClase); 
% % valoresMaximos = max(xClase);
% % 
% % Rmin = valoresMinimos(1); Rmax = valoresMaximos(1);
% % Gmin = valoresMinimos(2); Gmax = valoresMaximos(2);
% % Bmin = valoresMinimos(3); Bmax = valoresMaximos(3);
% 
% %% Segunda Opcion
% % Caracterizacion basada en una superficie esférica centrada en color medio
% 
% valoresMedios = mean(xClase);
% Rcentro = valoresMedios(1); Gcentro = valoresMedios(2); Bcentro = valoresMedios(3);
% representa_datos_color_seguimiento(Xo,Yo), hold on;
% plot3(Rcentro,Gcentro,Bcentro,'*k');
% representa_datos_color_fondo(Xo,Yo); 
% 
% % calcula_datos_esfera(xColor,xFondo)
% % 1. Calcula el centroide de a nube de puntos del color de seguimiento
% % (Rcentro, Gcentro, Bcentro)
% % 2. Calcula los vectores distancias entre el centroide anterior y cada uno
% % de los puntos de xColor y xFondo-
% %   - Por una parte, los valores de distancia entre el centroide y las muestras del color del objeto dadas por xColor.
% %   - Por otra parte, los valores de distancia entre el centroide y las
% %   muestras de fondo dadas por xFondo.
% % 3. Calcular r1 y r2 a partir de los vectores distancia anteriores
% %       - r1: valor máximo de las distancias centroide-xColor
% %       - r2: valor mínimo de las distancias centroide-xFondo
% % 4. Calcular el radio de compromiso r12 (promedio de r1 y r2)
% % 5. Devolver datosEsfera = [Rc,Gc,Bc,r1,r2,r12]
% %
% %
% %% Para calcular distancia desde un punto a una nube de puntos...
% % Hacerlo matricialmente mejor que en un bucle. Para ello:
% % siendo P un punto y NP una nube de puntos de tamaño size(NP,2),
% % P = Xo(1,:)';
% % NP = Xo(1:5,:)';
% % vectorDistancia = zeros(1,size(NP,2));
% % Pamp = repmat(P,1,size(NP,2)); 
% % vectorDistancia = distancia(Pamp,NP);
% %
% [Rc,Gc,Bc,r1,r2,r12] = calcula_datos_esfera(xClase,xFondo);
% 
% radios = [r1,r2,r12];
% centroide = [Rc Gc Bc];
% for i=1:length(radios)
%     figure
%     representa_datos_color_seguimiento_fondo(Xo,Yo)
%     hold on, representa_esfera(centroide, radios(i)), hold off
%     title(['Esfera de radio: ' num2str(radios(i))])
% end
% 
% %Nos quedamos con los píxeles de la imagen cuya distancia al centroide sea
% %menor que el radio de la esfera. Utilizamos la funcion_visualiza.
% %ventana figure de 2x2 1x1: original 1x2: r1 2x1: r2 ; 2x2 : r12.
%     I = Imagenes_Calibracion_Verde(:,:,:,7);
%     
%     subplot(2,2,1)
%     imshow(I);
%     title("Imagen Original")
%     for i=1:length(radios)
%         I1 = funcion_visualiza(I,calcula_deteccion_1esfera_en_imagen(I,radios(i),centroide),[255 0 0],false);
%         subplot(2,2,i+1)
%         imshow(I1), hold on;
%         title(['Esfera de radio: ' num2str(radios(i))])
%     end
% 
% 
% %
% % funcion Ib_centroides_radios = calcula_deteccion_1esfera_en_imagen(I, centroide_radios);
% %   RGB -> double
% % 
% %% K-Means
% % 
% % Divide la nube de puntos en grupos conexos (clustering).
% % 1. Nos quedamos con los datos del color (son los que queremos agrupar)
% % 2. num_Agrupaciones = 3;
% % 3. idx = funcion_kmeans(Xcolor, numAgrup);
% % 4.    A cada dato de xColor lo etiqueta con un numero que indica el grupo
% % al que pertenece. xColor1 = xColor(idx==1,:) -> datos de la agrupacion 1.
% % 5.    funcion -> representa_Datos_color_seguimiento_agrupacion();
% % 6.    funcion -> calcula_deteccion_multiples_esferas_en_imagen ->
% %       Ibfinal = Ib1 OR ib2 OR ib3;






% Se obtienen los valores únicos de Yo, se identifica la clase de interés y se seleccionan los valores de X correspondientes
valoresY = unique(Yo);
% Selecciona los datos de la clase de interés (en este caso, la segunda clase)
FoI = Yo == valoresY(2);
% Almacena los datos de la clase de interés en la matriz xClase
xClase = Xo(FoI,:);

% Se realiza la agrupación de los datos de la clase de interés utilizando k-means
numAgrup = 3; % Número de agrupaciones a realizar
% Aplica el algoritmo k-means a los datos de la clase de interés
[idx,centroides] = funcion_kmeans(xClase,numAgrup);

% Se calculan los datos de las esferas para cada grupo obtenido en la agrupación
% Inicializa la matriz para almacenar los datos de cada esfera
datosEsferas = zeros(numAgrup,6);
% Selecciona los datos de fondo (en este caso, la primera clase)
FoI = Yo == valoresY(1);
xFondo = Xo(FoI,:);

% Calcula los datos de cada esfera
for i=1:numAgrup
    % Selecciona los datos correspondientes a la i-ésima agrupación
    xColor_i = xClase(idx==i,:);
    % Calcula los datos de la esfera correspondiente a la i-ésima agrupación
    [Rc,Gc,Bc,r1,r2,r12] = calcula_datos_esfera(xColor_i,xFondo);
    % Almacena los datos de la esfera i-ésima en la matriz datosEsferas
    datosEsferas(i,:) = [Rc,Gc,Bc,r1,r2,r12];
end


% Se representan los datos en el espacio RGB, la agrupación realizada y las esferas calculadas para cada grupo
for i=1:size(datosEsferas,1)
    % Selecciona los datos correspondientes a la i-ésima esfera
    datosEsfera_i = datosEsferas(i,:);
    % Obtiene los centroides y radios de la i-ésima esfera
    centroides_i = datosEsfera_i(:,1:3);
    radios_i = datosEsfera_i(:,4:6);
    % Representa los datos de color correspondientes a la clase de interés y fondo
    representa_datos_color_seguimiento_fondo(Xo,Yo), hold on
    % Representa los datos de color de la i-ésima agrupación
    representa_datos_color_seguimiento_agrupacion(xClase,idx)
    % Representa la esfera correspondiente a la i-ésima agrupación
    hold on, representa_esfera(centroides_i, radios_i(1))
end


%% Visualización

% Iterar a través de cada imagen en Imagenes_Calibracion_ConObjeto
for j=1:size(Imagenes_Calibracion_ConObjeto(),4)
    % Obtener la imagen actual y mostrarla en una figura
    figure, I = Imagenes_Calibracion_ConObjeto(:,:,:,j);
    subplot(2,2,1)
    imshow(I);
    title(["Imagen Original" num2str(j)])
    
    % Iterar a través de cada esfera detectada
    for i=1:size(datosEsferas(:,1:3),2)
        % Obtener una imagen con la detección de esferas resaltada y mostrarla en una figura
        I1 = funcion_visualiza(I,calcula_deteccion_multiples_esferas_en_imagen(I,datosEsferas(:,3+i),datosEsferas(:,1:3)),[255 0 0],false);
        subplot(2,2,i+1)
        imshow(I1), hold on;
        %title(['Esfera de radio: ' num2str(datosEsferas(:,1))])
    end
end

% Pausar la ejecución para ver las figuras
pause

% Cerrar todas las figuras abiertas
close all

% Guardar los datos de las esferas detectadas en un archivo
save(pathsArchivos + "VariablesGeneradas/datosMultiplesEsferas.mat","datosEsferas");

% Eliminar la ruta de acceso a la carpeta "Funciones" de MATLAB
rmpath(pathsArchivos + 'Funciones');