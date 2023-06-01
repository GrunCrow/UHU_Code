function representa_datos_color_seguimiento_fondo(X,Y)

ValoresColorR = X(Y==1,1);
ValoresColorG =X(Y==1,2);
ValoresColorB =X(Y==1,3);

ValoresFondoR = X(Y==0,1);
ValoresFondoG =X(Y==0,2);
ValoresFondoB =X(Y==0,3);
  
    plot3(ValoresColorR,ValoresColorG,ValoresColorB,'.r'), hold on;
    plot3(ValoresFondoR,ValoresFondoG,ValoresFondoB,'.b'), grid on;
    xlabel('Rojo','Color','r'); ylabel('Verde','Color','g'); zlabel('Azul','Color','b'); 
    axis([0 255 0 255 0 255]);
end