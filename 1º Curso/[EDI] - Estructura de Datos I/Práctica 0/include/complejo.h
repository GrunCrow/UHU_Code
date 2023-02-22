#ifndef COMPLEJO_H
#define COMPLEJO_H

#define MAXIMO 20
#define M 5


class complejo
{
    double real, imag;
public:
    complejo(void)
    {
        real = 0.0;
        imag = 0.0;
    }
    complejo(double re, double im=0.0)
    {
        real = re;
        imag = im;
    }
    complejo(const complejo& r)
    {
        real = r.real;
        imag = r.imag;
    }
    void SetReal(double re)
    {
        real = re;
    }
    void SetImag(double im)
    {
        imag = im;
    }
    double GetReal(void)
    {
        return real;
    }
    double GetImag(void)
    {
        return imag;
    }
    complejo operator+(int e);
    complejo operator+(complejo c);     //por valor
    complejo operator-(const complejo& c); //por ref
    int operator== (complejo c);
    complejo operator=(complejo c);
    complejo operator*(complejo c);
    complejo operator++(); // ++obj;
    complejo operator++(int notused); //obj++
    complejo operator-();
    void mostrar();
};

#endif // COMPLEJO_H
