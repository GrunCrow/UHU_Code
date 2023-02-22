#include <iostream>
#include <cmath>
using namespace std;

/*Implementar una clase llamada Energ�a con las siguientes caracter�sticas:
a. Tendr� 3 atributos privados: m (expresada en kg), v (expresada en km/h) y h
(expresada en km). El alumno deber� tener en cuenta en qu� unidad se almacenan
los datos, y en qu� unidad deben estar expresados para hacer las operaciones
correctamente, de modo que el programa deber� realizar las conversiones
oportunas.
b. Tendr� tres m�todos p�blicos:
a) void Leer() que solicitar� al usuario los valores de masa, velocidad y altura
de un determinado cuerpo en las unidades antes indicadas.
b) float ECinetica() que devolver� la energ�a cin�tica.
c) float EPotencial() que devolver� del energ�a potencial.

Codificar un programa que utilice dicha clase y muestre por pantalla la energ�a cin�tica, la
energ�a potencial y la energ�a mec�nica del cuerpo indicado por el usuario.*/

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
    cout<<ec<<"J es la energ�a cinetica\n";
    float ep=ob1.EPotencial();
    cout<<ep<<"J es la energ�a potencial\n";
    cout<<ec+ep<<"J es la energia mecanica";
    return 0;
}
