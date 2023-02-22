#include <iostream>
#include <cstdlib>
#include "grafo.h"
#include "conjunto.h"
#include <map>


using namespace std;

//Ejercicio 2 (Grupo L1 Jueves 8:30)
template <typename T,typename U>
int numCaminos(const Grafo<T,U>& G, const T& v1, const T& v2)
{
    //diccionario para controlar vertices ya visitados
    map<T,bool> visitados;
    int ncaminos=0;
    //inicializar diccionario de visitados a false
    Conjunto<Vertice<T> > cv = G.vertices();
    while(!cv.esVacio()){
        visitados[cv.quitar().getObj()]=false; //quito el objeto, lo inserto y le pongo el valor false
    }

    //llamada a la función recursiva
    return numCaminos(G, v1,v2,visitados,ncaminos);

}

template <typename T,typename U>
int numCaminos(const Grafo <T,U>& G, const T& v1, const T& v2,map<T,bool> visitados,int &ncaminos){ //para que ncaminos se modifique

    //vertice visitado a true (actual)
    visitados[v1]=true;

    if(v1==v2){
        ncaminos++; //se ha llegado al vertice, es un camino
    }
    else{
        Conjunto<Vertice<T>> ady = G.adyacentes(v1);
        while(!ady.esVacio()){
            T u = ady.quitar().getObj();//siguiente vertice
            if(!visitados[u]){ //si no visitado
                numCaminos(G, u,v2,visitados,ncaminos);
            }
        }
    }
    return ncaminos;

}
//********************************************************************//
int main()
{
    Grafo<int, float> G(7);
    for (int i = 1; i <= 7; i++) G.insertarVertice(i);
    G.insertarArista(2, 1, 4);
    G.insertarArista(1, 3, 3);
    G.insertarArista(1, 4, 2);
    G.insertarArista(1, 6, 1);
    G.insertarArista(6, 4, 5);
    G.insertarArista(4, 7, 4);
    G.insertarArista(4, 5, 3);
    G.insertarArista(5, 1, 6);



    cout<<" PRUEBA II ** GRUPO L1: Jueves 8:30 ** "<< endl << endl;

    cout << endl << " Numero de Caminos simples en G - desde vertice 1 al 5: " <<  numCaminos(G, 1, 5) <<endl;

    system("PAUSE");
    return 0;
}
