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

}



//Ejercicio 2 (Grupo L1 Jueves 8:30)
template <typename T,typename U>
int numCaminos(const Grafo<T,U>& G, const T& v1, const T& v2)
{


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

//    cout << " Vertice de maxima conexion en G: " << verticeMaxConexion(G) << endl;

//    cout << endl << " Numero de Caminos simples en G - desde vertice 1 al 5: " <<  numCaminos(G, 1, 5) <<endl;

    system("PAUSE");
    return 0;
}
