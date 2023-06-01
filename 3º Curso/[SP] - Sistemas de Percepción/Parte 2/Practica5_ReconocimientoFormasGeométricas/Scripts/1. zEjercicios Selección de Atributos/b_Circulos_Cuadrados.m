pathMain = "Parte 2/Practica5_ReconocimientoFormasGeométricas/";

addpath(pathMain + 'DatosGenerados')
addpath(pathMain + 'Funciones')
load conjunto_datos_estandarizados.mat
load nombresProblema.mat

% La codificación de los circulos es 1, la de los cuadrados es 2
XoI = Z;
YoI = Y;
XoI = XoI((YoI==1 | YoI == 2),:);
YoI = YoI(YoI==1 | YoI == 2);

nombresProblema.clases = {'Circulo', 'Cuadrado'};
[espacioCcas,JespacioCcas] = funcion_selecciona_vector_ccas(XoI,YoI,3);
funcion_representa_datos(XoI,YoI,espacioCcas,nombresProblema);

save(pathMain + "Scripts/1.2. Ejercicios Selección de Atributos/DatosGenerados/espacioCcasCC.mat","espacioCcas")

rmpath(pathMain + 'DatosGenerados')
rmpath(pathMain + 'Funciones')