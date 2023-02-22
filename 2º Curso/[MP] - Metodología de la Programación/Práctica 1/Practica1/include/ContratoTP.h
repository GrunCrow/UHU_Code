#ifndef CONTRATOTP_H
#define CONTRATOTP_H

#include <iostream> //cin, cout
#include "Fecha.h"
#include "Contrato.h"
//#define const p 0.15
class ContratoTP: public Contrato
{
    static float precioTP;
    static int minutosTP;
    int MinutosHablados;
    static const float precioExcesoMinutos;


    public:
        ContratoTP(long int dni, Fecha f, int m);
        ContratoTP(ContratoTP &c);
        //virtual ~ContratoTP();
       static int getLimiteMinutos(){return minutosTP;};
       static float getPrecio(){return precioTP;};
       static void setTarifaPlana(int m, float p);
       void ver() const ;
       float factura() const ;
        int getMinutosHablados() const {return MinutosHablados;};
        void setMinutosHablados(int m);


};

ostream& operator<<(ostream &s, const ContratoTP &c);

#endif // CONTRATOTP_H
