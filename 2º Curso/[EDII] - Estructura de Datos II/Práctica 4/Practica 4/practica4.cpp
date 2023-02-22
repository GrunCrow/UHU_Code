#include <iostream>
#include <cstdlib>
#include "grafo.h"
#include "conjunto.h"
#include <queue>
#include <sstream>
#include <map>
#include <stdlib.h>


using namespace std;

//Ejercicio 1 - VerticeMaxCoste
/*
Escribir una función que devuelva el vértice de un grafo
con el máximo “coste total de salida” (suma de
los costes de las aristas que parten de un vértice).
Si hubiera varios vértices con dicho máximo coste,
devolver cualquiera de ellos
*/
template <typename T>
T verticeMaxCoste(const Grafo<T, float>& G)
{
    map<T,float> coste;
    T v,vMax;

    //inicializar el diccionario de costes a 0
    Conjunto<Vertice<T> > cv=G.vertices();
    while (!cv.esVacio()){
        v= cv.quitar().getObj();
        coste[v]=0;
    }

    //actualizar los costes de salida sumando el coste de las aristas que salen de cada vértice
    Conjunto<Arista<T,float> > A = G.aristas();
    while (!A.esVacio()){
        Arista<T,float> a = A.quitar();
        coste[a.getOrigen()] += a.getEtiqueta();
    }

    //recorrer el diccionario para encontrar el vertice con mayor coste
    float costeMax= 0;
    for(typename map<T,float>::iterator it=coste.begin();it!= coste.end();it++){
        if(it->second >= costeMax){
            costeMax = it->second;
            vMax = it->first;
        }
    }

    return vMax;
}


//Ejercicio 2 - inaccesible
/*
Dado un grafo, escribe una función que muestre por pantalla
los vértices inaccesibles del mismo. Se entiende por
vértice inaccesible aquél al que no se puede acceder
desde ningún otro vértice del grafo. Por tanto,
cualquier vértice que no sea destino de ninguna arista es
un vértice inaccesible del grafo.
*/
template <typename T, typename U>
void inaccesibles(const Grafo<T, U>& G){
    Conjunto<Vertice<T> > vertices = G.vertices();
    while(!vertices.esVacio()){
        Vertice<T> tmp = vertices.quitar();
        if(G.antecesores(tmp.getObj()).esVacio())
            cout << tmp.getObj() << " ";
    }
}


// Ejercicio 3 - si existe camino entre dos vertices
/*
Dado un grafo dirigido (G) y dos vértices (vo, vd),
 escribe una función que indique si existe o no un
 camino entre dichos vértices.
*/
template <typename T, typename U>
bool caminoEntreDos(const Grafo<T, U>& G, const T& vo, const T& vd){
    queue<T> cola; //usamos cola -> recorrido en anchura
    cola.push(vo);
    Conjunto<T> cerrados;
    T actual= vo;

    do{
        Conjunto<Vertice<T> > adyacentes = G.adyacentes(actual);
        while(!adyacentes.esVacio()){
            T tmp = adyacentes.quitar().getObj();
            if(!cerrados.pertenece(tmp)){
                cola.push(tmp);
            }
        }
        cerrados.anadir(actual);
        actual=cola.front();
        cola.pop();
    }while(actual != vd && !cola.empty());

    return actual == vd;
}


//Ejercicio 4 - RECURSIVO - caminos entre dos vertices menor a x coste
/*
Escribir un procedimiento que dados un grafo y un vértice
del mismo, muestre por pantalla todos los caminos
que partan de dicho vértice y tengan un coste total no
superior a un valor dado (maxCoste)
*/
template <typename T>
void caminosAcotados(const Grafo<T, float>& G, const T& u, float maxCoste){
    stringstream ss;
    ss<<u; //se carga vertice u de tipo T en variable ss de stringstream
    caminosAcotados(G, u, maxCoste, ss.str(),0); //se manda contenido de variable ss convertido a string
}

template <typename T>
void caminosAcotados(const Grafo<T, float>& G, const T& u, float maxCoste, string s, float costeAcum){
    Conjunto<Arista<T, float> > ca = G.aristas();

    cout<< "(" << s << ") coste = " << costeAcum << endl;
    while(!ca.esVacio()){
        Arista<T,float> a = ca.quitar();
        if(a.getOrigen() == u && (costeAcum + a.getEtiqueta() <= maxCoste)){
            stringstream ss;
            ss << a.getDestino();
            caminosAcotados(G,a.getDestino(), maxCoste, s + ", " + ss.str(), costeAcum + a.getEtiqueta());
        }
    }
}


//Ejercicio 5 - mas salidas que entradas
/*
Escribir una función que devuelva un vértice outConectado
de un grafo. Se considera que un vértice está outConectado
si tiene un mayor número de de conexiones de salida que
de entrada. Si hubiera varios vértices outConectados,
la función puede devolver cualquiera de ellos.
*/
template <typename T, typename U>
T outConectado(const Grafo<T, U>& G)
{
    //crear dos diccionarios
    map<T,int> entrada;
    map<T,int> salida;

    //inicializar a 0
    Conjunto<Vertice<T> > cv = G.vertices();

    while(!cv.esVacio()){
        T tmp = cv.quitar().getObj(); //getobj da el objeto (tipo T)
        entrada[tmp]=0;
        salida[tmp]=0;
    }

    Conjunto<Arista<T, float> > aristas = G.aristas();

    while(!aristas.esVacio()){
        Arista<T, float> tmp = aristas.quitar();
        salida[tmp.getOrigen()] += 1;
        entrada[tmp.getDestino()] += 1;
    }
    //recorrido
    //typename map<T,int>::iterator vOut;
    for(typename map<T,int>::iterator itE = entrada.begin(), itS=salida.begin(); itE != entrada.end(); itE++,itS++){
        if(itS->second > itE->second)
            return itE->first;
    }
}




//Ejercicio 6 - recorrido prof
/*
Escribir un procedimiento que muestre por pantalla el
recorrido en profundidad a partir de un grafo y un
vértice dados, pero sin utilizar ninguna estructura
auxiliar (pila o cola). Se trata de escribir un algoritmo
recursivo.
*/
template <typename T, typename U>
void recorrido_profundidad(const Grafo<T, U>& G, const T& v)
{
    map<T,bool> visitados; //diccionario para controlar vertices ya visitados, T = tipo de dato de la clave, bool = tipo de dato del valor

    //inicializar diccionario de visitados a false
    Conjunto<Vertice<T> > cv = G.vertices();
    while(!cv.esVacio()){
        visitados[cv.quitar().getObj()]=false; //quito el objeto, lo inserto y le pongo el valor false
    }
    //llamada a la función recursiva
    recorrido_profundidad(G,v,visitados); //se manda contenido de variable ss convertido a string
}

template <typename T, typename U>
void recorrido_profundidad(const Grafo<T, U>& G, const T& v,map<T,bool>& visitados)
{
    visitados[v]=true;
    cout<<v<<" ";
    Conjunto<Vertice<T>> ady = G.adyacentes(v);
    while(!ady.esVacio()){
        T u = ady.quitar().getObj();//nos movemos a siguiente vertice, y comprobamos si ya hemos estado
        if(!visitados[u]){ //si no visitado (false)
            recorrido_profundidad(G,u,visitados);
        }
    }
}




//L1.1 - Función que muestre por pantalla para cada vértide el número de aristas que salen de dicho vértice con un coste superior a un valor pasado por parámetro
template <typename T, typename U>
void aristasSuperiores(const Grafo <T,U>& G, float coste){
    //diccionarios para guardar los valores
    map<T,int> salida;

    //inicializar a 0
    Conjunto<Vertice<T> > cv = G.vertices();

    //inicialización de diccionario
    while(!cv.esVacio()){
        T tmp = cv.quitar().getObj(); //getobj da el objeto (tipo T)
        salida[tmp]=0;
    }

    Conjunto<Arista<T, float> > aristas = G.aristas();

    while(!aristas.esVacio()){
        //si un vertice es origen de una arista, se incrementa esa posición
        Arista<T, float> tmp = aristas.quitar();
        if((tmp.getEtiqueta() > coste))
            salida[tmp.getOrigen()] += 1;
    }

    //recorrido mostrando por pantalla
    for(typename map<T,int>::iterator itS=salida.begin(); itS != salida.end();itS++){
        if(itS->second>0){
            cout<<itS->first<<" ("<<itS->second<<") - ";
            itS->second=-1;
        }
    }
}

//L1.2
/*
 Dado un grafo G y un vértiece de este, devuelva si existe
 un camino simple (vértices distintos) que comiencen en
 dicho vértice y tenga una longitud igual a un valor pasado
 como parametro
*/
template <typename T,typename U>
bool caminoSimpleAcotado(const Grafo <T,U>& G, const T& v, int longitud){

    map<T,bool> visitados; //diccionario para controlar vertices ya visitados, T = tipo de dato de la clave, bool = tipo de dato del valor

    //inicializar diccionario de visitados a false
    Conjunto<Vertice<T> > cv = G.vertices();
    while(!cv.esVacio()){
        visitados[cv.quitar().getObj()]=false; //quito el objeto, lo inserto y le pongo el valor false
    }

    //llamada a la función recursiva

    return caminoSimpleAcotado(G, v, longitud,visitados);
}

template <typename T,typename U>
bool caminoSimpleAcotado(const Grafo <T,U>& G, const T& v, int longitud, map<T,bool> visitados){

    //bool encontrado=false;
    visitados[v]=true;
    longitud--;
    //cout<<v<<longitud<<endl;
    //system("pause");
    if(longitud<0){
        return true;
    }
    else{
        Conjunto<Vertice<T>> ady = G.adyacentes(v);
        if(!ady.esVacio()){
            while(!ady.esVacio()){
                T u = ady.quitar().getObj();//nos movemos a siguiente vertice, y comprobamos si ya hemos estado
                if(!visitados[u]){ //si no visitado (false)
                    if(caminoSimpleAcotado(G, u, longitud,visitados))
                        return true;
                }
            }
        }
        else
            return false;
    }

}


//L2.1
/*
Devuelve un vértice que tenga igual numero de aristas entran
que salientes. Si hubiera varios vértices, devuelve cualquiera.
*/
template <typename T, typename U>
T verticeEquilibrado(const Grafo<T,U>& G)
{
    //crear dos diccionarios
    map<T,int> entrada;
    map<T,int> salida;

    //inicializar a 0
    Conjunto<Vertice<T> > cv = G.vertices();

    while(!cv.esVacio()){
        T tmp = cv.quitar().getObj(); //getobj da el objeto (tipo T)
        entrada[tmp]=0;
        salida[tmp]=0;
    }

    Conjunto<Arista<T, float> > aristas = G.aristas();

    while(!aristas.esVacio()){
        Arista<T, float> tmp = aristas.quitar();
        salida[tmp.getOrigen()] += 1;
        entrada[tmp.getDestino()] += 1;
    }
    //recorrido
    for(typename map<T,int>::iterator itE = entrada.begin(), itS=salida.begin(); itE != entrada.end(); itE++,itS++){
        if(itS->second == itE->second)
            return itE->first;
    }
}



//L2.2
/*
dado grafo G y vertice, devuelve si existe un camino que
comience en dicho vértice y tenga coste total igual a un
valor pasado como parametro
*/

template <typename T,typename U>
bool caminoCoste(const Grafo <T,U>& G, const T& v, float coste){
    //llamada a la función recursiva
    return caminoCoster(G, v, coste);
}


template <typename T,typename U>
bool caminoCoster(const Grafo <T,U>& G, const T& v, float coste){
    //cout<<v<<longitud<<endl;
    //system("pause");
    if(coste==0)
        return true;

    Conjunto<Arista<T, float> > ca = G.aristas();

    if(!ca.esVacio()){
        while(!ca.esVacio()){
                Arista<T,float> a = ca.quitar();
                if(a.getOrigen() == v && (coste - a.getEtiqueta() >= 0)){
                    if(caminoCoster(G,a.getDestino(), coste - a.getEtiqueta()))
                        return true;
                }
        }
    }
    else
        return false;
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
    G.insertarArista(4, 7, 3);
    G.insertarArista(5, 1, 6);

    Grafo<string, float> H(7);
    H.insertarVertice("Huelva"); H.insertarVertice("Lepe"); H.insertarVertice("Niebla");
    H.insertarVertice("Mazagon"); H.insertarVertice("Almonte"); H.insertarVertice("Aljaraque");
    H.insertarVertice("Matalascañas");
    H.insertarArista("Lepe", "Huelva", 4);
    H.insertarArista("Huelva", "Niebla", 3);
    H.insertarArista("Huelva", "Mazagon", 2);
    H.insertarArista("Huelva", "Aljaraque", 1);
    H.insertarArista("Mazagon", "Almonte", 3);
    H.insertarArista("Mazagon", "Matalascañas", 4);
    H.insertarArista("Aljaraque", "Mazagon", 5);
    H.insertarArista("Almonte", "Huelva", 6);

    //EJERCICIO 1
    cout << " Vertice de maximo coste en G: " << verticeMaxCoste(G) << endl;
    cout << " Vertice de maximo coste en H: " << verticeMaxCoste(H) << endl;

    //EJERCICIO 2
    cout << endl << " Vertices inaccesibles en G: ";
    inaccesibles(G);

//EJERCICIO 3
    cout << endl << " Camino entre Dos en H de Lepe a Almonte: ";
    cout << (caminoEntreDos(H, string("Lepe"), string("Almonte")) ? " SI " : " NO ") << endl;
    cout << endl << " Camino entre Dos en H de Aljaraque a Lepe: ";
    cout << (caminoEntreDos(H, string("Aljaraque"), string("Lepe")) ? " SI " : " NO ") << endl;

//EJERCICIO 4
    cout << endl << " Caminos acotados en G a coste 9 desde el vertice 2:" << endl;
    caminosAcotados(G, 2, 9);

//EJERCICIO 5
    cout << endl << endl << " Vertice outConectado en G: " << outConectado(G);
    cout << endl << " Vertice outConectado en H: " << outConectado(H);

//EJERCICIO 6
    cout << endl << endl << " Recorrido en profundidad de H desde el vertice Huelva:  ";
    recorrido_profundidad(H, string("Huelva"));
    cout << endl << endl;

//L1.1
    cout << endl << endl << " Número de aristas que salen del vértice con coste superior a 1:  \n";
   aristasSuperiores(H, 5);
   cout<<endl;
   aristasSuperiores(G, 2);
   cout << endl << endl;

//L1.2
    cout << endl << " Camino simple acotado (G,4,3): "<< (caminoSimpleAcotado(G,4,3) ? " SI " : " NO ") << endl;
    cout << endl << " Camino simple acotado (G,1,4): "<< (caminoSimpleAcotado(G,1,4) ? " SI " : " NO ") << endl;
    cout << endl << " Camino simple acotado (G,2,4): "<< (caminoSimpleAcotado(G,2,4) ? " SI " : " NO ") << endl;

//L2.1
    cout << endl << endl << " Vertice equilibrado en G: " << verticeEquilibrado(G)<<endl;
    cout << endl << endl << " Vertice equilibrado en H: " << verticeEquilibrado(H)<<endl;

//L2.2
    cout<< (caminoCoste(G,2,4) ? "SI" : "NO") << endl;
    cout<< (caminoCoste(G,1,10) ? "SI" : "NO") << endl;
    cout<< (caminoCoste(G,2,13) ? "SI" : "NO") << endl;

    cout<<endl;
    system("PAUSE");
    return EXIT_SUCCESS;
}
