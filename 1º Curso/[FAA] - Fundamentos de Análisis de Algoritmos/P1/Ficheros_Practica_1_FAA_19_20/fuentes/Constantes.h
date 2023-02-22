/* 
 *Definiciones de las Constantes 
 */
#ifndef _CONSTANTES
#define _CONSTANTES

/* Constantes simbólicas para indicar los casos del metodo de Busqueda SECUENCIAL*/
enum algoritmosBusquedaCasos{SECUENCIALPEOR, SECUENCIALMEDIO, SECUENCIALMEJOR};

/* Constantes para indicar el Orden del Algoritmo */
enum ordenes {CTE,N};

/* Constantes para indicar el Numero de repeticiones para el caso medio de cada Algoritmo */
static const int NUMREPETICIONES=1000;

/* Constantes para indicar la variacion de las tallas del vector */
enum valoresTallas { tallaIni = 100,tallaFin = 1000,incTalla = 100};

#endif