/*
 * Clase AlgoritmosOrdenacion que define los Algoritmos de Ordenación para ordenar un vector de enteros en orden descendente.
 * Define las implementaciones de los siguientes métodos de Ordenación en vectores: 
 *	- Burbuja
 *	- Inserción
 *	- Selección.
 */
#ifndef _ORDENACION
#define _ORDENACION

/*
 * declaración de la clase AlgoritmosOrdenacion
 */
class AlgoritmosOrdenacion
{  
public:
    AlgoritmosOrdenacion();
    ~AlgoritmosOrdenacion();
	
	/*
	 * método ordenaBurbuja, implementa el método de ordenación Burbuja.
	 * param v: el array de enteros a ordenar
	 * param size: tamaño del array de enteros a ordenar
	 */
   void ordenaBurbuja(int v[], int size);

	/*
	 * método ordenaInsercion, implementa el método de ordenación por Inserción.
	 * param v: el array de enteros a ordenar
	 * param size: tamaño del array de enteros a ordenar
	 */
    void ordenaInsercion(int v[], int size);

	/*
	 * método ordenaSeleccion, implementa el método de ordenación por Selección.
	 * param v: el array de enteros a ordenar
	 * param size: tamaño del array de enteros a ordenar
	 */
    void ordenaSeleccion(int v[], int size);
};
			
#endif