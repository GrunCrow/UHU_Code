#include <iostream>
using namespace std;

/*Diseñe una clase rectángulo para almacenar los atributos largo y ancho con las operaciones
iniciar (poniendo 2 de ancho y 4 de largo), cargar (poniendo el largo y el ancho que escriba el
usuario por teclado), área (que devuelva el valor del área del rectángulo) y cambiar (poner el
valor del largo como ancho y el ancho como largo). Escriba un programa que utilice esta clase.
class rectangulo {
int largo;
int ancho;
public:
void iniciar ( );
//poniendo 2 de ancho y 4 de largo
void cargar ( );
//poniendo el largo y el ancho que escriba el usuario por teclado
int area ( );
//que devuelva el valor del área del rectángulo
void cambiar( );
//pondrá el valor del largo como ancho y el ancho como largo
};*/

class rectangulo {
    int largo;
    int ancho;
public:
    void iniciar ( );   //poniendo 2 de ancho y 4 de largo
    void cargar ( );    //poniendo el largo y el ancho que escriba el usuario por teclado
    int area ( );       //que devuelva el valor del área del rectángulo
    void cambiar( );    //pondrá el valor del largo como ancho y el ancho como largo
};

void rectangulo::iniciar()
{
    ancho=4;
    largo=2;
}

void rectangulo::cargar()
{
    cout<<"Introduzca un valor para el ancho del rectángulo\n";
    cin>>ancho;
    cout<<"Introduzca un valor para el largo del rectángulo\n";
    cin>>largo;
}

int rectangulo::area()
{
    int a;
    a=largo*ancho;
    return a;
}

void rectangulo::cambiar()
{
    int a;
    a=ancho;
    ancho=largo;
    largo=a;

    cout<<"El ancho ahora es "<<ancho<<"\n";
    cout<<"El largo ahora es "<<largo<<"\n";
}

int main()
{
    int ar;
    rectangulo ob1;
    ob1.iniciar();
    ob1.cargar();
    ar=ob1.area();
    cout<<"El area del rectangulo = "<<ar<<"\n";
    ob1.cambiar();
    return 0;
}
