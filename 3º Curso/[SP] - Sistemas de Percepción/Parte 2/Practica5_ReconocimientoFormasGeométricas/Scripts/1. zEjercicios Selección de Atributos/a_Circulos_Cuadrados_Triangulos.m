pathMain = "Parte 2/Practica5_ReconocimientoFormasGeométricas/";

addpath(pathMain + 'DatosGenerados')
addpath(pathMain + 'Funciones')
load conjunto_datos_estandarizados.mat
load nombresProblema.mat

XoI = Z;
YoI = Y;

[espacioCcas,JespacioCcas] = funcion_selecciona_vector_ccas(XoI,YoI,3);
funcion_representa_datos(XoI,YoI,espacioCcas,nombresProblema)

save(pathMain + "Scripts/1.2. Ejercicios Selección de Atributos/DatosGenerados/espacioCcasCCT.mat","espacioCcas")

rmpath(pathMain + 'DatosGenerados')
rmpath(pathMain + 'Funciones')