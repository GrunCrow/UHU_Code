#include "Contrato.h"

#include <iostream>
using namespace std;

int Contrato::contador = 1; //es constante y debe ir en zona inicializadores

Contrato::Contrato(long int dni, Fecha f):idContrato(contador),fechaContrato(f){
    //this->idContrato=contador++;
    Contrato::contador++;
    this->dniContrato=dni;

}

int Contrato::getIdContrato() const{
    return this->idContrato;
}

long int Contrato::getDniContrato() const{
    return this->dniContrato;
}


Fecha Contrato::getFechaContrato() const{
    return this->fechaContrato;
}

void Contrato::setFechaContrato(Fecha f){
    this->fechaContrato=f;
}

void Contrato::setDniContrato(long int dni){
    this->dniContrato=dni;
}

void Contrato::ver() const{
    cout<<this->dniContrato<<" ("<<this->idContrato<<" - ";
    this->fechaContrato.ver(); //CUIDADO LA HAS PUESTO CON COUT<<THIS... , el metodo ver ya hace llamada para escribirlo
    cout<<" )";
}

ostream& operator<<(ostream &s, const Contrato &c) {
  s << c.getDniContrato() << " (" << c.getIdContrato() << " - " << c.getFechaContrato() << " )";
  return s;
}

Contrato::~Contrato()
{
    //dtor
}
