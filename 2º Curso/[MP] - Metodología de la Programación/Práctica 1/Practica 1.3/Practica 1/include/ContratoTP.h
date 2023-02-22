#ifndef CONTRATOTP_H
#define CONTRATOTP_H

#include "Contrato.h"
#include "Fecha.h"

#include <iostream>

using namespace std;

class ContratoTP : public Contrato
{
    static float Precio;
    static int LimiteMinutos;
    static float preciomin; //si exceso
    //static float factura;
    int minutosHablados;

    //actualmente 300 min por 10 euros

    public:
        ContratoTP(long int dni, Fecha f, int minutosHablados);
        ContratoTP(ContratoTP &c); //necesario si hay puntero???
        //virtual ~ContratoTP(); //no necesario al no declarar punteros

        static int getLimiteMinutos();
        static float getPrecio();
        int getMinutosHablados() const;

        static void setTarifaPlana(int LimiteMinutos, float Precio);
        void setMinutosHablados(int minutosHablados);

        float factura() const;

        void ver() const;



};

ostream& operator<<(ostream &s, const ContratoTP &c);

#endif // CONTRATOTP_H
