#ifndef _EXCEP_ABB_H_
#define _EXCEP_ABB_H_

#include "excepcion.h"

using namespace std;

class ArbolVacioExcepcion: public Excepcion {
  public:
     ArbolVacioExcepcion(): Excepcion("Arbol vacio") {};
};

#endif

