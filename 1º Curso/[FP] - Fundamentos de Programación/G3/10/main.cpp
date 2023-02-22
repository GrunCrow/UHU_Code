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

    for(int i=0;i<5;i++){
        for(int j=0;j<5;j++){
            Tab[i][j].letra='A';
            Tab[i][j].profundidad=0;
        }
    }
    Tab[rand()%5][rand()%5].letra='T';

    for(int a=1;a<=3;a++){
        for(int b=0;b<a;b++){
            int B1i=rand()%5;
            int B1j=rand()%5;
            Tab[B1i][B1j].letra='B';
            Tab[B1i][B1j].profundidad=a;
        }
    }
}

bool Tesoro::Jugar(){
    int n=0;

    for(int a=0;a<5;a++)
        {
            for(int b=0;b<5;b++)
            {
                cout<<"-    ";
            }
        cout<<endl;
        }

    do{
        int i,j;
        cout<<"\nIntroduzca la casilla en la que cree que esta el tesoro: ";
        cin>>i,j;

        if(Tab[i][j].letra=='T')
        {
            cout<<"Has ganado!\n";
            puntos=100;
            cout<<puntos;
        }
        else if (Tab[i][j].letra=='A')
        {
            cout<<"Has encontrado arena\n";
            puntos=puntos+1;
            cout<<puntos;
        }
        else if (Tab[i][j].letra=='B')
        {
            cout<<"Has encontrado una bomba\n";
            puntos=puntos-(4-Tab[i][j].profundidad);
            cout<<puntos;
        }
        cout<<endl;

        n++;
    }while((n<15)&&(puntos<100));

    return 1;
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
    Tesoro prueba;
    prueba.Iniciar();
    prueba.Jugar();
    cout<<endl;
    prueba.MostrarTablero();
    return 0;
}
