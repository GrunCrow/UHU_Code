#include <iostream>
#include <cstdlib>
#include "arbin.h"

using namespace std;


//Ejercicio 1

//función auxiliar para calcular el numero de nodos

template <typename T>
int numNodos(const Arbin<T>& a,const typename Arbin<T>::Iterador& r){
    if(r.arbolVacio())
            return 0;
        else
            return numNodos(a, a.subIzq(r)) + numNodos(a, a.subDer(r)) + 1; //nodos subarb izq + nodos subarb dcha + nodo "raiz" de ese subarbol
}

template <typename T>
bool cargaPar(const Arbin<T>& a) {
    return cargaPar(a,a.getRaiz());
};

template <typename T>
bool cargaPar(const Arbin<T>& a,const typename Arbin<T>::Iterador& r) {
    if(r.arbolVacio())
        return true;
    else{
        //if(!a.subDer(r).arbolVacio() && !a.subDer(r).arbolVacio()){ //si ambos subarb tienen nodos ->
            if ((numNodos(a,a.subIzq(r))-numNodos(a,a.subDer(r)) == 0) || (numNodos(a,a.subIzq(r))-numNodos(a,a.subDer(r)) == 2))
                return (cargaPar(a,a.subDer(r)) && cargaPar(a,a.subIzq(r)));
            else
                return false;

        //}
    }

};




//Ejercicio 2

void hojasCota (const Arbin<int>& a, int cota) {


};

/* ******************************************************************* */
/* ******************************************************************* */
int main() {
    Arbin<char> a('m', Arbin<char>('q', Arbin<char>('s', Arbin<char>(), Arbin<char>()),
                                        Arbin<char>('t', Arbin<char>(), Arbin<char>())),
                       Arbin<char>('d', Arbin<char>('k', Arbin<char>(), Arbin<char>()),
                                        Arbin<char>()));

    Arbin<char> b('m', Arbin<char>('q', Arbin<char>('s', Arbin<char>(), Arbin<char>()),
                                        Arbin<char>('t', Arbin<char>(), Arbin<char>())),
                       Arbin<char>('d', Arbin<char>('k', Arbin<char>(), Arbin<char>()),
                                        Arbin<char>('x', Arbin<char>(), Arbin<char>())));


    Arbin<int> d (3, Arbin<int>(8, Arbin<int>(9, Arbin<int>(), Arbin<int>()),
                                 Arbin<int>(7, Arbin<int>(), Arbin<int>())),
                     Arbin<int>(5, Arbin<int>(4, Arbin<int>(), Arbin<int>()),
                                 Arbin<int>()));

   cout << "************************************"; cout << endl;
   cout << "PRUEBA-I (GRUPO L1)"; cout << endl;
   cout << "************************************"; cout << endl;

// Ejercicio 1

   cout << "cargaPar el arbol A?:";
    if(cargaPar(a)) cout<<"SI";
      else cout << "NO";
   cout << endl;

   cout << "cargaPar el arbol B?:";
    if(cargaPar(b)) cout<<"SI";
      else cout << "NO";

   cout << endl<<endl;
/*

// Ejercicio 2
   cout << "Hojas Cota 19 en Arbol D: "<<endl;
   hojasCota(d,19);
   cout << endl<<endl;

*/
    system("PAUSE");
    return 1;
}

