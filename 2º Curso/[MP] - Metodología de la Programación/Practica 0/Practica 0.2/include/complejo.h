#ifndef COMPLEJO_H //bloque de seguridad para no cargar dos veces la misma clase
#define COMPLEJO_H

#include <iostream>

using namespace std;

class complejo
{
    int real;
    int imaginario;

    public:
        complejo(int a, int b=0);
        virtual ~complejo();
        int getr () const;
        int geti ()const;
        void set(); //por teclado
        void set(int r, int i); //por parámetro
        void ver () const;
        complejo operator+(complejo c) const;
        complejo operator+(int i) const;
        complejo operator-() const;

        friend ostream& operator<<(ostream& s, complejo c);

        //complejo operator++(); //metodos
        //complejo operator++(int notused); //metodos

        bool operator==(complejo c); //cuando ponemos == nos devuelve true or false -> por eso es un booleano
        bool operator==(int c);

        operator int(); //operador de casting

};

complejo operator+(int i,complejo c); //const solo a metodos, esto es una función

ostream& operator<<(ostream& s, complejo c);

//si nos pidiesen sobrecargar operator++ mediante funciones:
    complejo operator++(complejo &c);
    complejo operator++(complejo &c, int notused);

    operator int()
#endif // COMPLEJO_H
