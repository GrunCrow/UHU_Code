#include <iostream>
using namespace std;
#include "complejo.h"

complejo::complejo(int a=0, int b=0){
    real=a;
    imaginario=b;
}

int complejo::getr() const{
    return real;
}

int complejo::geti() const{
    return imaginario;
}

void complejo::set(){ //por teclado
    cout << "Parte real: ";
    cin >> real;
    cout << endl << "Parte imaginaria: ";
    cin >> imaginario;
}

void complejo::set(int a, int b){ //por parámetro
    real=a;
    imaginario=b;
}

void complejo::ver() const{

    if(real!=0 || imaginario !=0){
        if (real!=0)
            cout << real;
        if (imaginario !=0 ){
            if (imaginario>=0)
                cout<<"+";
            cout << imaginario <<"i";
        }
    }
    else
        cout<<"0";
}

complejo complejo::operator+(complejo c) const{
    complejo suma(0,0);
    suma.real=real+c.real;
    suma.imaginario=imaginario+c.imaginario;
    return suma;
}

complejo complejo::operator+(int i) const{
    complejo suma(0,0);
    suma.real=real+i;
    suma.imaginario=imaginario;
    return suma;
}

complejo operator+(int i, complejo c){
    complejo suma(i+c.real, c.imaginario); //se puede porq es amiga, si no fuera amiga la solución podría ser hacer usor de los métodos geti() y getr()
    //complejo suma(i+c.getr(),c.geti());
    return suma;
}

complejo complejo::operator-() const{
    return complejo(-real,-imaginario);
}

complejo::~complejo()
{
    //dtor
}
