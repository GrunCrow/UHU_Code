#ifndef FECHA_H
#define FECHA_H
#include "iostream"

#include <cstdlib>
#include <iomanip> //std::setprecision
#include <sstream> //stringstream
#include <cstring>

using namespace std;

class Fecha
{
    int dia;
    int mes;
    int anio;

    public:
        Fecha(const int &dia,const int &mes,const int &anio);
        virtual ~Fecha();
        int getDia() const;
        int getMes() const;
        int getAnio() const;
        void setFecha(const int &dia, const int &mes, const int &anio);
        bool Bisiesto() const;
        void ver() const;

        Fecha operator++();   //++f
        Fecha operator++(const int notused); //f++
        Fecha operator+(const int i) const; //f+un numero int
        //cuando sobrecargamos un operador, sobrecargamos la parte izquierda

        friend Fecha operator+(const int &i, const Fecha &f); //const por seguridad y & por velocidad

    protected:

    private:
};

Fecha operator+(const int &i, const Fecha &f); //const por seguridad y & por velocidad

ostream& operator<<(ostream& s, const Fecha &o);

#endif // FECHA_H
