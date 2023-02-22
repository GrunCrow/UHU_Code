#include <iostream>

using namespace std;

/*6. Crear una clase que contenga dos atributos haciendo referencia a valores enteros. Esta clase
contar� con dos m�todos p�blicos, que ser�n los siguientes:
void informacion(); Solicita por teclado dos n�meros enteros, y los almacena en los atributos de la clase

void operacion(); Solicita al usuario la operaci�n a realizar con los dos n�meros
introducidos por teclado, de modo que si el usuario pulsa �+�, �S� o �s� el
m�todo mostrar� un mensaje indicando el resultado de la suma de ambos
n�meros; pero si el usuario indica �-�, �R� o �r� el m�todo mostrar� el
resultado de la resta.

Para cualquier otra pulsaci�n se deber� indicar un
mensaje de error, indicando que la operaci�n solicitada no es v�lida */

class clase
{
    int a;
    int b;
public:
    void informacion();
    void operacion();
};

void clase::informacion()
{
    cout<<"Introduzca un numero para darle valor al atributo 1 y otro para el 2: ";
    cin>>a>>b;
}

void clase::operacion()
{
    char op;


        cout<<"\n----Menu----";
        cout<<"\nSumar ('S', 's' o '+')";
        cout<<"\nRestar ('R', 'r' o '-')";
        cout<<"\nIntroduzca que operacion desea realizar: ";
        cin>>op;
        cout<<"\n";

            if (op=='S'||op=='s'||op=='+')
                cout<<"La suma del atributo 1 y 2= "<<a+b;
            else if (op=='R'||op=='r'||op=='-')
                cout<<"La resta del atributo 1 y 2= "<<a-b;
            else
                cout<<"Operacion no valida";




}


int main()
{
    clase op;
    char ans='s';
    do
    {
    op.informacion();
    op.operacion();

    cout<<"\nDesea repetir el programa? ('s' para repetir, otra tecla para terminar)\n";
    cin>>ans;
    cout<<"\n";
    }while(ans=='s');


    return 0;
}
