function Funcion_Reconoce_Forma_LDA(rutaFicheroImagen)
    
    pathMain = "Parte 2/PruebaFinal/";
    pathAnterior = pathMain + "02_FaseEntrenamiento_CASO1_LDA_clases2a2/";
    pathActual = pathMain + "03_FaseTest_CASO1_LDA_clases2a2/";
    
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
    %     % (X(:,i)-medias(i))/(desviaciones(i)+eps);
    %     Descriptor = XImagen(:,i);
    %     media = mean(Descriptor);
    %     desviacion = std(Descriptor);
    % 
    %     %medias_desviaciones(:,i) = [media, desviacion];
    %     XImagenS(:, i) = (Descriptor - media)./desviacion;
    
    
        XImagenS(:, i) = (XImagen(:,i)-medias(i))/(desviaciones(i)+eps); 
    end
    
    %% 4.- CARGAR INFORMACIÓN PARA LA APLICACIÓN DE LOS CLASIFICADORES
    %% A UTILIZAR SEGÚN LA ESTRATEGIA DE CLASIFICACIÓN DISEÑADA
    
    % Circulo Cuadrado
    
    ruta = pathAnterior; 
    nombreArchivo = "01_CirculoCuadrado/DatosGenerados/espacioCcas_LDA_Circulo_Cuadrado.mat";
    load(ruta + nombreArchivo);
    
    d12CircCuad = d12;
    coeficientesCircCuad = coeficientes_d12;
    espacioCcasCircCuad = espacioCcas;
    XTrainCircCuad = XoI;
    YTrainCircCuad = YoI;
    nombresCircCuad = nombresProblemaOI;
    
    % Circulo Triangulo
    
    nombreArchivo = "02_CirculoTriangulo/DatosGenerados/espacioCcas_LDA_Circulo_Triangulo.mat";
    load(ruta + nombreArchivo);
    
    d12CircTrian = d12;
    coeficientesCircTrian = coeficientes_d12;
    espacioCcasCircTrian = espacioCcas;
    XTrainCircTrian = XoI;
    YTrainCircTrian = YoI;
    nombresCircTrian = nombresProblemaOI;
    
    % Cuadrado Triangulo
    
    nombreArchivo = "03_CuadradoTriangulo/DatosGenerados/espacioCcas_LDA_Cuadrado_Triangulo.mat";
    load(ruta + nombreArchivo);
    
    d12CuadTrian = d12;
    coeficientesCuadTrian = coeficientes_d12;
    espacioCcasCuadTrian = espacioCcas;
    XTrainCuadTrian = XoI;
    YTrainCuadTrian = YoI;
    nombresCuadTrian = nombresProblemaOI;
    
    %% EVALUAMOS CLASIFICADORES PARA CADA OBJETO
    for i=1:numObjetos
        Xi = XImagenS(i,:);
    
        % Clasificador Circulos-Cuadrados
        XiOI = Xi(1, espacioCcasCircCuad);
        X1 = XiOI(1); X2 = XiOI(2); X3 = XiOI(3);
        valor_d12CircCuad = eval(d12CircCuad); % Si negativo es cuadrado
    
        % Clasificador Circulos-Triangulos
        XiOI = Xi(1, espacioCcasCircTrian);
        X1 = XiOI(1); X2 = XiOI(2); X3 = XiOI(3);
        valor_d12CircTrian = eval(d12CircTrian);
    
        % Clasificador Cuadrados-Triangulos
        XiOI = Xi(1, espacioCcasCuadTrian);
        X1 = XiOI(1); X2 = XiOI(2); X3 = XiOI(3);
        valor_d12CuadTria = eval(d12CuadTrian);
        
        %% 5.- APLICACIÓN DE CLASIFICADORES PARA EL RECONOCIMIENTO DE CADA OBJETO
    
        % Regla de decisión
        if valor_d12CircCuad>0 && valor_d12CircTrian>0 % Circulo
            claseOI = nombresCircCuad.clases{1};
            reconocimiento = ["Reconocimiento Objeto: " claseOI];
            color = [255 0 0];
        elseif valor_d12CircCuad<0 && valor_d12CuadTria >0 % Cuadrado
            claseOI = nombresCircCuad.clases{2};
            reconocimiento = {"Reconocimiento Objeto: " claseOI};
            color = [0 255 0];
        elseif valor_d12CircTrian<0 && valor_d12CuadTria <0 % Triangulo
            claseOI = nombresCircTrian.clases{2};
            reconocimiento = {"Reconocimiento Objeto: " claseOI};
            color = [0 0 255];
        end
        
        %% 6.- VISUALIZACIÓN DE RESULTADOS:
    
        %% 6.1.- FIGURA DE IMAGEN DE ENTRADA CON EL OBJETO RESALTADO
        %% DONDE EL TÍTULO HAGA CONSTAR EL RECONOCIMIENTO
        Ib = Ietiq == i;
        
        % Mostrar clasificación
        figure,
        subplot(2,2,1), funcion_visualiza(I, Ib, color, true);
        title(reconocimiento)
        
        %% 6.2.- En el caso de tratar con espacios de características de dos o tres dimensiones, REPRESENTACIÓN DE LA INSTANCIA DE TEST, JUNTO CON LAS %% DE TRAIN EN EL ESPACIO DE CARACTERÍSTICAS UTILIZADO. SI LA TÉCNICA DE
        %% CLASIFICACIÓN UTILIZA UN CLASIFICADOR MÍNIMA DISTANCIA,
        %% PUEDE REQUERIRSE LA REPRESENTACIÓN DE LA FRONTERA DE SEPARACIÓN
        % Mostrar hiperplano y clases
    
        subplot(2,2,2) % Circulos Cuadrados
        X = XTrainCircCuad; Y = YTrainCircCuad;
        nombres = nombresCircCuad; coeficientes = coeficientesCircCuad;
        funcion_representa_muestras_clasificacion_binaria_con_frontera(X, Y, nombres, coeficientes);
        XiOI = Xi(1, espacioCcasCircCuad);
        title("Circulos - Cuadrados");
        hold on, plot3(XiOI(1), XiOI(2), XiOI(3), 'ok')
    
    
        subplot(2,2,3) % Circulos Triangulos
        X = XTrainCircTrian; Y = YTrainCircTrian;
        nombres = nombresCircTrian; coeficientes = coeficientesCircTrian;
        funcion_representa_muestras_clasificacion_binaria_con_frontera(X, Y, nombres, coeficientes);
        XiOI = Xi(1, espacioCcasCircTrian);
        title("Circulos - Triangulos");
        hold on, plot3(XiOI(1), XiOI(2), XiOI(3), 'ok')
    
    
        subplot(2,2,4) % Cuadrados Triangulos
        X = XTrainCuadTrian; Y = YTrainCuadTrian;
        nombres = nombresCuadTrian; coeficientes = coeficientesCuadTrian;
        funcion_representa_muestras_clasificacion_binaria_con_frontera(X, Y, nombres, coeficientes);
        XiOI = Xi(1, espacioCcasCuadTrian);
        title("Cuadrados - Triangulos");
        hold on, plot3(XiOI(1), XiOI(2), XiOI(3), 'ok')
    
    
    end
    
end

