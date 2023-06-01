clear, clc, close all

rutaFicheroImagen = "ImagenesFormas/Test/Test1.JPG";
addpath("Funciones")

Funcion_Reconoce_Forma_LDA_KNN(rutaFicheroImagen)

rmpath("Funciones")