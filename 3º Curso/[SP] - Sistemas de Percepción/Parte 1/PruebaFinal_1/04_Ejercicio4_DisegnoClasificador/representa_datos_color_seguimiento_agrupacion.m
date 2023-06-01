function representa_datos_color_seguimiento_agrupacion(xColor,idx)

numAgrup = unique(idx);

for i=1:max(numAgrup)
    ValoresColorR = xColor(idx == i,1);
    ValoresColorG = xColor(idx == i,2);
    ValoresColorB = xColor(idx == i,3);

    plot3(ValoresColorR,ValoresColorG,ValoresColorB,'.', 'Color',  rand(1,3)), grid on, hold on;
    xlabel('Rojo','Color','r'); ylabel('Verde','Color','g'); zlabel('Azul','Color','b'); 
    axis([0 255 0 255 0 255]);
end

  
    
end