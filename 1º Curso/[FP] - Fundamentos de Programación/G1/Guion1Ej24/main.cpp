

/*Si en las proximidades de una carga puntual q, colocamos sucesivamente cargas de prueba
qi, sabemos por la ley de Coulomb que dichas cargas se verán sometidas a una fuerza
eléctrica. La intensidad del campo eléctrico E, medida en Newton/Culombio, creado por
dicha carga puntual, se puede expresar del siguiente modo:

Donde:
 q es la carga puntual generadora del
campo eléctrico.
 Ɛ es la constante dieléctrica o
permitividad del medio y cuyo valor
en el vacío es:

 r es la distancia a la carga puntual.

Implementar una clase llamada CampoElec de modo que:
a. Tendrá dos atributos privados: q (valor en μC ) y r (valor en m). Al igual que en el
ejercicio anterior, hay que tener en cuenta que el usuario indicará una carga en μC
pero si atendemos a las unidades de la constante Ɛ0 en la fórmula se debe trabajar en
C.
b. Tendrá dos métodos públicos:
a) void Leer() que solicitará al usuario los valores de la carga y la distancia.
b) double Intensidad() que devolverá la intensidad del campo eléctrico creado
por dicha carga puntual a la distancia r.
Codificar un programa que utilice dicha clase.
Ejemplos para comprobar las soluciones obtenidas:*/

#include <iostream>
#include <cmath>
using namespace std;

class CampoElec
{
    float q;
    float r;
public:
    void Leer();
    double Intensidad();
};

void CampoElec::Leer()
{
    cout<<"Introduzca un valor para q en μC\n";
    cin>>q;
    cout<<"Introduzca un valor para r en m\n";
    cin>>r;
}

double CampoElec::Intensidad()
{
    float u=8.85*pow(10,-12);
    float pi=3.14;
    q=q*pow(10,-6);
    float E=q/(4.0*pi*pow(r,2)*u);
    return E;
}

int main()
{
    CampoElec ob1;
    ob1.Leer();
    float E=ob1.Intensidad();
    cout<<"La intensidad del campo es= "<<E;
    return 0;
}
