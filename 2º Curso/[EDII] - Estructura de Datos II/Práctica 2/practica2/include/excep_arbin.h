#ifndef _EXCEP_ARBIN_H_
#define _EXCEP_ARBIN_H_

#include "excepcion.h"

using namespace std;

class PosicionArbolExcepcion: public Excepcion {
  public:
     PosicionArbolExcepcion(): Excepcion("La posición del iterador en el árbol no permite realizar esa operación") {};
};

//tratamiento de excepciones
class NoHaySiguienteMayor:public runtime_error{
    public:
        NoHaySiguienteMayor(const string& err):runtime_error(err){}
            string Mensaje() const{
                return what();
            }
};

#endif

