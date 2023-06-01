function [vectorMedias,matricesCovarianzas, probabilidadPriori] = funcion_ajusta_QDA(X,Y)

    valoresUnicos = unique(Y);
    numClases = length(valoresUnicos);
    [numDatos,numAtributos] = size(X);
    
    % Para calcular el vector de medias, inicializamos un vector columnas e Y
    % filas.
    
    vectorMedias = zeros(numClases,numAtributos)';
    probabilidadPriori = zeros(numClases,1);
    matricesCovarianzas = zeros(numAtributos,numAtributos,numClases);
    
    % Para cada clase, calcularemos su media, su matriz de covarianzas y su
    % probabilidad a priori.
    aux = zeros(numAtributos);
    for i=1:numClases
    
        XoI = X(Y==valoresUnicos(i),:);
        vectorMedias(:,i) = mean(XoI);
        matricesCovarianzas(:,:,i) = cov(XoI);
    
        NumDatosClase = size(XoI,1);
        probabilidadPriori(i) = NumDatosClase/numDatos;
    
    end

end
