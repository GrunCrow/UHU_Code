%% Ejercicio 3

% 
% Teniendo en cuenta la muestra de la tabla diseñar un clasificador de
% mínima distancia de Mahalanobis estimando una única matriz de covarianzas
% para ambas clases. No considerar desbalanceo de clases.
% 
% 

x1 = sym('x1','real');
x2 = sym('x2','real');
X = [x1;x2];
datos_C1 = [ 2 3 3 4; 1 2 3 2];
datos_C2 = [ 6 5 7 ; 1 2 3];

M1 = mean(datos_C1')';
M2 = mean(datos_C2')';

% Como es un problema de clasificación debemos diseñar una función de
% decisión para cada clase (2 Clases)

% La distancia de mahalanobis utiliza una única matriz de covarianzas.
mCov1 = sym(cov(datos_C1'));
mCov2 = sym(cov(datos_C2'));

mCov = 1/5 * ((size(datos_C1',1)-1)*mCov1 +  (size(datos_C2',1)-1)*mCov2);

% DM =  - (X - Mk)' * pinv(mCov) * (X - Mk);

d1 =  expand(- (X - M1)' * pinv(mCov) * (X - M1));
d2 =  expand(- (X-M2)' * pinv(mCov) * (X-M2));

d12 = d1 - d2;

% Representación de los datos:
plot(datos_C1(1,:),datos_C1(2,:),'*r'), hold on
plot(datos_C2(1,:),datos_C2(2,:), '*b'), hold on
plot([0,10],[-7,13]) % Representa la línea dada por los puntos 
                     % (0,-7) y (10,13)
axis([0,10,0,10])