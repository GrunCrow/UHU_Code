#ifndef CONTRATOMOVIL_H
#define CONTRATOMOVIL_H

#include <iostream> //cin, cout
#include "Fecha.h"
#include "Contrato.h"

using namespace std;

class ContratoMovil: public Contrato {
  float precioMinuto;
  int minutosHablados;
  char *nacionalidad;
public:
  ContratoMovil(long int dni, Fecha f, float p, int m, char *nac);
  virtual ~ContratoMovil(); //necesario porque hay un atributo puntero char*
  ContratoMovil(const ContratoMovil& c); //necesario porque hay un atributo puntero char*

//ContratoMovil& operator=(const ContratoMovil& c); //necesario si en el main pensamos usar = para asignar
                                                    //si NUNCA vamos a usar = en el main no hace falta implementarlo
                                                    //como ContratoMovil hereda un atributo constante idContrato que no puede modificarse
                                                    //no podemos usar el = en el main() y por tanto no lo implementamos

  float getPrecioMinuto() const { return this->precioMinuto; }
  int getMinutosHablados() const { return this->minutosHablados; }
  const char* getNacionalidad() const { return this->nacionalidad; } //IMPORTANTE devuelve un puntero constante
  void setPrecioMinuto(float precio) { this->precioMinuto=precio; }
  void setMinutosHablados(int m) { this->minutosHablados=m; }
  void setNacionalidad(char* nac);
  void ver() const;
  float factura() const;
};

ostream& operator<<(ostream &s, const ContratoMovil &c);




#endif // CONTRATOMOVIL_H
