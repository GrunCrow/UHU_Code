#include "quebrado.h"
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




int mcd(int a, int b)
{
    int comun,encontrado=0;
    a=abs(a);
    b=abs(b);
    if (a>b)
        comun=b;
    else
        comun=a;
    while (comun>1 && !encontrado)
    {
        if (a%comun==0 && b%comun==0)
            encontrado=1;
        else
            comun--;
    }
    return(comun);
}
//calcula el mcm de a y b (en positivo)
int mcm(int a, int b)
{
    int comun,encontrado;
    if (a<0)
        a=-a;
    if (b<0)
        b=-b;
    if (a>b)
        comun=a;
    else
        comun=b;
    encontrado=0;
    while (!encontrado)
    {
        if (comun%a==0 && comun%b==0)
            encontrado=1;
        else
            comun++;
    }
    return(comun);
}








quebrado::quebrado(int n, int d)
{
    if (d==0)
        cout << "\nError: Quebrado no valido";
    numerador=n;
    denominador=d;
}

void quebrado::valor(int n, int d)
{
    if (d==0)
        cout << "\nError: Quebrado no valido";
    numerador=n;
    denominador=d;
}

void quebrado::mostrar()
{
    if (denominador>0)
        cout << numerador << "/" << denominador;
    else
        cout << -numerador << "/" << -denominador;
}

quebrado quebrado::operator/(quebrado q)
{
    quebrado division;
    division.numerador=numerador*q.denominador;
    division.denominador=denominador*q.numerador;
    return division;
}
quebrado quebrado::operator-()
{
    quebrado aux;
    aux.numerador=-numerador;
    aux.denominador=denominador;
    return aux;
}

int quebrado::operator==(quebrado q)
{
    int igual;
    if (numerador*q.denominador==denominador*q.numerador)
        igual=1;
    else
        igual=0;
    return igual;
}


quebrado quebrado::operator+(quebrado q)
{
    quebrado suma;
    int comun;
    if (denominador==q.denominador)
    {
        suma.numerador= numerador + q.numerador;
        suma.denominador = denominador;
    }
    else
    {
        comun=mcm(denominador,q.denominador);
        suma.denominador = comun;
        suma.numerador=numerador*comun/denominador +	    q.numerador*comun/q.denominador;
    }
    return suma;
}
quebrado quebrado::operator-(quebrado q)
{
    quebrado resta;
    q.numerador=-q.numerador;
    resta=(*this)+q;
    return(resta);
}
quebrado quebrado::operator*(quebrado q)
{
    quebrado producto;
    producto.numerador=numerador*q.numerador;
    producto.denominador=denominador*q.denominador;
    return producto;
}
