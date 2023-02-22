#ifndef _EXCEP_CONJUNTO_H_
#define _EXCEP_CONJUNTO_H_

#include "excepcion.h"

using namespace std;

class ConjuntoLlenoExcepcion: public Excepcion {
  public:
     ConjuntoLlenoExcepcion(): Excepcion("Se ha alcanzado la capacidad máxima del conjunto. No se pueden añadir mas elementos al conjunto.") {};
};

#endif

