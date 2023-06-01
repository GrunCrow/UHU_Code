clear, clc, close all

nombreImagen = "ImagenesLetras/ImagenesTest/G3.tif";
addpath("Funciones")

Funcion_Reconoce_Forma_KNN_LDA_QDA(nombreImagen)

rmpath("Funciones")