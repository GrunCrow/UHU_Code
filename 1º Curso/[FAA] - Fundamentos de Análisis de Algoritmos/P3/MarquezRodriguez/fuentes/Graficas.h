/*
 * Clase Graficas, contiene métodos para guardar las gráficas de los resultados, es decir, crea
 * los ficheros por lo lotes (comandos) para generar los ficheros gráficos que corresponda.
 */
#ifndef _GRAFICA
#define _GRAFICA
#include <string>
#include <iostream>
using namespace std;

class Graficas
{
public:
/*
 * Método generarGraficaMEDIO, genera el fichero de comandos para GNUPlot y dibuja la gráfica
 * del caso medio de un método de ordenación y su ajuste a la función correspondiente.
 * param metodo: metodo de ordenacion.
 * param orden: Orden del metodo de ordenacion.
 */
	void 	generarGraficaMEDIO(string metodo,int orden);

/*
 * Método generarGraficaCMP, genera el fichero de comandos para GNUPlot.
 * param nombre1: es el nombre del fichero de datos del primer método de ordenación
 * param nombre2: es el nombre del fichero de datos del segundo método de ordenación
 */
	void generarGraficaCMP(string metodo1,string metodo2);
	void generarGraficaCMPtres(string metodo1,string metodo2,string metodo3);
};
#endif
