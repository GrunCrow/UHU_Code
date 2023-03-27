    % calcula_datos_esfera(xColor,xFondo)
    % 1. Calcula el centroide de a nube de puntos del color de seguimiento
    % (Rcentro, Gcentro, Bcentro)
    % 2. Calcula los vectores distancias entre el centroide anterior y cada uno
    % de los puntos de xColor y xFondo-
    %   - Por una parte, los valores de distancia entre el centroide y las muestras del color del objeto dadas por xColor.
    %   - Por otra parte, los valores de distancia entre el centroide y las
    %   muestras de fondo dadas por xFondo.
    % 3. Calcular r1 y r2 a partir de los vectores distancia anteriores
    %       - r1: valor máximo de las distancias centroide-xColor
    %       - r2: valor mínimo de las distancias centroide-xFondo
    % 4. Calcular el radio de compromiso r12 (promedio de r1 y r2)
    % 5. Devolver datosEsfera = [Rc,Gc,Bc,r1,r2,r12]
    %
    %
    %% Para calcular distancia desde un punto a una nube de puntos...
    % Hacerlo matricialmente mejor que en un bucle. Para ello:
    % siendo P un punto y NP una nube de puntos de tamaño size(NP,2),
    % P = Xo(1,:)';
    % NP = Xo(1:5,:)';
    % vectorDistancia = zeros(1,size(NP,2));
    % Pamp = repmat(P,1,size(NP,2)); 
    % vectorDistancia = distancia(Pamp,NP);
    %
    
function [Rc,Gc,Bc,r1,r2,r12] = calcula_datos_esfera(xColor,xFondo)
    
    centroide = mean(xColor);
    Rc = centroide(1); Gc = centroide(2); Bc = centroide(3);
    
    centroide = centroide';
    xColor = xColor';
    xFondo = xFondo';
    % Calcular distancia del centroide hasta cada uno de los puntos del color
    % de seguimiento.
    
    vectorDistanciaC = zeros(1,size(xColor,2));
    centroide_ampliado = repmat(centroide,1,size(xColor,2));
    vectorDistanciaC = distancia(centroide_ampliado,xColor);
    
    r1 = max(vectorDistanciaC);
    
    % Calcular distancia del centroide hasta cada uno de los puntos del color
    % de fondo.
    
    vectorDistanciaF = zeros(1,size(xFondo,2));
    centroide_ampliado = repmat(centroide,1,size(xFondo,2));
    vectorDistanciaF = distancia(centroide_ampliado,xFondo);
    
    r2 = min(vectorDistanciaF);
    
    % Calculamos el radio intermedio
    
    r12 = mean([r1;r2]);

end