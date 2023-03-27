
pathsArchivos = "PracticaFinal_P1\Implementacion\03_DisenoClasificador\";
fichero = 'VariablesRequeridas\ImagenesCalibracion.mat';
load(pathsArchivos + fichero);

fichero = 'VariablesRequeridas\XoYo_Color.mat';
load(pathsArchivos + fichero);

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
% 

%% Aplicación

addpath(pathsArchivos + 'Funciones');

valoresY = unique(Yo);
FoI = Yo == valoresY(2);
%Fondo = Yo == valoresY(1);
xClase = Xo(FoI,:);
%xFondo = Xo(Fondo,:);

numAgrup = 3;
[idx,centroides] = funcion_kmeans(xClase,numAgrup);

datosEsferas = zeros(numAgrup,6);
FoI = Yo == valoresY(1);
xFondo = Xo(FoI,:);

for i=1:numAgrup
    xColor_i = xClase(idx==i,:);
    [Rc,Gc,Bc,r1,r2,r12] = calcula_datos_esfera(xColor_i,xFondo);
    datosEsferas(i,:) = [Rc,Gc,Bc,r1,r2,r12];
end



for i=1:size(datosEsferas,1)
    datosEsfera_i = datosEsferas(i,:);
    centroides_i = datosEsfera_i(:,1:3);
    radios_i = datosEsfera_i(:,4:6);
    representa_datos_color_seguimiento_fondo(Xo,Yo), hold on
    representa_datos_color_seguimiento_agrupacion(xClase,idx)
    hold on, representa_esfera(centroides_i, radios_i(1))
end


%% Visualización
for j=1:size(Imagenes_Calibracion_ConObjeto(),4)
    figure, I = Imagenes_Calibracion_ConObjeto(:,:,:,j);
    subplot(2,2,1)
    imshow(I);
    title(["Imagen Original" num2str(j)])
    for i=1:size(datosEsferas(:,1:3),2)
        I1 = funcion_visualiza(I,calcula_deteccion_multiples_esferas_en_imagen(I,datosEsferas(:,3+i),datosEsferas(:,1:3)),[255 0 0],false);
        subplot(2,2,i+1)
        imshow(I1), hold on;
        %title(['Esfera de radio: ' num2str(datosEsferas(:,1))])
    end

end
pause
close all

save(pathsArchivos + "VariablesGeneradas/datosMultiplesEsferas.mat","datosEsferas");

rmpath(pathsArchivos + 'Funciones');