function Funcion_Reconoce_Forma_LDA_KNN(rutaFicheroImagen)

    pathMain = "Parte 2/PruebaFinal/";
    pathAnterior = pathMain + "02_FaseEntrenamiento_CASO4_knn_LDA/";
    pathActual = pathMain + "03_FaseTest_CASO4_knn_LDA/";
    
    addpath(pathMain + 'Funciones')
    
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
    ruta = pathMain + "DatosGenerados/";
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
    
    % Cargar Informacion knn luego LDA
    
    ruta = pathAnterior; 
    nombreArchivo = "DatosGenerados/espacioCcas_knn_Circulo_Cuadrado_Triangulo.mat";
    load(ruta + nombreArchivo);
    
    espacioCcasCircCuadTrian = espacioCcas;
    XTrainCircCuadTrian = XoI;
    YTrainCircCuadTrian = YoI;
    nombresCircCuadTrian = nombresProblema;
    
    % Circulo Triangulo
    
    ruta = pathAnterior; 
    nombreArchivo = "DatosGenerados/espacioCcas_LDA_Circulo_Triangulo.mat";
    load(ruta + nombreArchivo);
    
    d12CircTrian = d12;
    coeficientesCircTrian = coeficientes_d12;
    espacioCcasCircTrian = espacioCcas;
    XTrainCircTrian = XoI;
    YTrainCircTrian = YoI;
    nombresCircTrian = nombresProblemaOI;
    
    %% EVALUAMOS CLASIFICADORES PARA CADA OBJETO
    
    % Aplicar KNN
    
    k = 5;
    tipoDistancia = "Euclidea";
    codifClases = unique(YTrainCircCuadTrian);
    color = [0 255 0];
    
    XoI = XImagenS(:, espacioCcasCircCuadTrian);
    
    YoI = funcion_knn(XoI, XTrainCircCuadTrian, YTrainCircCuadTrian, k, tipoDistancia);
    
    
    %% 5.- APLICACIÓN DE CLASIFICADORES PARA EL RECONOCIMIENTO DE CADA OBJETO
    
    for i=1:numObjetos
        YiOI = YoI(i);
    
        posClaseOI = find(ismember(codifClases, YiOI));
    
        Xi = XImagenS(i,:);
    
        if posClaseOI == 2 % Cuadrado
            claseOI = nombresCircCuadTrian.clases{posClaseOI};
            reconocimiento = ["Reconocimiento objeto: " claseOI];
            color = [0 255 0];
        else % Circulo o Triangulo
            % Clasificador Circulos-Triangulos
            XiOI = Xi(1, espacioCcasCircTrian);
            X1 = XiOI(1); X2 = XiOI(2); X3 = XiOI(3);
            valor_d12CircTrian = eval(d12CircTrian);
            if valor_d12CircTrian>0  % Circulo
                claseOI = nombresCircTrian.clases{1};
                reconocimiento = {"Reconocimiento Objeto: " claseOI};
                color = [0 0 255];
            else % Triangulo
                claseOI = nombresCircTrian.clases{2};
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
    
        subplot(1,2,2) % Circulos Triangulos
        X = XTrainCircTrian; Y = YTrainCircTrian;
        nombres = nombresCircTrian; coeficientes = coeficientesCircTrian;
        funcion_representa_muestras_clasificacion_binaria_con_frontera(X, Y, nombres, coeficientes);
        XiOI = Xi(1, espacioCcasCircTrian);
        hold on, plot3(XiOI(1), XiOI(2), XiOI(3), 'ok')
    end
    
    rmpath(pathMain + 'Funciones')









end

