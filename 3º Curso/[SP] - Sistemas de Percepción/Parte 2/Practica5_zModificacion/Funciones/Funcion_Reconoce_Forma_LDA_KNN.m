function Funcion_Reconoce_Forma_LDA_KNN(rutaFicheroImagen)

    pathAnterior = "02_FaseEntrenamiento_CASO5_knn_LDA/";
    pathActual = "03_FaseTest_CASO5_knn_LDA/";
    
    addpath('Funciones')
    
    %% GENERACION DE DATOS DE LA IMAGEN
    
    I = imread(rutaFicheroImagen);
    
    umbral = graythresh(I); % Obtiene umbral de rango 0-1
    
    Ibin = I < 255*umbral;
    
    IbinFilt = funcion_elimina_regiones_ruidosas(Ibin);
    
    if sum(IbinFilt(:) > 0)
        [Ietiq, N] = bwlabel(IbinFilt);
        % Por cada objeto de la imagen, calculamos sus descriptores 
        XImagen = funcion_calcula_descriptores_imagen(Ietiq,N);
    else
        XImagen = [];
    end
    
    
    %% 3. ESTANDARIZAR DATOS
    
    % Cargamos medias y desviaciones de estandarización
    ruta = "DatosGenerados/";
    nombreArchivo = "datos_estandarizados.mat";
    load(ruta + nombreArchivo);
    
    numObjetos = N;
    numDescriptores = size(XImagen, 2);
    
    XImagenS = XImagen;
    
    for i = 1:numDescriptores
        if desviaciones(i) == 0
            desviaciones(i) = eps;
        end
        XImagenS(:, i) = (XImagen(:,i)-medias(i))/(desviaciones(i)+eps); 
    end
    
    %% 4.- CARGAR INFORMACIÓN PARA LA APLICACIÓN DE LOS CLASIFICADORES
    %% A UTILIZAR SEGÚN LA ESTRATEGIA DE CLASIFICACIÓN DISEÑADA
    
    % Cargar Informacion knn - CirculoCuadrado_Triangulo
    
    nombreArchivo = "DatosGenerados/espacioCcas_knn_CirculoCuadrado_Triangulo.mat";
    load(pathAnterior + nombreArchivo);
    
    espacioCcasCircCuad_Trian = espacioCcas;
    XTrainCircCuad_Trian = XoI;
    YTrainCircCuad_Trian = YoI;
    nombresCircCuad_Trian = nombresProblema;
    
    % Cargar Informacion LDA - Circulo Cuadrado
    
    nombreArchivo = "DatosGenerados/espacioCcas_LDA_Circulo_Cuadrado.mat";
    load(pathAnterior + nombreArchivo);
    
    d12CircCuad = d12;
    coeficientesCircCuad = coeficientes_d12;
    espacioCcasCircCuad = espacioCcas;
    XTrainCircCuad = XoI;
    YTrainCircCuad = YoI;
    nombresCircCuad = nombresProblemaOI;
    
    %% EVALUAMOS CLASIFICADORES PARA CADA OBJETO
    
    % Aplicar KNN
    
    k = 5;
    tipoDistancia = "Euclidea";
    codifClases = unique(YTrainCircCuad_Trian);
    color = [0 255 0];
    
    XoI = XImagenS(:, espacioCcasCircCuad_Trian);
    
    YoI = funcion_knn(XoI, XTrainCircCuad_Trian, YTrainCircCuad_Trian, k, tipoDistancia);
    
    
    %% 5.- APLICACIÓN DE CLASIFICADORES PARA EL RECONOCIMIENTO DE CADA OBJETO
    
    for i=1:numObjetos
        YiOI = YoI(i);
    
        posClaseOI = find(ismember(codifClases, YiOI)); % 1 = Circcuad- 2 = Triangulo
    
        Xi = XImagenS(i,:);
    
        if posClaseOI == 2 % Triangulo
            claseOI = nombresCircCuad_Trian.clases{3};
            reconocimiento = ["Reconocimiento objeto: " claseOI];
            color = [0 255 0];
        else % Circulo o Cuadrado
            % Clasificador Circulos-Cuadrado
            XiOI = Xi(1, espacioCcasCircCuad);
            X1 = XiOI(1); X2 = XiOI(2); X3 = XiOI(3);
            valor_d12CircTrian = eval(d12CircCuad);
            if valor_d12CircTrian>0  % Circulo
                claseOI = nombresCircCuad.clases{1};
                reconocimiento = {"Reconocimiento Objeto: " claseOI};
                color = [0 0 255];
            else % Cuadrado
                claseOI = nombresCircCuad.clases{2};
                reconocimiento = {"Reconocimiento Objeto: " claseOI};
                color = [0 0 255];
            end
        end
    
        Ib = Ietiq == i;
        
        %% 6.1.- FIGURA DE IMAGEN DE ENTRADA CON EL OBJETO RESALTADO
        %% DONDE EL TÍTULO HAGA CONSTAR EL RECONOCIMIENTO
    
        figure,
        subplot(1,2,1), funcion_visualiza(I, Ib, color, true);
        title(reconocimiento)
    
        %% 6.2.- En el caso de tratar con espacios de características de dos o tres dimensiones, REPRESENTACIÓN DE LA INSTANCIA DE TEST, JUNTO CON LAS %% DE TRAIN EN EL ESPACIO DE CARACTERÍSTICAS UTILIZADO. SI LA TÉCNICA DE
        %% CLASIFICACIÓN UTILIZA UN CLASIFICADOR MÍNIMA DISTANCIA,
        %% PUEDE REQUERIRSE LA REPRESENTACIÓN DE LA FRONTERA DE SEPARACIÓN
    
        subplot(1,2,2) % Circulos Cuadrados
        X = XTrainCircCuad; Y = YTrainCircCuad;
        nombres = nombresCircCuad; coeficientes = coeficientesCircCuad;
        funcion_representa_muestras_clasificacion_binaria_con_frontera(X, Y, nombres, coeficientes);
        XiOI = Xi(1, espacioCcasCircCuad);
        hold on, plot3(XiOI(1), XiOI(2), XiOI(3), 'ok')
    end
    
    rmpath('Funciones')

end

