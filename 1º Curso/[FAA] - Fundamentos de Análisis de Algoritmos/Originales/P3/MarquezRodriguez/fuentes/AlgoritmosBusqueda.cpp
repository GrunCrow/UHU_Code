
/*
 * Clase AlgoritmosBusqueda que implementa los Algoritmos de Búsqueda para buscar un elemento en un vector de enteros.
 * Define las implementaciones iterativas de los siguientes métodos de búsqueda en vectores de enteros en orden creciente:
 *	- Secuencial
 *	- Binaria o dicotómica
 *  - Interpolacion
 */

#include "AlgoritmosBusqueda.h"

/*
 * Implementación de los métodos de la clase AlgoritmosBusqueda
 */
AlgoritmosBusqueda::AlgoritmosBusqueda() { }
AlgoritmosBusqueda:: ~AlgoritmosBusqueda() { }

/*
	 * Función busquedaSecuencialIt, implementa el método de búsqueda secuencial Iterativo
	 * param v: el array de enteros donde buscar
	 * param size: tamaño del array
	 * param key: clave o elemento a buscar
	 * return posición de la clave en el array
	 */
int AlgoritmosBusqueda::busquedaSecuencialIt(int v[], int size,int key)
{
   //** ESCRIBIR PARA COMPLETAR LA PRACTICA **//
	int i=0;
	while(v[i]!= key && i<size){
        i++;
    }

    if(v[i]!=key)
        i=-1;

	return i;
}

/*
	 * Función busquedaBinariaIt, implementa el método de búsqueda binaria Iterativa
	 * param v: el array de enteros donde buscar
	 * param size: tamaño del array
	 * param key: clave o elemento a buscar
	 * return posición de la clave en el array
	 */

int AlgoritmosBusqueda::busquedaBinariaIt(int v[], int size,int key)
{
	//** ESCRIBIR PARA COMPLETAR LA PRACTICA **//
	bool encontrado=false;
	int mitad, primero=0, ultimo=size-1;

    while(primero<=ultimo && !encontrado){
        mitad=((ultimo+primero)/2);
        if(key==v[mitad])
            encontrado=true;
        else{
            if(key<v[mitad])
                ultimo=mitad-1;
            else{
                if(key>v[mitad])
                    primero=mitad+1;
            }
        }
    }
    if(!encontrado)
        mitad=-1;

	return mitad;
}

/*
 * Función busquedaInterpolacionIt, implementa el método de búsqueda binaria Recursivo
 * param v: el array de enteros donde buscar
 * param size: tamaño del array
 * param key: clave o elemento a buscar
 * return posición de la clave en el array
 */

int AlgoritmosBusqueda::busquedaInterpolacionIt(int v[], int size,int key)
{
	//** ESCRIBIR PARA COMPLETAR LA PRACTICA **//
	int p, primero=0, ultimo=size-1;

	while((v[ultimo]>=key) && (v[primero]<key)){
        p=primero+(((ultimo-primero)*(key-v[primero]))/(v[ultimo]-v[primero]));
        if(key>v[p])
            primero=p+1;
        else{
            if(key<v[p])
                ultimo=p-1;
            else
                primero=p;
        }
	}

	if(v[primero]!=key)
        primero=-1;

	return primero;
}
