#include <iostream>

using namespace std;

class merges {
int uno[15], dos[15], fus[30];
int numuno; //Número de elementos almacenados en la tabla uno
int numdos;//Número de elementos almacenados en la tabla dos

public:
void cargar ();
/*Preguntará al usuario cuantos elementos va a poner, colocando
este valor en numuno, a continuación solicitará tantos elementos
como numuno, almacenándolos en la tabla uno.
Preguntará al usuario cuantos elementos va a poner, colocando
este valor en numdos, a continuación solicitará tantos elementos
como numdos, almacenándolos en la tabla dos.
Los valores es preciso ponerlos desde teclado ordenados
crecientemente para cada tabla. */
void mezclar ();
//Cargará la tabla fus con los valores de las tablas uno y dos
//quedando la tabla fus ordenada crecientemente.
void ver();
//Visualizará por pantalla el contenido de las tablas uno y
//dos.
void verfusion();
//Visualizará por pantalla el contenido de la tabla fus.
};

void merges::cargar()
{
    cout<<"Cuantos elementos va a poner en la tabla 1?: ";
    cin>>numuno;
    cout<<"Introduzca los elementos de la tabla 1: ";
    for (int i=0;i<numuno;i++)
        {
            cin>>uno[i];
        }
    cout<<"\nCuantos elementos va a poner en la tabla 2?: ";
    cin>>numdos;
    cout<<"Introduzca los elementos de la tabla 2: ";
    for (int i=0;i<numdos;i++)
        {
            cin>>dos[i];
        }
}

void merges::mezclar()
{
    int i,j,k;
    i=j=k=0;

    while((i<numuno)&&(j<numdos))
    {
        if(uno[i]<=dos[j])
        {
            fus[k]=uno[i];
            i++;
        }
        else
        {
            fus[k]=dos[j];
            j++;
        }
        k++;
    }

    while (i<numuno)
    {
        fus[k]=uno[i];
        i++;
        k++;
    }
    while (j<numdos)
    {
        fus[k]=dos[j];
        j++;
        k++;
    }
}

void merges::ver()
{

    cout<<"Visualizo la tabla uno\n";
        for (int i=0;i<numuno;i++)
        {
            cout<<uno[i];
            cout<<"  ";
        }
    cout<<"\n";
    cout<<"Visualizo la tabla dos\n";
        for (int i=0;i<numdos;i++)
        {
            cout<<dos[i];
            cout<<"  ";
        }
    cout<<"\n";
}

void merges::verfusion()
{
    cout<<"Visualizo la tabla fusionada\n";
    for (int i=0;i<(numuno+numdos);i++)
        {
            cout<<fus[i];
            cout<<"  ";
        }
    cout<<"\n";
}

int main()
{
    merges prueba;

    prueba.cargar();
    prueba.ver();
    prueba.mezclar();
    prueba.verfusion();
    return 0;
}
