function Funcion_Reconoce_Letra_KNN_LDA_QDA(rutaFicheroImagen)

    pathAnterior = "02_FaseEntrenamiento_knn_LDA_QDA/";
    pathActual = "03_FaseTest/";
    
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
    
    % Cargar Informacion knn - ACDEFG_B
    
    nombreArchivo = "DatosGenerados/espacioCcas_knn_ACDEFG_B.mat";
    load(pathAnterior + nombreArchivo);
    
    espacioCcas_ACDEFG_B = espacioCcas;
    XTrain_ACDEFG_B = XoI;
    YTrain_ACDEFG_B = YoI;
    nombres_ACDEFG_B = nombresProblema;
    
    % Cargar Informacion LDA - ACD_EFG
    
    nombreArchivo = "DatosGenerados/espacioCcas_LDA_ACD_EFG.mat";
    load(pathAnterior + nombreArchivo);
    
    d12_ACD_EFG = d12;
    coeficientes_ACD_EFG = coeficientes_d12;
    espacioCcas_ACD_EFG = espacioCcas;
    XTrain_ACD_EFG = XoI;
    YTrain_ACD_EFG = YoI;
    nombres_ACD_EFG = nombresProblemaOI;
    
    % Cargar Informacion knn - 
    
    nombreArchivo = "DatosGenerados/espacioCcas_knn_A_C_D.mat";
    load(pathAnterior + nombreArchivo);
    
    espacioCcas_A_C_D = espacioCcas;
    XTrain_A_C_D = XoI;
    YTrain_A_C_D = YoI;
    nombres_A_C_D = nombresProblema;
    
    % Cargar Informacion QDA - E - F - G
    
    nombreArchivo = "DatosGenerados/espacioCcas_QDA_E_F_G.mat";
    load(pathAnterior + nombreArchivo); 
    
    espacioCcas_E_F_G = espacioCcas;
    XTrain_E_F_G = XoI;
    YTrain_E_F_G = YoI;
    nombres_E_F_G = nombresProblemaOI;
    
    %% EVALUAMOS CLASIFICADORES PARA CADA OBJETO
    
    % Aplicar KNN
    
    k = 5;
    tipoDistancia = "Euclidea";
    codifClases = unique(YTrain_ACDEFG_B);
    
    XoI = XImagenS(:, espacioCcas_ACDEFG_B);
    
    YoI = funcion_knn(XoI, XTrain_ACDEFG_B, YTrain_ACDEFG_B, k, tipoDistancia);
    
    
    %% 5.- APLICACIÓN DE CLASIFICADORES PARA EL RECONOCIMIENTO DE CADA OBJETO
    
    for i=1:numObjetos
        YiOI = YoI(i);
    
        posClaseOI = find(ismember(codifClases, YiOI)); % 1 = ACDEFG, 2 = B
    
        Xi = XImagenS(i,:);
    
        if posClaseOI == 2 % B
            claseOI = nombres_ACDEFG_B.clases{posClaseOI};
            reconocimiento = ["Reconocimiento objeto: " claseOI];
            color = [255 0 0];
    
            Ib = Ietiq == i;
        
            %% 6.1.- FIGURA DE IMAGEN DE ENTRADA CON EL OBJETO RESALTADO
            %% DONDE EL TÍTULO HAGA CONSTAR EL RECONOCIMIENTO
        
            figure,
            funcion_visualiza(I, Ib, color, true);
            title(reconocimiento)
        elseif posClaseOI == 1 % ACDEFG
            % Clasificador ACD - EFG
            XiOI = Xi(1, espacioCcas_ACD_EFG);
            X1 = XiOI(1); X2 = XiOI(2); X3 = XiOI(3);
            valor_d12CircTrian = eval(d12_ACD_EFG);
            if valor_d12CircTrian>0  % ACD
                espacioCcas = espacioCcas_A_C_D;
                k = 5;
                tipoDistancia = "Euclidea";
                codifClases_A_C_D = unique(YTrain_A_C_D);
                XoI = XImagenS(:, espacioCcas_A_C_D);            
                YoI_A_C_D = funcion_knn(XoI, XTrain_A_C_D, YTrain_A_C_D, k, tipoDistancia);
                
                YiOI = YoI_A_C_D(i);
                posClaseOI = find(ismember(codifClases_A_C_D, YiOI)); % 1 = ACDEFG, 2 = B
    
                claseOI = nombres_A_C_D.clases{posClaseOI};
                reconocimiento = {"Reconocimiento Objeto: " claseOI};
                color = [0 255 0];
            else % EFG
                espacioCcas = espacioCcas_E_F_G;
                XTest = XImagenS(:, espacioCcas_E_F_G);
                codifClases_E_F_G = unique(YTrain_E_F_G);
                [Yp, d] = funcion_aplica_QDA(XTest, vectorMedias, matricesCovarianzas, probabilidadPriori, codifClases_E_F_G);
                % Yp = prediccion de Y, tenemos la codificacion
                posClaseOI = find(ismember(codifClases_E_F_G, Yp));
                % posClaseOI = find(ismember(codifClases_C_E_F_G, YiOI));
                claseOI = nombres_E_F_G.clases{posClaseOI};
                reconocimiento = ["Reconocimiento objeto: " claseOI];
                color = [0 0 255];
            end
    
            Ib = Ietiq == i;
        
            %% 6.1.- FIGURA DE IMAGEN DE ENTRADA CON EL OBJETO RESALTADO
            %% DONDE EL TÍTULO HAGA CONSTAR EL RECONOCIMIENTO
        
            figure,
            subplot(1,2,1), funcion_visualiza(I, Ib, color, true);
            title(reconocimiento)
            
            load("DatosGenerados\conjunto_datos_estandarizados.mat")
            load("DatosGenerados\nombresProblema.mat")
    
            subplot(1,2,2) % A - D
            funcion_representa_datos_dato(Z, Y, espacioCcas, nombresProblema, Xi)  
    
        end
    
        
    
        %% 6.2.- En el caso de tratar con espacios de características de dos o tres dimensiones, REPRESENTACIÓN DE LA INSTANCIA DE TEST, JUNTO CON LAS %% DE TRAIN EN EL ESPACIO DE CARACTERÍSTICAS UTILIZADO. SI LA TÉCNICA DE
        %% CLASIFICACIÓN UTILIZA UN CLASIFICADOR MÍNIMA DISTANCIA,
        %% PUEDE REQUERIRSE LA REPRESENTACIÓN DE LA FRONTERA DE SEPARACIÓN
    
    %     Ventana donde se representen los valores de los descriptores del 
    % conjunto de entrenamiento utilizados para reconocer el objeto y los del 
    % objeto en cuestión (sólo cuando la clase del objeto a analizar NO sea 
    % Letra B). Cuando la dimensión sea superior a 3, el espacio de 
    % características de la representación estará definido por los 3 primeros 
    % descriptores.
        
    %     subplot(1,2,2) % A - D
    %     X = XTrain_ACD_EFG; Y = YTrain_ACD_EFG;
    %     coeficientes = coeficientes_ACD_EFG;
    %     nombres = nombres_ACD_EFG; 
    %     nombreClases{1}='ACD'; % 1
    %     nombreClases{2} = 'EFG'; % 2
    %     nombres.clases = nombreClases;
    %     funcion_representa_muestras_clasificacion_binaria_con_frontera(X, Y, nombres, coeficientes);
    %     XiOI = Xi(1, espacioCcas_ACD_EFG);
    %     hold on, plot3(XiOI(1), XiOI(2), XiOI(3), 'ok')
    end
    
    rmpath('Funciones')



end

