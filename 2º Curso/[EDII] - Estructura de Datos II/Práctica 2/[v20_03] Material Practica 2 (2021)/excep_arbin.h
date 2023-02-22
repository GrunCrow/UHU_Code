#ifndef _EXCEP_ARBIN_H_
#define _EXCEP_ARBIN_H_

#include "excepcion.h"

using namespace std;

class PosicionArbolExcepcion: public Excepcion {
  public:
     PosicionArbolExcepcion(): Excepcion("La posición del iterador en el árbol no permite realizar esa operación") {};
};

#endif

