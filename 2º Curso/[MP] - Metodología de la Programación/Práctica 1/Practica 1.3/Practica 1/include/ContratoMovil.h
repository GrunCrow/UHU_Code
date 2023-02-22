#ifndef CONTRATOMOVIL_H
#define CONTRATOMOVIL_H

#include "Contrato.h"


class ContratoMovil : public Contrato
{
    char* nacionalidad;
    float precioMinuto;
    int minutosHablados;
    //float factura;

    public:
        ContratoMovil(long int dni, Fecha f, float precioMinuto, int minutosHablados, char *nac);
        ContratoMovil(const ContratoMovil &c); //al tener puntero char* es necesario

        char* getNacionalidad() const;
        float getPrecioMinuto() const;
        float getMinutosHablados() const;

        void setNacionalidad(char* nac);
        void setPrecioMinuto(float PrecioMinuto);
        void setMinutosHablados(int MinutosHablados);

        void ver() const;

        float factura() const;

        virtual ~ContratoMovil();
};

ostream& operator<<(ostream &s, const ContratoMovil &c);

#endif // CONTRATOMOVIL_H
