#include "ContratoTP.h"
#include "Contrato.h"
#include <iostream>
using namespace std;

int ContratoTP::minutosTP=300;
float ContratoTP::precioTP=10;
const float ContratoTP::precioExcesoMinutos=0.15;


ContratoTP::ContratoTP(long int dniContrato, Fecha f, int m):Contrato(dniContrato,f)
{
    this->MinutosHablados=m;
}

ContratoTP::ContratoTP(ContratoTP &c):Contrato(c.getDniContrato(),c.getFechaContrato()){
    this->MinutosHablados=c.MinutosHablados;


}

void ContratoTP::setTarifaPlana(int m, float p) {
  ContratoTP::minutosTP=m; //puedo poner minutosTP=m ...pongo ContratoTP::minutosTP para recordar que es estatico
  ContratoTP::precioTP=p;  //puedo poner precioTP=p  ...pongo ContratoTP::precioTP para recordar que es estatico
}

void ContratoTP::ver() const{
    Contrato::ver();
    cout<<this->MinutosHablados<<"m, ";
    cout<<this->minutosTP<<"("<<this->precioTP<<")";
}

float ContratoTP::factura() const {
    float factura;
    if(MinutosHablados>=minutosTP)
        factura=precioTP+(precioExcesoMinutos*(MinutosHablados-minutosTP));
    else
        factura=precioTP;
    return factura;
}

void ContratoTP::setMinutosHablados(int m){
    this->MinutosHablados=m;

}

ostream& operator<<(ostream &s, const ContratoTP &c){

    s << c.getDniContrato() << " (" << c.getIdContrato() << " - " << c.getFechaContrato() << " )"<<c.getMinutosHablados()<<"m, "<<c.getLimiteMinutos()<<"("<<c.getPrecio()<<") - "<<c.factura()<<"E"<<endl;

    return s;
}

