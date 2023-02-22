#ifndef CLIENTE_H
#define CLIENTE_H
#include <Fecha.h>
#include <cstdlib>
#include <iomanip> //std::setprecision
#include <sstream> //stringstream

using namespace std;

class Cliente
{
    long int dni;
    char *nombre;
    Fecha fechaAlta;

    public:
        Cliente(long int d, char *nom, Fecha f);
        virtual ~Cliente();

        long int getDNI() const;
        const char* getNombre() const;
        Fecha getFecha() const;

        void setNombre(char *nom);
        void setFecha(Fecha f);
        void setDni(long int dni);

        Cliente& operator=(const Cliente& c);

        bool operator==(Cliente &c) const; // if (c1 ==c2)

    protected:

    private:
};

ostream& operator<<(ostream &s, const Cliente &c); //funcion no amiga de la clase


#endif // CLIENTE_H
