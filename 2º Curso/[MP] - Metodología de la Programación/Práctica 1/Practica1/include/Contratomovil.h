#ifndef CONTRATOMOVIL_H
#define CONTRATOMOVIL_H

#include "Contrato.h"
#include "Fecha.h"
#include "Contrato.h"
#include <iostream>

class ContratoMovil: public Contrato
{
    float PrecioMinuto;
    int MinutosHablados;
    char *nacionalidad;

    public:
        ContratoMovil(long int dniContrato, Fecha f, float p, int m, char* nacionalidad);
        ContratoMovil(const ContratoMovil &c); //ctor copia
        virtual ~ContratoMovil();

      float getPrecioMinuto() const { return this->PrecioMinuto; }
      int getMinutosHablados() const { return this->MinutosHablados; }
      const char* getNacionalidad() const { return this->nacionalidad; } //IMPORTANTE devuelve un puntero constante
      void setPrecioMinuto(float precio) { this->PrecioMinuto=precio; }
      void setMinutosHablados(int m) { this->MinutosHablados=m; }
      void setNacionalidad (const char* nac);
      void ver() const; //Contrato::ver()
      float factura() const;
};

ostream& operator<<(ostream &s, const ContratoMovil &c);

#endif // CONTRATOMOVIL_H
