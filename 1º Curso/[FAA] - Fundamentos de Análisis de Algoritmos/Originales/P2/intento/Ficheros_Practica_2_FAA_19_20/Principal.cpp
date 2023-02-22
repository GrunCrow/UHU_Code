#include "TestOrdenacion.h"
#include "AlgoritmosOrdenacion.h"
#include <iostream>
using namespace std;

#include <iostream>
#include <conio.h>
#include "AlgoritmosOrdenacion.h"

using namespace std;

void nombre()
{
    cout<<"***FAA. Practica 2. Curso 19/20"<<endl<<endl;
    cout<<"\t\t\t\t\t\t Alba Marquez Rodriguez"<<endl<<endl;
}

int menuppal(){
    int op;
    cout<<"\t*** MENU PRINCIPAL ***"<<endl<<endl;
    cout<<"\t\t\t1.- Probar los metodos de ordenacion"<<endl<<endl;
    cout<<"\t\t\t2.- Obtener el caso medio de un metodo de ordenacion"<<endl<<endl;
    cout<<"\t\t\t3.- Comparar dos metodos"<<endl<<endl;
    cout<<"\t\t\t0.- Salir"<<endl<<endl;
    cout<<"-------------------------------------------------------------------"<<endl<<endl;
    cout<<"Elige opcion: ";
    cin>>op;

    return op;
}

int menuop2(){
    int op2;
    cout<<"\t*** Metodo a estudiar para el caso medio ***"<<endl<<endl;
    cout<<"\t\t\t1.- Burbuja"<<endl<<endl;
    cout<<"\t\t\t2.- Insercion"<<endl<<endl;
    cout<<"\t\t\t3.- Seleccion"<<endl<<endl;
    cout<<"\t\t\t0.- Salir"<<endl<<endl;
    cout<<"-------------------------------------------------------------------"<<endl<<endl;
    cout<<"Elige opcion: ";
    cin>>op2;

    return op2;
}

void menuop3(int &met1, int &met2){
    cout<<"\t*** COMPARACION DE DOS METODOS DE ORDENACION ***"<<endl<<endl;
    cout<<"\t\t\t0.- Burbuja"<<endl<<endl;
    cout<<"\t\t\t1.- Insercion"<<endl<<endl;
    cout<<"\t\t\t2.- Seleccion"<<endl<<endl;
    cout<<"-------------------------------------------------------------------"<<endl<<endl;
    cout<<"Elige metodo 1: ";
    cin>>met1;
    cout<<endl;
    cout<<"Elige metodo 2: ";
    cin>>met2;
}



int main()
{
    // MENU
    int op,op2,op3, met1, met2;
    AlgoritmosOrdenacion Algoritmo;
    do
    {
        system("cls");
        nombre();
        op=menuppal();
        system("cls");

        switch (op){
        case 0:{
            nombre();
            cout<<"Saliendo...";
            }break;
        case 1:{ //Probar los metodos de ordenacion
        //comprueba el funcionamiento de todos los metodos de ordenacion de la clase AlgoritmosOrdenacion
                system("cls");
                nombre();
                Algoritmo.ordenaBurbuja();
                system("cls");
            }break; //termina op 1 del menu principal
            case 2:{ //Obtener el caso medio de un metodo de ordenacion
                do{
                    nombre();
                    op2=menuop2();

                    switch(op2){
                        case 0:{ //vuelve atras
                            cout<<"Volviendo...";
                            getch();
                        break;}
                        case 1:{ //burbuja

                        break;}
                        case 2:{ //insercion

                        break;}
                        case 3:{ //seleccion

                        break;}
                        default:{

                        break;}
                    }
                }while(op2!=0);
            break; //fin op 2 del menu principal
            }
            case 3:{ //Comparar dos metodos
                do{
                    nombre();
                    menuop3(met1, met2);

                    switch(op3){
                        case 0:{ //vuelve atras
                            cout<<"Volviendo...";
                            getch();
                        break;}
                        case 1:{ //burbuja

                        break;}
                        case 2:{ //insercion

                        break;}
                        case 3:{ //seleccion

                        break;}
                        default:{

                        break;}
                    }
                }while(op3!=0);
            break;} //fin op 3 del menu principal
            default:{
                nombre();
                cout<<"Introduzca una opcion valida";
                getch();
            break;}
        }
    }while(op!=0); //fin do while menuppal

    return 0;
}
