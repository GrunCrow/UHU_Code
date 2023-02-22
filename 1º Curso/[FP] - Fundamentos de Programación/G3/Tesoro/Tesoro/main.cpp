#include <iostream>
#include <cstdlib>
#include <ctime>
using namespace std;

struct tablero{
    int profundidad;
    char letra;
};

class Tesoro{
    tablero Tab[5][5];
    int puntos;
public:
    void Iniciar();
    bool Jugar();
    void MostrarTablero();
};

void Tesoro::Iniciar(){
    srand (time(0));
    puntos=15;

    for(int a=0;a<5;a++){ //Ponemos arena a profundidad 1
        for(int b=0;b<5;b++){
            Tab[a][b].letra='A';
            Tab[a][b].profundidad=1;
        }
    }

    int tesi=rand()%5;
    int tesj=rand()%5;
    //Ponemos bombas
    for(int a=0;a<=3;a++){
        for(int b=0;b<a;b++){
            int Boi=rand()%5;
            int Boj=rand()%5;
                if (tesi!=Boi || tesj!=Boj){
                    Tab[Boi][Boj].profundidad=a;
                    Tab[Boi][Boj].letra='B';
                }
                else
                {
                    Boi=Boi-1;
                    Tab[Boi][Boj].profundidad=a;
                    Tab[Boi][Boj].letra='B';
                }
        }

    }
    Tab[tesi][tesj].letra='T';
}

bool Tesoro::Jugar(){

    int tiradasmax=15;
    int fila, columna;
    bool fin=false;
    char tabla_vacia[5][5];

    for(int i=0;i<5;i++)
    {
        for (int j=0;j<5;j++)
        {
            tabla_vacia[i][j]='-';
        }
    }

    cout<<" ENCUENTRA EL TESORO\n\n";
    for(int i=0;i<5;i++)
    {
        for(int j=0;j<5;j++)
        {
           cout<<" "<<tabla_vacia[i][j]<<" ";
        }
        cout<<endl;
    }

    cout<<"Intentos disponibles: "<<tiradasmax<<"\n";
    cout<<"Puntos obtenidos: "<<puntos<<"\n";

    do
    {
        do
        {
        cout<<"Indica una fila y una columna (1-5): ";
        cin>>fila>>columna;
        fila--;
        columna--;
            if  (fila<0 || fila>5 || columna<=0 || columna>5)
                cout<<"Error en la posicion\n";
            else if (tabla_vacia[fila][columna]==Tab[fila][columna].letra)
                cout<<"Esa casilla ya la has seleccionado\n";
        }while(fila<0 || fila>5 || columna<0 || columna>5 || tabla_vacia[fila][columna]==Tab[fila][columna].letra);

        tiradasmax--;
        tabla_vacia[fila][columna]=Tab[fila][columna].letra;

    //CALCULO DE PUNTOS
        if (Tab[fila][columna].letra=='T')
        {
            system("color 60");
            puntos=puntos+100;
            fin=true;
            system("cls");
            cout<<"Puntos de la partida: "<<puntos;
            cout<<endl;
            cout<<"Intentos restantes: "<<tiradasmax;
            cout<<endl;
            cout<<"\nHAS ENCONTRADO EL TESORO!\n\n";
            system("pause");
            system("cls");
            system("color 5b");
            cout<<"de mi corason bb <3\n\n";
            system("pause");
            system("cls");
            system("color a");
        }

        else if (Tab[fila][columna].letra=='B')
        {
            system("color CE");
            puntos=puntos-(4-Tab[fila][columna].profundidad);
            cout<<"\nBOMBA";
            system("color a");
        }
        else if (Tab[fila][columna].letra=='A')
        {
            puntos=puntos+1;
        }

        if (puntos<0)
            fin=false;
//Muestra tablero vacio
        system("cls");

        cout<<" ENCUENTRA EL TESORO\n\n";

        for(int i=0;i<5;i++)
        {
            for(int j=0;j<5;j++)
            {
               cout<<" "<<tabla_vacia[i][j]<<" ";
            }
            cout<<endl;
        }
    cout<<"Intentos disponibles: "<<tiradasmax<<"\n";
    cout<<"Puntos obtenidos: "<<puntos<<"\n";


    }while(fin==false && tiradasmax!=0);

    if (tiradasmax==0 && fin==false)
        {
            system("cls");
            system("color CE");
            cout<<"\nGAME OVER\n";
            cout<<endl;
            system("pause");
        }
    return fin;
    }

void Tesoro::MostrarTablero(){

        for(int i=0;i<5;i++)
        {
        for(int j=0;j<5;j++)
        {
            cout<<Tab[i][j].letra;
            if (Tab[i][j].profundidad==0)
                cout<<"    ";
            else
                cout<<"("<<Tab[i][j].profundidad<<") ";

        }
        cout<<endl;
        }
}

int main()
{
    system("color a");
    Tesoro prueba;
    bool jugar=1;
    do{
        system("cls");
        system("color a");

        prueba.Iniciar();

        prueba.Jugar();
        cout<<endl;
        system("cls");
        system("color 0c");
        cout<<"Quiere ver el tablero? (1 para si, 0 para no): ";
        bool res;
        cin>>res;
        cout<<endl;
        if(res==1)
        prueba.MostrarTablero();
        system("pause");
        cout<<endl;
        cout<<"Quieres jugar otra vez? (1 para si, 0 para no): ";
        cin>>jugar;
    }while (jugar);

    return 0;
}
