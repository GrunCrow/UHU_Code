clear, clc, close all

nombreImagen = "ImagenesLetras/ImagenesTest/B3.tif";
addpath("Funciones")

Funcion_Reconoce_Letra_KNN_LDA_QDA(nombreImagen)

rmpath("Funciones")