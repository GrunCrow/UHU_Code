#include <iostream>
using namespace std;

/*2. Cree una clase con los atributos m�ximo, minimo y media, y con los siguientes m�todos
p�blicos:
void estadistica(); Pide por teclado cuantos n�meros enteros va a poner, a continuaci�n
pedir� por teclado tantos n�meros como el usuario haya indicado, y
almacenar� el valor m�ximo, el m�nimo y la media de todos los n�meros
introducidos en los atributos correspondientes.
int mostrarmax(); Devolver� el valor del atributo maximo
int mostrarmin(); Devolver� el valor del atributo minimo
float mostrarmedia(); Devolver� el valor del atributo media
Implemente un peque�o programa que utilice esta clase.*/

class clase{
    int maximo;
    int minimo;
    float media;
public:
    void estadistica();  /* Pide por teclado cuantos n�meros enteros va a poner, a continuaci�n
                            pedir� por teclado tantos n�meros como el usuario haya indicado, y
                            almacenar� el valor m�ximo, el m�nimo y la media de todos los n�meros
                            introducidos en los atributos correspondientes.*/
    int mostrarmax();       /* Devolver� el valor del atributo maximo */
    int mostrarmin();       /* Devolver� el valor del atributo minimo*/
    float mostrarmedia();   /* Devolver� el valor del atributo media*/
};

void clase::estadistica(){
    int n,num;
    cout<<"Cuantos numeros enteros va a poner?\n";
    cin>>n;
    cout<<"\n";

    cout<<"Introduzca un valor para el 1 numero: ";
        cin>>num;
        cout<<"\n";
        media=num;
        maximo=num;
        minimo=num;

    for(int i=2;i<=n;i++)
    {
        cout<<"Introduzca un valor para el"<<i<<" numero: ";
        cin>>num;
        cout<<"\n";
        media=media+num;
        if (num>maximo)
            maximo=num;
        if (num<minimo)
            minimo=num;
    }
    media=media/n;
}

int clase::mostrarmax(){
return maximo;}
int clase::mostrarmin(){
return minimo;}
float clase::mostrarmedia(){
return media;}

int main()
{
    clase probar;

    probar.estadistica();
    cout<<"El maximo es: "<<probar.mostrarmax();
    cout<<"\n";
    cout<<"El minimo es: "<<probar.mostrarmin();
    cout<<"\n";
    cout<<"La media es: "<<probar.mostrarmedia();
    cout<<"\n";
    return 0;
}
