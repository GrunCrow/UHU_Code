matriz_transformacion = Desplazamiento(5,5,5)*Rotaciony(pi/4)*Rotacionz(-pi/4)*Desplazamiento(0,5,0)

pinta_bloque(matriz_transformacion, 'b')

punto = [1.5 1.5 6 1]';

punto_global = matriz_transformacion * punto

plot3(punto_global(1),punto_global(2), punto_global(3),'*r')

