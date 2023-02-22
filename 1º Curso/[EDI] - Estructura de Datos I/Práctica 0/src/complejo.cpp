#include "complejo.h"
#include <iostream> //cin, cout
#include <conio.h> // getch
#include <fstream>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <quebrado.h>

#define MAXIMO 20
#define M 5

using namespace std;

complejo complejo::operator+ (int e)
{
    complejo suma;
    suma.real = real + e;
    suma.imag = imag;
    return suma;
}
// sobrecarga de +
complejo complejo::operator+ (complejo c)
{
    complejo suma;
    suma.real = real + c.real;
    suma.imag = imag + c.imag;
    return suma;
}
// sobrecarga de -
complejo complejo::operator- (const complejo &c)
{
    complejo resta;
    resta.real = real - c.real;
    resta.imag = imag - c.imag;
    return resta;
}
// sobrecarga de ==
int complejo::operator== (complejo c)
{
    if (real==c.real && imag==c.imag)
        return 1;
    else
        return 0;
}
// sobrecarga de =
complejo complejo::operator= (complejo c)
{
    real=c.real;
    imag=c.imag;
    return c;
}
// sobrecarga de – unario
complejo complejo::operator-()
{
    complejo copia;
    copia.real=-real;
    copia.imag=-imag;
    return copia;
}
// sobrecarga de ++ (++obj)
complejo complejo::operator++()
{
    complejo copia;
    real++;
    copia.real=real;
    copia.imag=imag;
    return copia;
}
// sobrecarga de ++ (obj++)
complejo complejo::operator++(int notused)
{
    complejo copia;
    copia.real=real;
    copia.imag=imag;
    real++;
    return copia;
}
//sobrecarga de *
complejo complejo::operator*(complejo c)
{
//Falta implementar
    complejo copia;


    return copia;
}
// mostrar complejo
void complejo::mostrar()
{
    if (imag>0)
        cout<<real<<"+"<<imag<<"i";
    else
        cout<<real<<imag<<"i";
}
