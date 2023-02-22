#include <iostream>
#include <cmath>
using namespace std;

/*Implementar una clase llamada Energía con las siguientes características:
a. Tendrá 3 atributos privados: m (expresada en kg), v (expresada en km/h) y h
(expresada en km). El alumno deberá tener en cuenta en qué unidad se almacenan
los datos, y en qué unidad deben estar expresados para hacer las operaciones
correctamente, de modo que el programa deberá realizar las conversiones
oportunas.
b. Tendrá tres métodos públicos:
a) void Leer() que solicitará al usuario los valores de masa, velocidad y altura
de un determinado cuerpo en las unidades antes indicadas.
b) float ECinetica() que devolverá la energía cinética.
c) float EPotencial() que devolverá del energía potencial.

Codificar un programa que utilice dicha clase y muestre por pantalla la energía cinética, la
energía potencial y la energía mecánica del cuerpo indicado por el usuario.*/

class Energia
{
    float m;
    float v;
    float h;
public:
    void leer();
    float ECinetica();
    float EPotencial();
};

void Energia::leer()
{
    cout<<"Introduzca el valor de la masa en kg\n";
    cin>>m;
    cout<<"\n";
    cout<<"Introduzca el valor de la velocidad en km/h\n";
    cin>>v;
    cout<<"\n";
    cout<<"Introduzca el valor de la altura en km\n";
    cin>>h;
    cout<<"\n";
}

float Energia::ECinetica()
{
    v=(v*1000)/3600;
    float ec=(m*(pow(v,2)))/2;
    return ec;
}

float Energia::EPotencial()
{
    h=h*1000;
    float g=9.8;
    float ep=m*g*h;
    return ep;
}

int main()
{
    Energia ob1;
    ob1.leer();
    float ec=ob1.ECinetica();
    cout<<ec<<"J es la energía cinetica\n";
    float ep=ob1.EPotencial();
    cout<<ep<<"J es la energía potencial\n";
    cout<<ec+ep<<"J es la energia mecanica";
    return 0;
}
