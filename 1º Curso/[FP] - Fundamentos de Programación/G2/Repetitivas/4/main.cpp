#include <iostream>

using namespace std;

/*4. Diseñe la siguiente clase para mostrar una tabla de multiplicar:
class TablaMultiplicar{
int Tabla;
public:
void PedirNoTabla();
void MostrarTabla();
};
donde los métodos realizarán la siguiente función:
 PedirNoTabla(): Método para solicitar por teclado el número de la tabla de
multiplicar a mostrar. Si el valor introducido es menor que uno o mayor que 10, el
método volverá a solicitar otro número de tabla.
 MostrarTabla(): Método que muestra por pantalla la tabla de multiplicar con el
formato:
5 x 0 = 0
5 x 1 = 5
5 x 2 = 10
5 x 3 = 15
. . . . . .
5 x 10 = 50

Implementar un programa principal que utilice la clase y muestre por pantalla la tabla
solicitada.*/

class TablaMultiplicar{
    int Tabla;
public:
    void PedirNoTabla();
    void MostrarTabla();
};

void TablaMultiplicar::PedirNoTabla(){

    do{
    cout<<"Escriba el numero de la tabla de multiplicar que desea saber ";
    cin>>Tabla;
    }while((Tabla<1)||(Tabla>10));
}

void TablaMultiplicar::MostrarTabla(){
    for(int i=0;i<=10;i++)
    {
     cout<<i<<"*"<<Tabla<<"="<<i*Tabla;
     cout<<"\n";
    }
}

int main()
{
    TablaMultiplicar tabla;

    tabla.PedirNoTabla();
    tabla.MostrarTabla();

    return 0;
}
