#include "ContratoMovil.h"
#include "Contrato.h"
#include <cstring> //strlen, strcpy
#include <iomanip> //std::setprecision
#include <iostream>
#include <cstdlib>

using namespace std;

ContratoMovil::ContratoMovil(long int dni, Fecha f, float precioMinuto, int minutosHablados, char *nac) : Contrato(dni, f){
    this->precioMinuto = precioMinuto;
    this->minutosHablados = minutosHablados;
    this->nacionalidad = new char[strlen(nac)+1];
    strcpy(this->nacionalidad, nac);

}
ContratoMovil::ContratoMovil(const ContratoMovil &c) : Contrato(c.getDniContrato(), c.getFechaContrato()){
    this->precioMinuto = c.precioMinuto;
    this->minutosHablados = c.minutosHablados;
    this->nacionalidad = new char[strlen(c.nacionalidad)+1];
    strcpy(this->nacionalidad, c.nacionalidad);
}

char* ContratoMovil::getNacionalidad() const{
    return this->nacionalidad;
}

float ContratoMovil::getPrecioMinuto() const{
    return this->precioMinuto;
}

float ContratoMovil::getMinutosHablados() const{
    return this->minutosHablados;
}

void ContratoMovil::setNacionalidad(char* nac){
    this->nacionalidad= new char[strlen(nac)+1];
    strcpy(this->nacionalidad,nac);
}

void ContratoMovil::setPrecioMinuto(float PrecioMinuto){
    this->precioMinuto=PrecioMinuto;
}

void ContratoMovil::setMinutosHablados(int MinutosHablados){
    this->minutosHablados=MinutosHablados;
}

void ContratoMovil::ver() const{

    //cout<<*this;
    Contrato::ver(); //para que muestre lo de CONTRATO (PADRE)

    //mostramos ahora lo de esta clase:
    cout<<this->minutosHablados<<"m, "<<this->nacionalidad<<" "<<this->precioMinuto<<" - "<<factura()<<"E";
}

float ContratoMovil::factura() const{
    return precioMinuto*minutosHablados;
}

ContratoMovil::~ContratoMovil()
{
    delete[] this->nacionalidad;
}

ostream& operator<<(ostream &s, const ContratoMovil &c) {
  s << (Contrato &)c; //IMPORTANTE: convierto el objeto c (ContratoMovil &) a objeto Contrato &
                      // de esta forma se cree que es un objeto Contrato y muestra lo que indica el operator<< de Contrato
                      //... y a continuacion solo "me preocupo" de mostrar lo que es exclusivo del hijo
  s << " " << c.getMinutosHablados() << "m, " << c.getNacionalidad() << " " << c.getPrecioMinuto() << " - ";
  s << c.factura() << "€";
  return s;
}
