#ifndef EMPRESA_H
#define EMPRESA_H

#include "Fecha.h"
#include "Cliente.h"
#include "Contrato.h"
#include "ContratoTP.h"
#include "ContratoMovil.h"

class Empresa
{
    Cliente *clientes[100];
    int ncli;
    const int nmaxcli;

    Contrato **contratos;
    int ncon;
    int nmaxcon;

    protected:
        int buscarCliente(long int dni) const; ////si no existe devuelve -1 y si existe devuelve la posición del cliente en el array clientes
        int altaCliente(Cliente *c); //añade el cliente apuntado por c al array clientes //devuelve la posición donde lo mete (-1 si no cabe)

    public:

        Empresa();
        virtual ~Empresa();

        void crearContrato();
        bool cancelarContrato(int idContrato);
        bool bajaCliente(long int dni);
        void cargarDatos();
        void cargarDatos2();
        void ver() const;

        int nContratosTP() const;
        int descuento(float porcentaje) const;
};

ostream& operator<<(ostream &s, const Contrato &c);


#endif // EMPRESA_H
