/*
 * Clase AlgoritmosOrdenacion que implementa los Algoritmos de Ordenación para ordenar un vector de enteros en orden descendente.
 * Define las implementaciones de los siguientes métodos de Ordenación en vectores:
 *	- Burbuja
 *	- Inserción
 *	- Selección.
 */

#include "AlgoritmosOrdenacion.h"

AlgoritmosOrdenacion :: AlgoritmosOrdenacion() {}
AlgoritmosOrdenacion :: ~AlgoritmosOrdenacion(){}

/*
 * método ordenaBurbuja, implementa el método de ordenación Burbuja.
 * param v: el array de enteros a ordenar
 * param size: tamaño del array de enteros a ordenar
 */

void AlgoritmosOrdenacion :: ordenaBurbuja(int v[], int size)
{
    //adaptamos pseudocódigo a c++
    int aux; //variable auxiliar para reordenar

    for(int i=size-2;i>=0; i--){ //bucle va de 1 a n-1, en c++ empezamos en 0 así que sería n-2
        for(int j=0;j<=i;j++){
            if(v[j]>v[j+1]){
                aux=v[j];
                v[j]=v[j+1];
                v[j+1]=aux;
            }
        }
    }
}


/*
 * método ordenaInsercion, implementa el método de ordenación por Inserción-
 * param v: el array de enteros a ordenar
 * param size: tamaño del array de enteros a ordenar
 */

void AlgoritmosOrdenacion :: ordenaInsercion(int v[], int size)
{
    int j,x;

    for(int i=1;i<size;i++){
        x=v[i];
        j=i-1;
        while(j>=0 && x<v[j]){
            v[j+1]=v[j];
            j=j-1;
        };
        v[j+1]=x;
    }
}

/*
 * método ordenaSeleccion, implementa el método de ordenación por Selección.
 * param v: el array de enteros a ordenar
 * param size: tamaño del array de enteros a ordenar
 */
void AlgoritmosOrdenacion :: ordenaSeleccion(int v[], int size)
{
    for(int i=0;i<size;i++){
        int posminimo=i;
        for(int j=i+1;j<size;j++){
            if(v[j]<v[posminimo]){
                posminimo=j;
            }
        }
        int aux=v[posminimo];
        v[posminimo]=v[i];
        v[i]=aux;
    }
}
//** ESCRIBIR PARA COMPLETAR LA PRACTICA **//

void AlgoritmosOrdenacion::QuickSort(int v[], int p, int r){
    int q;
    if (p<r){
        q = Partition(v,p,r);
        QuickSort(v,p,q);
        QuickSort(v,q+1,r);
    }
}

int AlgoritmosOrdenacion::Partition(int v[], int p, int r){
    int piv,i,j;
    piv=v[p];
    i=p-1;
    j=r+1;
    int aux;
    do{
        do{
            j=j-1;
        }while(v[j]>piv);
        do{
            i=i+1;
        }while(v[i]<piv);
        if(i<j){
            aux=v[i];
            v[i]=v[j];
            v[j]=aux;
        }
    }while(i<j);

    return j;
}

void AlgoritmosOrdenacion::ordenaQuickSort(int v[], int size){
    QuickSort(v, 0, size-1);
}
