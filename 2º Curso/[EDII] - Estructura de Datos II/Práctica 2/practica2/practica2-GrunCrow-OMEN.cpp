#include <iostream>
#include <cstdlib>
#include <queue>

#include <cmath>
#include <cstring>

#include "arbin.h"
#include "abb.h"
// Recorridos

template <typename T>
void inorden(const Arbin<T>& a, const typename Arbin<T>::Iterador& r) {
    if (!r.arbolVacio()) {
        inorden(a, a.subIzq(r));
        cout << r.observar() << " ";
        inorden(a, a.subDer(r));
    }
}

template <typename T>
void preorden(const Arbin<T>& a, const typename Arbin<T>::Iterador& r) {
    if (!r.arbolVacio()) {
        cout << r.observar() << " ";
        preorden(a, a.subIzq(r));
        preorden(a, a.subDer(r));
    }
}

template <typename T>
void postorden(const Arbin<T>& a, const typename Arbin<T>::Iterador& r) {
    if (!r.arbolVacio()) {
        postorden(a, a.subIzq(r));
        postorden(a, a.subDer(r));
        cout << r.observar() << " ";
    }
}

template <typename T>
void anchura(const Arbin<T>& a) {
    if (!a.esVacio()) {
        queue<typename Arbin<T>::Iterador> c;
        typename Arbin<T>::Iterador ic = a.getRaiz();
        c.push(ic);
        while (!c.empty()) {
             ic = c.front();
             c.pop();
             cout << ic.observar() << " ";
             if (!a.subIzq(ic).arbolVacio())
                c.push(a.subIzq(ic));
             if (!a.subDer(ic).arbolVacio())
                c.push(a.subDer(ic));
        }
    }
}


/***************************************************************************/
/****************************** EJERCICIOS *********************************/
/***************************************************************************/
//Ejercicio 1
/*Dado un árbol binario, escribir una función que devuelva el número de hojas de dicho árbol.*/

template <typename T>
int numHojas(const Arbin<T>& a){
    return numHojas(a,a.getRaiz());
}

template <typename T>
int numHojas(const Arbin<T>& a,const typename Arbin<T>::Iterador& r){
    int numh=0;
    //a no cambia, cambia r
    if(r.arbolVacio()){
        return 0; //si está vacío no tiene hojas
    }
    else
        if (a.subIzq(r).arbolVacio() && a.subDer(r).arbolVacio()) //si tanto el subarbizq esta vacio cmo el derecho:
            return 1;
        else
            return numHojas(a,a.subIzq(r)) + numHojas(a,a.subDer(r));
}

/****************************************************************************/
//Ejercicio 2
/* Diseñar una función que, dado un árbol binario A,
*devuelva una copia simétrica del mismo.
*Para el árbol A de la Figura 1, el árbol simétrico que
*devolvería la función sería el árbol B de la Figura 1

Devolver nuevo árbol, devolver por valor
*/

template <typename T>
const Arbin<T>& simetrico(const Arbin<T>& a){
    return *simetrico<T>(a,a.getRaiz());
}

template <typename T>
const Arbin<T>* simetrico(const Arbin<T>& a,const typename Arbin<T>::Iterador& r){
    //a no cambia, cambia r
    if(r.arbolVacio()){
        return new Arbin<T>();
    }
    else
        return new Arbin<T>(r.observar(), *simetrico(a,a.subDer(r)), *simetrico(a,a.subIzq(r)));
}

/****************************************************************************/
//Ejercicio 3
/*Realizar un procedimiento que a partir de un árbol binario, muestre por pantalla los elementos
de los nodos visitados mediante un recorrido en zigzag, comenzando por un sentido dado
(‘I’ para subárbol izquierdo, ‘D’ para subárbol derecho):
*/

template <typename T>
void recorridoZigzag(const Arbin<T>& a, char sentido){
    recorridoZigzag<T>(a,a.getRaiz(),sentido);
}

template <typename T>
void recorridoZigzag(const Arbin<T>& a,const typename Arbin<T>::Iterador& r,char sentido){

    if(!r.arbolVacio()){ //porque el que cambia de posición es el iterador
        cout<<r.observar()<<" ";
        if(sentido=='I'){
            recorridoZigzag(a,a.subIzq(r),'D');
        }
        else if(sentido=='D'){
            recorridoZigzag(a,a.subDer(r),'I');
        }
    }
    //else
        //no hacemos nada
}


/******************************************************************************/
//Ejercicio 4
/*Un árbol binario está compensado si, para cada nodo interno del árbol, la diferencia entre
el número de nodos de sus hijos es menor o igual que 1. Escribir una función que devuelva verdadero
si un árbol está compensado y falso en caso contrario. Se entiende que el árbol vacío y las hojas
están compensados.*/


//FUNCION AUXILIAR
template <typename T>
int numNodos(const Arbin<T>& a,const typename Arbin<T>::Iterador& r){
    if(r.arbolVacio())
            return 0;
        else
            return numNodos(a, a.subIzq(r)) + numNodos(a, a.subDer(r)) + 1;
}

template <typename T>
bool compensado(const Arbin<T>& a){
    return compensado(a,a.getRaiz());
}

template <typename T>
bool compensado(const Arbin<T>& a,const typename Arbin<T>::Iterador& r){
    if(r.arbolVacio() || (a.subIzq(r).arbolVacio() && a.subDer(r).arbolVacio())) //si está vacío o ambos subarboles lo están
        return true;
    else{
        if(!(compensado(a,a.subIzq(r)) && compensado(a,a.subDer(r)))) //si ni el subizq ni subdcho compensado = false
            return false;
        else
            return abs(numNodos(a,a.subIzq(r))-numNodos(a,a.subDer(r))) <= 1;
    }
}





/*****************************************************************************/
//Ejercicio 5
/*Cada nodo de un árbol binario A almacena una letra. La concatenación de las mismas,
en cada camino que va desde la raíz a una hoja representa una palabra.
Realizar una función que visualice todas las palabras almacenadas en un árbol binario A.
*/

void palabras(const Arbin<char>& a,const Arbin<char>::Iterador& r,string palabra){
    if(!r.arbolVacio()){
        if(a.subIzq(r).arbolVacio() && a.subDer(r).arbolVacio()){
            cout << palabra << r.observar() << "\n"; //se escribe lo q estaría guardado de la palabra +el ultimo nodo
        }
        else{
            palabras(a,a.subIzq(r),palabra+r.observar());
            palabras(a,a.subDer(r),palabra+r.observar());
        }
    }
}

string palabras(const Arbin<char>& a){
    string pa;
    if (!a.esVacio())
        palabras(a,a.getRaiz(),"");

    return pa;
}






/******************************************************************************/
//Ejercicio 6
/*Sea a un árbol de búsqueda binario de enteros positivos y x un número entero positivo.
Se pide escribir una función que dados a y x devuelva el siguiente elemento mayor que x
almacenado en el árbol. En caso de que x no tenga un elemento mayor en el árbol a debe
lanzar una excepción. El elemento x puede estar en el árbol o no.

En el árbol de la Figura 3, la llamada siguienteMayor(a, 5) debe devolver 6. Sin embargo,
para la llamada siguienteMayor(a, 14) debe lanzar la excepción noHaySiguienteMayor.
*/

//funcion auxiliar:
int minimo(const ABB<int>&a,const ABB<int>::Iterador& r){
    if(a.subIzq(r).arbolVacio()) //si no tiene parte izq el menor serça el nodo central
        return (r.observar());
    else //llamar a minimo otra vez
        return minimo(a,a.subIzq(r)); //devolver min de parte izqda

}

void siguienteMayor(const ABB<int>& a,const ABB<int>::Iterador& r,int x,int& sm){
    int eRaiz;
    if(!r.arbolVacio()){
        eRaiz=r.observar();
        if(x==eRaiz){
            if(!a.subDer(r).arbolVacio()){ //caso 1 x=3
                sm=minimo(a,a.subDer(r));
            }
        }
        else if(x>eRaiz){ //caso 2 x>e -> parte dcha
            siguienteMayor(a,a.subDer(r),x,sm);
        }
        else{ //caso 3 x<e -> parte izqda
            sm=eRaiz;
            siguienteMayor(a,a.subIzq(r),x,sm);
        }
    }
}

int siguienteMayor(const ABB<int>& a, int x)throw (NoHaySiguienteMayor){
    int sm=0;
    siguienteMayor(a,a.getRaiz(),x,sm);

    if(sm==0)
        throw (NoHaySiguienteMayor("No hay ningun valor mayor en este arbol"));
    else
        return sm;
}




/******************************************************************************/
//Ejercicio 7

template <typename T>
int posicionInorden(const ABB<T>& a,const T& obj){
    return posicionInorden(a,obj,a.getRaiz());
}

template <typename T>
int posicionInorden(const ABB<T>& a,const T& obj, const ABB<int>::Iterador& r){
    if(r.arbolVacio()){
        return 0; //si iterador vacio -> no esta
    }
    else{
        if(obj<r.observar()){
            return posicionInorden(a,obj,a.subIzq(r));
        }
        else if(obj>r.observar()){
            int p = posicionInorden(a,obj,a.subDer(r));
            if(p==0)
                return 0;
            else
                return (numNodos(a,a.subIzq(r))+1 + p);
        }
        else if (obj==r.observar()){
            return (numNodos(a,a.subIzq(r))+1);
        }
    }
}

/******************************************************************************/
//Ejercicio 8
bool haySumaCamino(const Arbin<int>& a,const Arbin<int>::Iterador& r, int suma){
    if(r.arbolVacio())
        return false;
    else{
        if (a.subIzq(r).arbolVacio() && a.subDer(r).arbolVacio()){ //si ambs subarboles vacios, restar y si == 0 entonces -> true
            return suma-r.observar() == 0;
        }
        else{
            return haySumaCamino(a,a.subIzq(r),suma-r.observar()) || haySumaCamino(a,a.subDer(r),suma-r.observar());
        }
    }
}

bool haySumaCamino(const Arbin<int>& a, int suma){
    return haySumaCamino(a,a.getRaiz(),suma);
}

//PRACTICANDO PARA EL EXAMEN

//EJERCICIO 1
template <typename T>
bool unomax(const Arbin<T>& a,const typename Arbin<T>::Iterador& r){
    if(r.arbolVacio()){
        return true;
    }
    else{
        if(!a.subDer(r).arbolVacio() && !a.subIzq(r).arbolVacio()){
            return false;
        }
        else{
            return (unomax(a,a.subDer(r)) && unomax(a,a.subIzq(r)));
        }
    }
}

template <typename T>
bool unomax(const Arbin<T>& a){
    return unomax(a,a.getRaiz());
}

//EJERCICIO 2

bool hijosOrdenados(const Arbin<int>& a,const Arbin<int>::Iterador& r){
    if(r.arbolVacio())
        return true;
    else{
            //COMPROBAR SOLO EN LOS QUE TIENE DOS HIJOS
            if(!a.subDer(r).arbolVacio() && !a.subIzq(r).arbolVacio()) //si tiene dos nodos
                if((a.subDer(r).observar()<=a.subIzq(r).observar())==false)
                    return (hijosOrdenados(a,a.subDer(r)) && hijosOrdenados(a,a.subIzq(r)));
                else
                    return false;
            else
                return true;
    }
};

bool hijosOrdenados(const Arbin<int>& a){
    return hijosOrdenados(a,a.getRaiz());
};




/****************************************************************************/
/****************************************************************************/
int main(int argc, char *argv[]){

    //Para hacer los arboles:
    //Arbin<char>('m', Arbin<char>(), Arbin<char>())
    // Arbin<int>(7, Arbin<int>(), Arbin<int>())

    Arbin<char> A('t', Arbin<char>('m', Arbin<char>(),
                                        Arbin<char>('f', Arbin<char>(), Arbin<char>())),
                       Arbin<char>('k', Arbin<char>('d', Arbin<char>(), Arbin<char>()),
                                        Arbin<char>()));

    Arbin<char> B('t', Arbin<char>('n', Arbin<char>(),
                                        Arbin<char>('d', Arbin<char>('e', Arbin<char>(), Arbin<char>()),
                                                         Arbin<char>())),
                       Arbin<char>('m', Arbin<char>('f', Arbin<char>(), Arbin<char>()),
                                        Arbin<char>('n', Arbin<char>(), Arbin<char>())));

    Arbin<char> D('t', Arbin<char>('k', Arbin<char>('d', Arbin<char>(), Arbin<char>()),
                                        Arbin<char>()),
                       Arbin<char>('m', Arbin<char>(),
                                        Arbin<char>('f', Arbin<char>(), Arbin<char>())));

    Arbin<char> E('o', Arbin<char>('r', Arbin<char>(),
                                        Arbin<char>('o', Arbin<char>(), Arbin<char>())),
                       Arbin<char>('l', Arbin<char>('a', Arbin<char>(), Arbin<char>()),
                                        Arbin<char>('e', Arbin<char>(), Arbin<char>())));

    Arbin<int> F(2, Arbin<int>(7, Arbin<int>(2, Arbin<int>(), Arbin<int>()),
                                  Arbin<int>(6, Arbin<int>(5, Arbin<int>(), Arbin<int>()),
                                                Arbin<int>(11, Arbin<int>(), Arbin<int>()))),
                    Arbin<int>(5, Arbin<int>(),
                                  Arbin<int>(9, Arbin<int>(),
                                                  Arbin<int>(4, Arbin<int>(), Arbin<int>()))));

    ABB<int> BB6, BB7;

    //PRACTICANDO PARA EL EXAMEN:
    Arbin<char> A1('t', Arbin<char>('m',
                                    Arbin<char>(),
                                    Arbin<char>('x', Arbin<char>(), Arbin<char>())),
                        Arbin<char>());

    Arbin<char> A2('t', Arbin<char>(),
                       Arbin<char>('k',
                                   Arbin<char>('d', Arbin<char>(), Arbin<char>()),
                                   Arbin<char>('m', Arbin<char>(), Arbin<char>())));

     Arbin<int> B1(5,  Arbin<int>(2,  Arbin<int>(6, Arbin<int>(), Arbin<int>()),
                                         Arbin<int>(4, Arbin<int>(), Arbin<int>())),
                     Arbin<int>(3,  Arbin<int>(7, Arbin<int>(), Arbin<int>()), Arbin<int>()));

    Arbin<int> B2(5,  Arbin<int>(2,  Arbin<int>(1, Arbin<int>(), Arbin<int>()),
                                         Arbin<int>(4, Arbin<int>(), Arbin<int>())),
                     Arbin<int>(3,  Arbin<int>(7, Arbin<int>(), Arbin<int>()), Arbin<int>()));



    // NUMERO HOJAS //
    cout << "Num. hojas del arbol B: " << numHojas(B) << endl;
    cout << "Num. hojas del arbol E: " << numHojas(E) << endl << endl;

    // COPIA SIMETRICA //
    Arbin<char> C = simetrico(B);
    cout << "Recorrido en inorden del arbol B: " << endl;
    inorden(B, B.getRaiz());
    cout << endl << "Recorrido en inorden del arbol C: " << endl;
    inorden(C, C.getRaiz());
    cout << endl << endl;


    // RECORRIDO EN ZIG-ZAG //
    cout << "Recorrido en zigzag I de B:\n";
    recorridoZigzag(B, 'I');
    cout << endl;
    cout << "Recorrido en zigzag D de C:\n";
    recorridoZigzag(C, 'D');
    cout << endl << endl;


    // COMPENSADO //
    cout << "Esta A compensado?:";
    cout << (compensado(A) ? " SI" : " NO") << endl;
    cout << "Esta B compensado?:";
    cout << (compensado(B) ? " SI" : " NO") << endl << endl;



    // PALABRAS DE UN ARBOL //
    cout << "PALABRAS DE A:\n";
    palabras(E);
    cout << "PALABRAS DE B:\n";
    palabras(B);
    cout << endl;



    // SIGUIENTE MAYOR
    BB6.insertar(8); BB6.insertar(3); BB6.insertar(10); BB6.insertar(1); BB6.insertar(6);
    BB6.insertar(14); BB6.insertar(4); BB6.insertar(7); BB6.insertar(13);
    try{
        cout << "Siguiente mayor en BB6 de 5: " << siguienteMayor(BB6, 5) << endl;
        cout << "Siguiente mayor en BB6 de 8: " << siguienteMayor(BB6, 8) << endl;
        cout << "Siguiente mayor en BB6 de 13: " << siguienteMayor(BB6, 13) << endl;
        cout << "Siguiente mayor en BB6 de 14: " << siguienteMayor(BB6, 14) << endl;
    }
    catch(const NoHaySiguienteMayor& e){
        cout << e.Mensaje() << endl << endl;
    }

    // POSICION INORDEN //
    BB7.insertar(5); BB7.insertar(1); BB7.insertar(3); BB7.insertar(8); BB7.insertar(6);
    cout << "Posicion Inorden en BB7 de 3: ";
    cout << posicionInorden(BB7, 3);
    cout << endl << "Posicion Inorden en BB7 de 8: ";
    cout << posicionInorden(BB7, 8);
    cout << endl << "Posicion Inorden en BB7 de 7: ";
    cout << posicionInorden(BB7, 7);
    cout << endl << endl;

    // SUMA CAMINO
    cout << "Hay un camino de suma 26 en F?:";
    cout << (haySumaCamino(F, 26) ? " SI" : " NO") << endl;
    cout << "Hay un camino de suma 9 en F?:";
    cout << (haySumaCamino(F, 9) ? " SI" : " NO") << endl;

    // PRUEBA EJERCICIO 1
    cout << "TODOS NODOS DE A1 MAX 1 HIJO:";
    cout << (unomax(A1) ? " SI" : " NO") << endl;
    cout << "TODOS NODOS DE A1 MAX 1 HIJO:";
    cout << (unomax(A2) ? " SI" : " NO") << endl;

    // PRUEBA EJERCICIO 2
    cout << "ELEMENTO EN LA RAIZ DEL SUBARBOL IZQUIERDO ES MENOR O IGUAL AL ELEMENTO EN LA RAIZ DEL SUBARBOL DERECHO:";
    cout << (hijosOrdenados(B1) ? " SI" : " NO") << endl;
    cout << "ELEMENTO EN LA RAIZ DEL SUBARBOL IZQUIERDO ES MENOR O IGUAL AL ELEMENTO EN LA RAIZ DEL SUBARBOL DERECHO:";
    cout << (hijosOrdenados(B2) ? " SI" : " NO") << endl;

    system("PAUSE");
    return 0;
}
