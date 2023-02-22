#include <iostream>
#include <cstdlib>
#include "grafo.h"
#include "conjunto.h"
#include <map>


using namespace std;

//Ejercicio 1 (Grupo L1 Jueves 8:30)
template <typename T,typename U>
T verticeMaxConexion(const Grafo<T,U>& G)
{
    //creacion variable auxiliar para guardar el maximo:
    int maxi=0;
    T maxiV;
    //creacion de diccionario
    map<T,int> conexiones;

    //inicializar diccionario (a 0)
    Conjunto<Vertice<T> > cv = G.vertices();

    while(!cv.esVacio()){
        T tmp = cv.quitar().getObj(); //getobj da el objeto (tipo T)
        conexiones[tmp]=0;
    }

    //calculo de conexiones de cada vértice
    Conjunto<Arista<T, float> > aristas = G.aristas();

    while(!aristas.esVacio()){
        Arista<T, float> tmp = aristas.quitar();
        conexiones[tmp.getOrigen()] += 1;
        conexiones[tmp.getDestino()] += 1;
    }

    //recorrido
    for(typename map<T,int>::iterator itConex = conexiones.begin(); itConex != conexiones.end(); itConex++){
        if(itConex->second > maxi){
            maxi=itConex->second;
            maxiV=itConex->first;
        }
    }

    return maxiV;
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

    cout << " Vertice de maxima conexion en G: " << verticeMaxConexion(G) << endl;


    system("PAUSE");
    return 0;
}
