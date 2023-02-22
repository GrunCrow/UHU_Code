#ifndef CONTRATO_H
#define CONTRATO_H
#include <iostream> //cin, cout
#include "Fecha.h"

    using namespace std;

class Contrato
{
    static int contador;    //Si el atributo es static se inicializa fuera de los metodos/constructores
    const int idContrato; //Si el atributo es constante va en la zona de los inicializadores.
    long int dniContrato;
    Fecha fechaContrato;

    public:
        Contrato(long int dniContrato, Fecha f);
        virtual ~Contrato();

        void ver() const ; //heredar
        int getIdContrato() const {return this->idContrato;} //heredar
        long int getDniContrato()const {return this->dniContrato;}
        Fecha getFechaContrato() const { return this->fechaContrato; }

        void setFechaContrato(Fecha f) { this->fechaContrato=f; }
        void setDniContrato(long int dni) { this->dniContrato=dni; }
};

ostream& operator<<(ostream &s, const Contrato &c);

#endif // CONTRATO_H
