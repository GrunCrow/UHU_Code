#include "Contrato.h"
#include <iostream>
using namespace std;

int Contrato::contador=1;

Contrato::Contrato(long int dniContrato, Fecha f):fechaContrato(f),idContrato(contador)
{
    this->dniContrato=dniContrato;
    contador++;
    //ctor
}

Contrato::~Contrato()
{

    //dtor
}

void Contrato::ver() const {
    cout<<this->dniContrato<<" ("<<this->idContrato<<" - ";
    fechaContrato.ver();
    cout<<" )";
}


ostream& operator<<(ostream &s, const Contrato &c) {
  s << c.getDniContrato() << " (" << c.getIdContrato() << " - " << c.getFechaContrato() << " )";
  return s;
}
