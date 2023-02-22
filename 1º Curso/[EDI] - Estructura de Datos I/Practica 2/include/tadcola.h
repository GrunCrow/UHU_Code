#ifndef TADCOLA_H
#define TADCOLA_H
#define MAXcolas 9
#include <iostream>
//#include "TADColaPri.h"
#define INCREMENTO 4

using namespace std;

const int TAM_CADENA = 30;
typedef char cadena[TAM_CADENA];

struct Paciente {
    int id;
    cadena nombre;
    cadena apellidos;
    int edad;
};

class cola
{
    Paciente *elementos; //elementos de la cola
    int inicio, fin; //principio y fin de la cola
    int Tama; //Capacidad de la tabla
    int ne; //Nº de elementos
public:
    cola(); // constructor de la clase
    ~cola(); // destructor de la clase
    void encolar(Paciente e);
    void desencolar();
    bool esvacia();
    Paciente primero() ;
    int longitud();
};


#endif // TADCOLA_H
