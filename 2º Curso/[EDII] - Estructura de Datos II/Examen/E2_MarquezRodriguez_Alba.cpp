#include <iostream>
#include <cstdlib>
#include "arbin.h"

using namespace std;

//Ejercicio 2

void hojasCota(const Arbin<int>& a,const typename Arbin<int>::Iterador& r, int cota, int suma){
    if(!r.arbolVacio()){
        if(a.subDer(r).arbolVacio() && a.subIzq(r).arbolVacio()){ //si ambos subarb vacios del nodo -> restar nodo y mostrar si cumple prop (porque es una hoja)
            if(suma+r.observar()<cota)
                cout<<"Hoja ("<<r.observar()<<") -> Peso hoja: "<<suma+r.observar()<<endl;
        }
        else{
            if(!a.subIzq(r).arbolVacio())
                hojasCota(a,a.subIzq(r),cota,suma+r.observar());
            if(!a.subDer(r).arbolVacio())
                hojasCota(a,a.subDer(r),cota,suma+r.observar());
        }
    }
};

void hojasCota(const Arbin<int>& a, int cota){
    int suma=0;
    hojasCota(a,a.getRaiz(),cota,suma);
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


// Ejercicio 2
   cout << "Hojas Cota 19 en Arbol D: "<<endl;
   hojasCota(d,19);
   cout << endl<<endl;

    system("PAUSE");
    return 1;
}

