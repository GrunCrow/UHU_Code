#include "ContratoTP.h"

float ContratoTP::Precio=10.0;
int ContratoTP::LimiteMinutos=300;
float ContratoTP::preciomin=0.15;
//float ContratoTP::factura=0;

ContratoTP::ContratoTP(long int dni, Fecha f, int minutosHablados) : Contrato(dni, f){
    this->minutosHablados = minutosHablados;
}
ContratoTP::ContratoTP(ContratoTP &c) : Contrato(c.getDniContrato(), c.getFechaContrato()){
    this->minutosHablados = c.minutosHablados;
}

int ContratoTP::getLimiteMinutos(){
    return ContratoTP::LimiteMinutos;
}

float ContratoTP::getPrecio(){
    return ContratoTP::Precio;
}

int ContratoTP::getMinutosHablados() const{
    return ContratoTP::minutosHablados;
}

void ContratoTP::setTarifaPlana(int LimiteMinutos, float Precio){
    ContratoTP::LimiteMinutos=LimiteMinutos;
    ContratoTP::Precio=Precio;
}

void ContratoTP::setMinutosHablados(int minutosHablados){
    ContratoTP::minutosHablados=minutosHablados;
}

float ContratoTP::factura() const{
    float f=0;

    f=Precio;

    if(minutosHablados>LimiteMinutos){
        f=f+(minutosHablados-LimiteMinutos)*preciomin;
    }

    return f;
}

void ContratoTP::ver() const{
    Contrato::ver(); //para que muestre lo de CONTRATO (PADRE)

    //mostramos ahora lo de esta clase:
    cout<<this->minutosHablados<<"m, "<<this->LimiteMinutos<<" ("<<Precio<<")";
}

ostream& operator<<(ostream &s, const ContratoTP &c) {
  s << (Contrato &)c; //IMPORTANTE: convierto el objeto c (ContratoTP &) a objeto Contrato &
                      // de esta forma se cree que es un objeto Contrato y muestra lo que indica el operator<< de Contrato
                      //... y a continuacion solo "me preocupo" de mostrar lo que es exclusivo del hijo
  s << " " << c.getMinutosHablados() << "m, " << c.getLimiteMinutos() << " (" << c.getPrecio() << ") - "<<c.factura()<<"€";
  return s;
}
