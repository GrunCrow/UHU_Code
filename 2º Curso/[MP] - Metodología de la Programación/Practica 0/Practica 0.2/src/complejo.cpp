#include <iostream>
#include "complejo.h"
#include <fstream>

using namespace std;

complejo::complejo(int a=0, int b){
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

/*complejo operator+(int i, complejo c){
    complejo suma(i+c.real, c.imaginario); //se puede porq es amiga, si no fuera amiga la solución podría ser hacer usor de los métodos geti() y getr()
    //complejo suma(i+c.getr(),c.geti());
    return suma;
}*/


complejo operator+(int i, complejo c) {
  complejo suma(0,0);
//suma.real=i+c.getr(); ERROR real es privado
//suma.imaginario=c.geti(); ERROR imaginario es privado
  suma.set( i+c.getr(), c.geti() );
  return suma;
/*
//OTRA FORMA DE HACERLO
  complejo suma(0,0);
  int rr=i+c.getr();
  int ii=c.geti();
  suma.set(rr, ii);
  return suma;
//OTRA FORMA DE HACERLO
  return complejo( i+c.getr(), c.geti() );
//OTRA FORMA INGENIOSA... LLAMO A SUMA DE UN COMPLEJO CON UN ENTERO
  return c+i;
*/
}

complejo complejo::operator-() const{
    return complejo(-real,-imaginario);
}

ostream& operator<<(ostream& s, complejo c) {
  if (c.imaginario>=0) {
    s << c.real << "+" << c.imaginario << "i";
  }
  else {
    s << c.real << c.imaginario << "i";
  }
  return s;
}

/*COMO METODOS

complejo complejo::operator++(){
    real++;
    return *this;
}

complejo complejo::operator++(int notused){
    complejo copia(real,imaginario);
    //complejo copia(*this) ->
    real++;
    return copia;
}
*/

// COMO FUNCIONES:

complejo operator++(complejo &c){
    c.set(c.getr()+1,c.geti());
    return c;
}

complejo operator++(complejo &c, int notused){ //complejo si se pasa como complejo c -> se pasa por copia y los cambios q se realizan no afectan al original, por eso pondremos complejo &c
    complejo copia(c);
    c.set(c.getr()+1,c.geti()); //se incrementa el c pero se devuelve la copia (q no está incrementada) //equivale a poner ++c
    //complejo copia(*this) ->
    return copia;
}

bool complejo::operator==(complejo c){
    if((real==c.real) && (imaginario==c.imaginario))
        return true;
    else
        return false;
}

bool complejo::operator==(int c){ //cuando solo tiene valor real, por eso imaginario se compara con 0
    bool igual = false;;
    if((real==c) && (imaginario==0))
        igual = true;
    return igual;
}

complejo::operator int(){
    return real;
}

complejo::~complejo()
{
    //dtor
}
