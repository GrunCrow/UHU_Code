matriz_pinza=eye(4,4) % matriz unidad
q=[0 -1.5700 -1.5700 -1.5700 1.5700 0];

matriz=funcion_pinta_UR3_new(q, matriz_pinza) 


% =====================================================================

alfa=pi/4; beta=0; gamma=0; % Angulos de Euler
posicion= [20 -10 0];
matriz_pieza=Desplazamiento(posicion(1), posicion(2), posicion(3))*Rotacionz(alfa)*Rotaciony(beta)*Rotacionx(gamma);
matriz_pinza=eye(4,4); % matriz unidad


pinta_bloque(matriz_pieza,'b')
matriz_agarre = Desplazamiento(0,0,4)*Rotacionx(pi/2)*Rotacionx(pi/2)
matriz_pinza_global = matriz_pieza*matriz_agarre;


q=[0 -1.5700 -1.5700 -1.5700 1.5700 0];
matriz=funcion_pinta_UR3_new(q, matriz_pinza_global);

% =====================================================================

alfa=pi/4; beta=0; gamma=0; % Angulos de Euler
matriz_pieza=Desplazamiento(posicion(1), posicion(2), posicion(3))*Rotacionz(alfa)*Rotaciony(beta)*Rotacionx(gamma);
matriz_pinza=eye(4,4); % matriz unidad
posicion=[20 -10 0];

pinta_bloque(matriz_pieza,'b')
matriz_agarre = Desplazamiento(0,0,4)*Rotacionx(pi/2)*Rotacionz(pi/2);
matriz_pinza_global = matriz_pieza*matriz_agarre;


q=[0 -1.5700 -1.5700 -1.5700 1.5700 0];
matriz=funcion_pinta_UR3_new(q, matriz_pinza_global);