function idx = funcion_calcula_agrupacion(Xo,centroides)
    
    vDistancia = zeros(size(centroides,1),size(Xo,1));
    idx = zeros(size(Xo,1),1);
    for j=1:size(centroides,1)
        for i=1:size(Xo,1)
            vDistancia(j,i) = distancia(Xo(i,:),centroides(j,:));
        end
    end

    [~,pos] = min(vDistancia);
    idx = pos';
end