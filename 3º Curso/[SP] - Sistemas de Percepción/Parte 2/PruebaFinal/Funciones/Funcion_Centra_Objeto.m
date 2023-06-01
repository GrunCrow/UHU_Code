
function cm = Funcion_Centra_Objeto(bw)

% Entrada: matriz logica con un objeto en 1 binario
% Salida: matriz logica con el objeto centrado

[f , c]= find(bw==1);
fmin = min(f); fmax = max(f);
cmin = min(c); cmax = max(c);

bwObj = bw(fmin:fmax,cmin:cmax);
[N , M] = size(bwObj);

stats = regionprops(bwObj,'Centroid');
% Asumimos que solo hay un objeto
centroides = cat(1,stats.Centroid);
x = round(centroides(1,1));
y = round(centroides(1,2));

DifF1 = length(1:y-1); DifF2 = length(y+1:N);
DifF = DifF1-DifF2;
if DifF<0 % Añadimos la diferencia arriba
    bwObj = [false(abs(DifF),M) ; bwObj];
elseif DifF>0
    bwObj = [bwObj ; false(DifF,M) ];
end

DifC1 = length(1:x-1); DifC2 = length(x+1:M);
DifC = DifC1-DifC2;
if DifC<0 % Añadimos la diferencia a la izda
    bwObj = [false(N+abs(DifF),abs(DifC)) bwObj];
elseif DifC>0
    bwObj = [bwObj false(N+abs(DifF),abs(DifC))];
end

[N , M] = size(bwObj);

% La hacemos cuadrada
Dif = N-M;
if Dif>0 % Hay más filas que columnas. Insertamos esas columnas
    NumColumnasIzda = floor(Dif/2);
    NumColumnasDcha = Dif-NumColumnasIzda;
    cm = [false(N,NumColumnasIzda)  bwObj  false(N,NumColumnasDcha)];
elseif Dif<0 % Hay más columnas. Insertamos filas
    NumFilasArriba = floor(abs(Dif)/2);
    NumFilasAbajo = abs(Dif)-NumFilasArriba;
    cm = [false(NumFilasArriba,M) ; bwObj ; false(NumFilasAbajo,M)];
else
    cm = bwObj;
end
    
Inc = min(floor(N/2),floor(M/2));

cm = padarray(cm,[Inc Inc]);

end


