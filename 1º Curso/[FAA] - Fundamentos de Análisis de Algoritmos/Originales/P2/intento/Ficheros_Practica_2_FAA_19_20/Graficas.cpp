/*
 * Clase Graficas, contiene m�todos para guardar las gr�ficas de los resultados, es decir, crea
 * los ficheros por lo lotes (comandos) para generar los ficheros gr�ficos que corresponda.
 */
#include "Graficas.h"
#include "Constantes.h"
#include <fstream>
#include <iostream>
using namespace std;

 /*
  * M�todo generarGraficaMEDIO, genera el fichero de comandos para GNUPlot y dibuja la gr�fica
  * del caso medio de un m�todo de ordenaci�n y su ajuste a la funci�n correspondiente.
  * param metodo: metodo de ordenacion.
  * param orden: Orden del metodo de ordenacion.
  */
void Graficas::generarGraficaMEDIO(string nombre_metodo,int orden)
{
    ofstream f((nombre_metodo+".dat").c_str());
    f<<"#ESTE ES UN SCRIPT DE GNUPLOT PARA ESTUDIO DE 1 METODO"<<endl;
    f<<"set title \""<<nombre_metodo<<"\""<<endl;
    f<<"set key top left vertical inside"<<endl;
    f<<"set grid"<<endl;
    f<<"set xlabel \"Talla (n)\""<<endl;
    f<<"set ylabel \"Tiempo (ms)\""<<endl;
    if(orden==CUADRADO){
        f<<"N(x) = a*x*x + b*+c"<<endl;
    }
    else if (orden==NlogN){
        f<<"N(x) = a*x*x + b*+c"<<endl; //poner en orden logaritmico
    }
    f<<"fit N(x) \""<<nombre_metodo<<+".dat" << "\" using 1:2 via a,b,c"<<endl;
    f<<"plot \""<<nombre_metodo<<+".dat" << "\" using 1:2  title \""<<nombre_metodo<< "\", N(x)"<<endl;
    f<<"set terminal pdf"<<endl;
    f<<"set output \""<<nombre_metodo<<+".pdf\""<<endl;
    f<<"replot"<<endl;
    f<<"pause 5 \"Pulsa Enter para continuar...\""<<endl;
}

/*
 * M�todo generarGraficaCMP, genera el fichero de comandos para GNUPlot.
 * param nombre1: es el nombre del fichero de datos del primer m�todo de ordenaci�n
 * param nombre2: es el nombre del fichero de datos del segundo m�todo de ordenaci�n
 */
void  Graficas::generarGraficaCMP(string nombre1,string nombre2)
{
//** ESCRIBIR PARA COMPLETAR LA PRACTICA **//
}
