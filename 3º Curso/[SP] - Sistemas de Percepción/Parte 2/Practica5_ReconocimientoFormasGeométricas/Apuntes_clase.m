pathMain = "Parte 2/Practica5_ReconocimientoFormasGeométricas";

pathArchivos = pathMain + "MaterialFacilitado/"

addpath(pathArchivos + "Funciones");
addpath(pathArchivos + "Imagenes");

nombreClases = ["Cuadrados", "Triangulos"];

numClases = length(nombreClases);

codifClases = [1, 2];

for i = 1:numClases
    nombreImagen = [nombreClases{i} '.jpg'];
    I = imread(nombreImagen);
    %     Método de OTSU
    Ib = I < 255*graytresh(I);

    figure, imshow(Ib);

    [Ietiq, N] = bwlabel(Ib);

    Ximagen = funcion_calcula_descriptores_extent_hu_imagen(Ietiq, N);
    Yimagen = codifClases(i)*ones(N, 1);

    X = [X; Ximagen];
    Y = [Y; Yimagen];

end

nombresProblema.clases = nombreClases;
nombresProblema.descriptores = ["Extent", "Hu1", "Hu2", "Hu3", "Hu4", "Hu5"];
nombresProblema.simbolos = ["*b", "+r"];

espacioCcas = [4, 6, 7];
funcion_representa_datos(X, Y, espacioCcas, nombreProblema);