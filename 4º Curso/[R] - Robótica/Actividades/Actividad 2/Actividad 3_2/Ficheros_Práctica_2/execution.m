%% Iniciar Robot
codigo=1; 
Identificador = Iniciacion('RBDK',codigo); 

%% Posicion Inicial
% Robot vuelve a posicion inicial
Ready_lab(Identificador,codigo);

%% Configuracion Pick
posicion=[20 -10 0];

alfa=0;
beta=0;
gamma=0; % Angulos de Euler

matriz_pieza=Desplazamiento(posicion(1), posicion(2), posicion(3))*Rotacionz(alfa)*Rotaciony(beta)*Rotacionx(gamma);
matriz_pinza=eye(4,4); % matriz unidad

%matriz_agarre = Desplazamiento(0,0,4)*Rotacionx(-pi/2)*Rotacionz(pi);
% linea de la actividad que se mandó en la semana anterior de rotacion y
% desplazamiento de la pinza:

matriz_agarre = Desplazamiento(0,-0.8,4)*Rotacionx(-pi/2)*Rotacionz(pi/2); % *Rotaciony(pi/2)*Rotacionx(-pi/2)
% matriz_agarre = Desplazamiento(0,0,4)*Rotacionz(pi/4)*Rotacionz(-pi/2)*Desplazamiento(0,5,0)

matriz_pinza = matriz_pieza*matriz_agarre;

codo = 1
avance = 1
simetrico = 0

[q1 q2 q3 q4 q5 q6] = inv_kinema_ur3_new(matriz_pinza, codo, avance, simetrico)

%% Mover Robot
% angulos
angulos = [q1 q2 q3 q4 q5 q6];
aceleracion = 1;
velocidad = 1;
codigo = 1;

% mover robot a y con los parametros introducidos previamente
MoveJ_Robot_lab(angulos, aceleracion, velocidad, Identificador, codigo)

%% Acciona la pinza
codigo = 1;

RG2_lab(20,Identificador, codigo)

%% Configuracion de place

posicion=[20 10 0];

alfa=0;
beta=0;
gamma=0; % Angulos de Euler

matriz_pinza = matriz_pieza*matriz_agarre;

[q1 q2 q3 q4 q5 q6] = inv_kinema_ur3_new(Desplazamiento(0,5,0)*matriz_pinza, codo, avance, simetrico)

%% Mover Robot
% angulos
angulos = [q1 q2 q3 q4 q5 q6];
aceleracion = 1;
velocidad = 1;
codigo = 1;

% mover robot a y con los parametros introducidos previamente
MoveJ_Robot_lab(angulos, aceleracion, velocidad, Identificador, codigo)

%% Desacciona la pinza
codigo = 1;

RG2_lab(100,Identificador, codigo)