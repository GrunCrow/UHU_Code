#ifndef _EXCEP_GRAFO_H_
#define _EXCEP_GRAFO_H_

#include "excepcion.h"

using namespace std;

class GrafoLlenoExcepcion: public Excepcion {
  public:
     GrafoLlenoExcepcion(): Excepcion("Se ha alcanzado la capacidad maxima del conjunto. No se pueden añadir mas elementos al conjunto.") {};
};

class NoExisteVerticeExcepcion: public Excepcion {
  public:
     NoExisteVerticeExcepcion(): Excepcion("Alguno de los vertices que forman la arista no pertenece al grafo.") {};
};

#endif

