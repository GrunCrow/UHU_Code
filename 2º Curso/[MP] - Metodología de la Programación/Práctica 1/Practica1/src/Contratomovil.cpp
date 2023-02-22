#include <iostream>
#include <cstdlib>
#include <cstring> //strlen, strcpy
#include <iomanip> //std::setprecision
#include "Contrato.h"
#include "ContratoMovil.h"

ContratoMovil::ContratoMovil(long int dniContrato, Fecha f, float p, int m, char* nacionalidad): Contrato(dniContrato, f) {
  this->PrecioMinuto=p;
  this->MinutosHablados=m;

  this->nacionalidad=new char [strlen(nacionalidad)+1];
  strcpy(this->nacionalidad, nacionalidad);
}

ContratoMovil::~ContratoMovil() {
  delete [] this->nacionalidad;
  //this->nacionalidad=NULL;
}

ContratoMovil::ContratoMovil(const ContratoMovil &c):Contrato(c.getDniContrato(),c.getFechaContrato()){
    this->PrecioMinuto=c.PrecioMinuto;
    this->MinutosHablados=c.MinutosHablados;
    this->nacionalidad=new char[strlen(c.nacionalidad)+1];
    strcpy(this->nacionalidad,c.getNacionalidad());
}


void ContratoMovil::setNacionalidad(const char* nac){
    this->nacionalidad=new char[strlen(nac)+1];
    strcpy(this->nacionalidad,nac);
}

void ContratoMovil::ver() const{ //17333256 (5 – 28/02/2001) || 250m, 300(10)
    Contrato::ver();
    cout<<this->MinutosHablados<<"m, ";
    cout<<this->getNacionalidad();
    cout<<" "<<this->PrecioMinuto;

}

float ContratoMovil::factura() const{

    return (PrecioMinuto*MinutosHablados);
}

ostream& operator<<(ostream &s, const ContratoMovil &c){
    s << c.getDniContrato() << " (" << c.getIdContrato() << " - " << c.getFechaContrato() << " )"<<c.getMinutosHablados()<<"m, "<<c.getNacionalidad()<<" "<<c.getPrecioMinuto()<<" - "<<c.factura()<<"E"<<endl;
    return s;
}
