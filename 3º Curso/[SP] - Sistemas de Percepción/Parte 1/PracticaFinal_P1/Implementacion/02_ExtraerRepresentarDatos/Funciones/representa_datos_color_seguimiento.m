function representa_datos_color_seguimiento(X, Y)

%     % Representación de los datos.
%     datosRGBColor = X_Color(Y_Color==1,:);
%     datosRGBFondo = X_Color(Y_Color==0,:);
%     
%     plot3(datosRGBColor(:,1),datosRGBColor(:,2),datosRGBColor(:,3),'.r'), hold on;
%     plot3(datosRGBFondo(:,1),datosRGBFondo(:,2),datosRGBFondo(:,3),'.b'), grid on;
%     xlabel('Rojo','Color','r'); ylabel('Verde','Color','g'); zlabel('Azul','Color','b');

    ValoresColorR = X(Y==1,1);
    ValoresColorG =X(Y==1,2);
    ValoresColorB =X(Y==1,3);

    plot3(ValoresColorR,ValoresColorG,ValoresColorB,'.r'), grid on;
    xlabel('Rojo','Color','r'); ylabel('Verde','Color','g'); zlabel('Azul','Color','b'); 
    axis([0 255 0 255 0 255]);
