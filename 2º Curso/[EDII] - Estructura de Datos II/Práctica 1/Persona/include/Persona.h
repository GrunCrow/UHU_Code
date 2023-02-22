#ifndef PERSONA_H
#define PERSONA_H

#include <iostream>
#include <string>

#include "MultiConjunto.h"

using namespace std;

class Persona
{
    public:
        Persona(const string& n = "", int e = 0);
        const string& getNombre() const;
        int getEdad() const;
        void setNombre(const string& n);
        void setEdad(int e);
        bool operator==(const Persona& p) const;
    private:
        string nombre;
        int edad;
};

ostream& operator<<(ostream& o,const Persona& p);

#endif // PERSONA_H
