alfa=0; beta=0; gamma=0; % Angulos de Euler
posicion=[20 -10 0];

matriz_pieza=Desplazamiento(posicion(1), posicion(2), posicion(3))*Rotacionz(alfa)*Rotaciony(beta)*Rotacionx(gamma);
matriz_pinza=eye(4,4); % matriz unidad

pinta_bloque(matriz_pieza,'b')
%matriz_agarre = Desplazamiento(0,0,4)*Rotacionx(-pi/2)*Rotacionz(pi);
% linea de la actividad que se mandó en la semana anterior de rotacion y
% desplazamiento de la pinza:
matriz_agarre = Desplazamiento(0,-0.8,4)*Rotacionx(-pi/2)*Rotacionz(-pi/2)*Rotaciony(pi); % *Rotaciony(pi/2)*Rotacionx(-pi/2)
matriz_pinza = matriz_pieza*matriz_agarre;

codo = 1
avance = 1
simetrico = 0

[q1 q2 q3 q4 q5 q6] = inv_kinema_ur3_new(matriz_pinza, codo, avance, simetrico)

matriz=funcion_pinta_UR3_new([q1 q2 q3 q4 q5 q6], matriz_pinza);