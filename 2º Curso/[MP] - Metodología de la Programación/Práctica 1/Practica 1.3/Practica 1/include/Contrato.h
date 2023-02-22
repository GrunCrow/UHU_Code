#ifndef CONTRATO_H
#define CONTRATO_H
#include "Fecha.h"

using namespace std;

class Contrato
{
    static int contador;
    const int idContrato; //unico, se genera automaticamente y no puede ser modificado
    long int dniContrato; //permite saber a qn pertenece el contrato
    Fecha fechaContrato;

    int minhablados;

    public:

        Contrato(long int dni, Fecha f);
        virtual ~Contrato();

        int getIdContrato() const;
        long int getDniContrato() const;
        Fecha getFechaContrato() const;
        void setFechaContrato(Fecha f);
        void setDniContrato(long int dni);
        virtual void ver() const;

        virtual float factura() const=0;
};

ostream& operator<<(ostream &s, const Contrato &c);

#endif // CONTRATO_H
