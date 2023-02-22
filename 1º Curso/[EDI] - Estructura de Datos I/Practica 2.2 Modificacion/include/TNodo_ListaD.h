#ifndef TNODO_LISTAD_H
#define TNODO_LISTAD_H
#include "TADColaPri.h"
#include "tadcola.h"
#include <iostream>

using namespace std;

struct TNodo_Listamasc {
     Paciente P;
     TNodo_Listamasc *Ant;
     TNodo_Listamasc *Sig;
};

class TNodo_ListaD
{
    TNodo_Listamasc *elementos;
    int n;
    TNodo_Listamasc *Anterior(int i);

    public:
        TNodo_ListaD();
        virtual ~TNodo_ListaD();
        bool esvacia();
        int longitud();
        void insertar(Paciente p,int pos);
        Paciente observar(int i);

        void modificar(int i, Paciente p);
        int posicion(Paciente p);
        void eliminar(int i);
        bool pertenece(Paciente p);
        void concatenar(TNodo_ListaD lista2);

    protected:

    private:
};

#endif // TNODO_LISTAD_H
