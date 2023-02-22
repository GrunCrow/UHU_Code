function mapa_out=pinta_robot_v0(x,y,theta,alfa,distancia,mapa)

%-------------------------------------------------
% función para pintar el robot y el mapa versión 0
%               19/10/22 FGB
%-------------------------------------------------

persistent robot cabeza

if isempty(robot)
    robot = hgtransform;
end

if isempty(cabeza)
    cabeza = hgtransform('Parent',robot);
end



M = makehgtform('translate',[x y 0], 'zrotate',theta);
robot.Matrix=M;

%cuerpo del robot
R=rectangle('Position',[-1.5 -1.5 3 3],'Parent',robot);
R.LineWidth=2;

%ruedas
rueda_derecha=hgtransform('Parent',robot);
rd=rectangle('Position',[-0.5 -0.1 1 0.2],'Parent',rueda_derecha);
% Cambiando los valores se mueven desde el centro del SR principal X Y Z
% unidades
M = makehgtform('translate',[0 -1 0]);
rueda_derecha.Matrix=M;

rueda_izquierda=hgtransform('Parent',robot);
ri=rectangle('Position',[-0.5 -0.1 1 0.2],'Parent',rueda_izquierda);
M = makehgtform('translate',[0 1 0]);
rueda_izquierda.Matrix=M;


%cabeza del robot

ca=rectangle('Position',[-0.25 -0.5 0.5 1],'Parent',cabeza);
M = makehgtform('translate',[1 0 0],'zrotate',alfa);
cabeza.Matrix=M;

punto_local=[5 0 0 1]'; % traspuesta porq es una matriz columna y hemos escrito sin ; osea q es una horizonta

Mt=robot.Matrix*cabeza.Matrix;

punto_global = Mt * punto_local

axis([-10 10 -10 10]);

d = animatedline(double(punto_global(1,1)), double(punto_global(2,1)),'Marker','*','LineStyle','none','Color',[0 0 1]);

mapa_out=mapa;


end
