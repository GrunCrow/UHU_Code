#include "Persona.h"

using namespace std;

Persona::Persona(const string& n, int e):nombre(n)
{
    edad = e;
}

const string& Persona::getNombre() const{
    return nombre;
}

int Persona::getEdad() const{
    return edad;
}

void Persona::setNombre(const string& n){
    nombre=n;
}

void Persona::setEdad(int e){
    edad=e;
}

bool Persona::operator==(const Persona& p) const{
    return (nombre == p.nombre && edad == p.edad);
}

ostream& operator<<(ostream& o,const Persona& p){
    o<<p.getNombre()<<" - "<<p.getEdad();
    return o;
}

/*Persona::~Persona()
{
    //dtor
}*/
