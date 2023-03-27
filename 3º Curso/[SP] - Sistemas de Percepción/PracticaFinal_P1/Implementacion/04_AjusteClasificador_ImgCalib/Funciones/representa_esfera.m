function representa_esfera(centroide, Radio)

    Rc = centroide(1);
    Gc = centroide(2);
    Bc = centroide(3);
    
    [R,G,B] = sphere(100);
    % Matrices de puntos de una esfera centrada en el origen de radio
    x = Radio*R(:)+Rc; y = Radio*G(:)+Gc; z = Radio*B(:)+Bc;
    plot3(x,y,z, '.y')
    
end