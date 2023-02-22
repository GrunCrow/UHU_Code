#ifndef COMPLEJO_H //bloque de seguridad para no cargar dos veces la misma clase
#define COMPLEJO_H

class complejo
{
    int real;
    int imaginario;

    public:
        complejo(int a, int b);
        virtual ~complejo();
        int getr () const;
        int geti ()const;
        void set(); //por teclado
        void set(int r, int i); //por par�metro
        void ver () const;
        complejo operator+(complejo c) const;
        complejo operator+(int i)const;
        complejo operator-() const;

        friend complejo operator+(int i,complejo c);


};

complejo operator+(int i,complejo c); //const solo a metodos, esto es una funci�n

#endif // COMPLEJO_H
