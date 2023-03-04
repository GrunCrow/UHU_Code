numElem = 10;
valorRef = 5;
V = round(10*rand(1,numElem));
% b) Genera un vector binario donde el 1 binario señala a los elementos
% del vector que son menores o iguales a 5.
Vb = false(1, numElem);

for i = 1:numElem
    if V(i) < valorRef
        Vb(i) = true;
    end
end

% c) Encuentra con la función find las posiciones en el vector de esos elementos

find(Vb == true);

% d) Encuentra la posición del valor máximo de V

find(V == max(V));

% e) Ordena los elmentos del vector, de mayor a menor, obteniendo las
% posiciones donde se encuentran en V

V_ord = zeros(1, numElem);

for i = 1:numElem
    V_ord(i) = max(V);
    aux = find(V == max(V));
    
    V(aux(1)) = [];
    
end