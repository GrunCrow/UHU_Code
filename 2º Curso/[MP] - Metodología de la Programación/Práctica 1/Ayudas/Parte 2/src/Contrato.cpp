#include "Contrato.h"

int Contrato::contador=1;

Contrato::Contrato(long int dni, Fecha f): idContrato(contador), fechaContrato(f) {
  //idContrato=contador; //ERROR es constante y debe ir en zona inicializadores
  Contrato::contador++;
  this->dniContrato=dni;
  //this->fechaContrato=f; //ERROR es tipo no primitivo y debe ir en zona inicializadores
}

Contrato::~Contrato() {
    //dtor
}


void Contrato::ver() const {
  cout << this->dniContrato << " (" << this->idContrato << " - ";
  this->fechaContrato.ver(); //llamo al ver del objeto fecha
  cout << ")";
}

ostream& operator<<(ostream &s, const Contrato &c) {
  s << c.getDniContrato() << " (" << c.getIdContrato() << " - " << c.getFechaContrato() << " )";
  return s;
}

//RESTO DE METODOS Y FUNCIONES A RELLENAR POR EL ALUMNO...
