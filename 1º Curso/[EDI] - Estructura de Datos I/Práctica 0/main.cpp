#include <iostream> //cin, cout
#include <conio.h> // getch
#include <fstream>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <quebrado.h>
#include <complejo.h>
#include <matriz.h>

#define MAXIMO 20
#define M 5

using namespace std;




int main()
{
    matriz m[MAXIMO];
    matriz result;
    int n,N=0;//Numero de matrices del vector
    int i,pos,pos2;
    char comando[20];
    bool salir=false;
    system("cls");

    do
    {
        cout << ">";
        fflush(stdin);
        gets(comando);
        if (strcmp(comando,"cargar")==0)
        {
            cout<<"Cuantas matrices quieres cargar? \n";
            cin>>n;
            if (n+N>=MAXIMO)
                cout<<"Se excede el numero de matrices con las que operar\n";
            else
            {
                N=N+n;
                for (i=0; i<n; i++)
                    m[i].cargar("numeros.dat");
            }
        }
        else if (strcmp(comando,"listar")==0)   //listar
        {
            if (N==0)
                cout << "No hay cargada ninguna matriz" << endl;
            else
            {
                for (i=0; i<N; i++)
                {
                    cout<<"\nMatriz " <<i+1<<":\n\n";
                    m[i].mostrar();
                }
            }
        }
        else if (strcmp(comando,"buscar")==0)   //buscar
        {
            if (N==0)
                cout << "No hay cargada ninguna matriz" << endl;
            else
            {
                result.cargar();

                i=0;
                while (i<N && !(result==m[i]))
                    i++;
                if (result==m[i])
                    cout<<"\nLa matriz esta en la posicion "<<i<<" del vector\n";
                else
                    cout<<"\nNo se ha encontrado la matriz\n";
            }
        }
        else if (comando[0]=='+')
        {
            switch(comando[1])
            {
            case '+':
                cout<<"Posicion?:";
                cin>>pos;//Insertar matriz en la posicion pos
                if (pos>=0 && pos<=N)
                {
                    N++;
                    for(i=N-1; i>=pos; i--)
                        m[i]=m[i-1];
                    m[pos].cargar();
                }
                else
                    cout<<"La posicion no es valida\n";
                break;
            case 0:
                cout<<"Posiciones?:";
                cin>>pos>>pos2;//Sumar matrices en estas posiciones
                if (pos>=0 && pos<N && pos2>=0 && pos2<N )
                {
                    if (m[pos].getfila()!=m[pos2].getfila() || m[pos].getcol()!=m[pos2].getcol())
                        cout << "Error: Las matrices no se pueden sumar" << endl;
                    else
                    {
                        result= m[pos]+ m[pos2];
                        cout<<"Matriz resultante:\n";
                        result.mostrar();
                    }
                }
                else
                    cout<<"Posiciones no validas\n";
            }
        }
        else if (comando[0]=='-')
        {
            switch(comando[1])
            {
            case '-':
                cout<<"Posicion?:";
                cin>>pos;//Eliminar matriz en la posicion pos
                if (pos>=0 && pos<N)
                {
                    for(i=pos; i<N-1; i++)
                        m[i]=m[i+1];
                    N--;
                }
                else
                    cout<<"La posición no es valida\n";
                break;
            case 0:
                cout<<"Posiciones?:";
                cin>>pos>>pos2;//Restar matrices en estas posiciones
                if (pos>=0 && pos<N && pos2>=0 && pos2<N )
                {
                    if (m[pos].getfila()!=m[pos2].getfila() || m[pos].getcol()!=m[pos2].getcol())
                        cout << "Error: Las matrices no se pueden sumar" << endl;
                    else
                    {
                        result= m[pos]-m[pos2];
                        cout<<"Matriz resultante:\n";
                        result.mostrar();
                    }
                }
                else
                    cout<<"Posiciones no validas\n";
            }
        }
        else if (comando[0]=='*')
        {
            cout<<"Posiciones?:";
            cin>>pos>>pos2;//Multiplicar matrices en estas posiciones
            if (pos>=0 && pos<N && pos2>=0 && pos2<N)
            {
                if (m[pos].getcol()!=m[pos2].getfila())
                    cout << "Error: Las matrices no se pueden multiplicar" << endl;
                else
                {
                    result= m[pos]*m[pos2];
                    cout<<"Matriz resultante:\n";
                    result.mostrar();
                }
            }
            else
                cout<<"Posiciones no validas\n";
        }

        else if (comando[0]=='?')   //Mostrar una matriz del vector
        {
            cout<<"Posicion?:";
            cin>>pos;
            if (pos>=0 && pos<N)
                m[pos].mostrar();
            else
                cout<<"La posicion no es valida\n";
        }
        else if (strcmp(comando,"salir")==0)
            salir=true;
        else
            cout << "comando o orden incorrecta" << endl;

    }
    while (!salir);

    return 0;           // Valor de retorno al S.O.
}
