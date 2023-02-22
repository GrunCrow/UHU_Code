#ifndef TNODO_LISTAC_H
#define TNODO_LISTAC_H
#include "TADColaPri.h"
#include "tadcola.h"

struct TNodo_Listafem {
    Paciente P;
    TNodo_Listafem *Sig;
};

class TNodo_ListaC{
    TNodo_Listafem *elementos;
    int n;
    TNodo_Listafem *Anterior(int i);

    public:
        TNodo_ListaC();
        virtual ~TNodo_ListaC();
        bool esvacia();
        int longitud();
        void insertar(Paciente p,int pos);
        Paciente observar(int i);

        void modificar(int i, Paciente p);
        int posicion(Paciente p);
        void eliminar(int i);
        bool pertenece(Paciente p);
        void concatenar(TNodo_ListaC lista2);
};

#endif // TNODO_LISTAC_H
