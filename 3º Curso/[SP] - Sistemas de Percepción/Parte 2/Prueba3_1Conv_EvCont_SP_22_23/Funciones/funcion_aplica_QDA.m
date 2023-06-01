function [YQDA,d] = funcion_aplica_QDA(X,vectorMedias,matricesCovarianzas,probabilidadPriori,valoresClases)

    [numMuestras,numDescriptores] = size(X);
    numClases = length(valoresClases);
    YQDA = zeros(numMuestras,1);
    
    % Necesitamos una variable simbólica por cada descriptor del problema.
    
    x_sym = [];
    for i = 1:numDescriptores
        char = strcat('X',int2str(i));
        var = sym(char,'real');
        x_sym = [x_sym;var];
    end
    
    % Necesitamos una función de decisión por cada una de las clases del
    % problema.
    d = sym(zeros(1,numClases));
    for i = 1:numClases
        d(i)= -0.5 * (x_sym-vectorMedias(:,i))' * pinv(matricesCovarianzas(:,:,i)) * (x_sym-vectorMedias(:,i)) - 0.5 * log(det(matricesCovarianzas(:,:,i))) + log(probabilidadPriori(i));    
    end
    
    
    % Por cada función de decisión, evaluamos con los valores de X y escogemos
    % la clase de la mayor de ellas. Esa será la clase a la que pertenece el
    % objeto que estamos analizando.
    
    for i = 1:numMuestras
        ecuacion= expand( subs( d',x_sym,X(i,:)' ) );
        [~,claseMax]=max(ecuacion);
        YQDA(i) = valoresClases(claseMax);
    end

end
