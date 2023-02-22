#include <iostream>
#include<cstdlib>

using namespace std;


    /*7. Crear una clase llamada Billete con los siguientes atributos:
distancia - Valor de tipo int que contiene los kilómetros de que consta el viaje
dias  - Valor entero que almacena el número de días que dura un viaje
edad   - Valor de tipo entero que guarda la edad del viajero.

Esta clase tendrá los siguientes métodos públicos:
void informacion(); Pide por teclado la distancia del viaje a realizar, el número de días que dura dicho viaje y la edad del turista, almacenándolos en los atributos correspondientes

float operacion();  Determina el precio de un billete de ida y vuelta en avión, conociendo landistancia a recorrer y sabiendo que si el número de días de estancia es
superior a 7 y la distancia superior a 800km, o bien la persona es mayor de 55 años, el billete tiene una reducción del 25%. El precio por kilómetro es de 0.50€

Implementar un pequeño programa que haga uso de esta clase.*/

class Billete
{
    int distancia;
    int dias;
    int edad;
public:
    void informacion();
    float operacion();
};

void Billete::informacion()
{
    cout<<"Indique distancia, días y edad: ";
    cin>>distancia>>dias>>edad;
}

float Billete::operacion()
{
    float precio;

    precio=distancia*0.5;

    if ((dias>7 && distancia>800) || edad>55)
        precio=precio*0.75;
    return precio;
}

int main()
{
    system("color a");

    Billete Viaje;
    float precio;

    Viaje.informacion();
    precio=Viaje.operacion();
    cout<<"El precio asciende a: "<<precio<<" euros";

    return 0;
}
