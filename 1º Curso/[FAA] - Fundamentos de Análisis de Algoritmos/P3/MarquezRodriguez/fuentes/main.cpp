#include <iostream>
#include <conio.h>
#include "TestOrdenacion.h"
#include "TestBusqueda.h"
#include "Constantes.h"

using namespace std;

void nombre()
{
    cout<<"***FAA. Practica 3. Curso 19/20"<<endl<<endl;
    cout<<"\t\t\t\t\t\t Alba Marquez Rodriguez"<<endl<<endl;
}

int menu(){
    int op;
    cout<<"\t\t*** MENU PRINCIPAL ***"<<endl<<endl;
    cout<<"\t\t1.- MENU ORDENACION"<<endl<<endl;
    cout<<"\t\t2.- MENU BUSQUEDA"<<endl<<endl;
    cout<<"\t\t0.- SALIR"<<endl<<endl;
    cout<<"-------------------------------------------------------------------"<<endl<<endl;
    cout<<"Elige opcion: ";
    cin>>op;

    return op;
}


//-------------------------------------------------------------------------------------------
//BUSQUEDA
//-------------------------------------------------------------------------------------------

int menubusqueda(){
    int op;
    cout<<"\t*** MENU BUSQUEDA ***"<<endl<<endl;
    cout<<"\t1.- Probar los metodos de busqueda"<<endl<<endl;
    cout<<"\t2.- Obtener el caso medio de un metodo de busqueda"<<endl<<endl;
    cout<<"\t3.- Comparar dos metodos"<<endl<<endl;
    cout<<"\t4.- Comparar todos los metodos"<<endl<<endl;
    cout<<"\t0.- Volver al menu principal"<<endl<<endl;
    cout<<"-------------------------------------------------------------------"<<endl<<endl;
    cout<<"Elige opcion: ";
    cin>>op;

    return op;
}

int menubuscasomedio(){
    int op;
    cout<<"\t*** Metodo a estudiar para el caso medio ***"<<endl<<endl;
    cout<<"\t1.- Busqueda Secuencial Iterativa"<<endl<<endl;
    cout<<"\t2.- Busqueda Binaria Iterativa"<<endl<<endl;
    cout<<"\t3.- Busqueda de Interpolacion Iterativa"<<endl<<endl;
    cout<<"\t0.- Volver"<<endl<<endl;
    cout<<"-------------------------------------------------------------------"<<endl<<endl;
    cout<<"Elige opcion: ";
    cin>>op;

    return op;
}

void menubuscompdosmet(int &met1,int &met2){
    cout<<"\t*** COMPARACION DE DOS METODOS DE BUSQUEDA ***"<<endl<<endl;
    cout<<"\t\t\t0.- Busqueda Secuencial Iterativa"<<endl<<endl;
    cout<<"\t\t\t1.- Busqueda Binaria Iterativa"<<endl<<endl;
    cout<<"\t\t\t2.- Busqueda de Interpolacion Iterativa"<<endl<<endl;
    cout<<"-------------------------------------------------------------------"<<endl<<endl;
    cout<<"Elige metodo 1: ";
    cin>>met1;
    cout<<endl;
    cout<<"Elige metodo 2: ";
    cin>>met2;
}

//-------------------------------------------------------------------------------------------
//ORDENACION
//-------------------------------------------------------------------------------------------

int menuordenacion(){
    int op;
    cout<<"\t\t*** MENU ORDENACION ***"<<endl<<endl;
    cout<<"\t1.- Probar los metodos de ordenacion"<<endl<<endl;
    cout<<"\t2.- Obtener el caso medio de un metodo de ordenacion"<<endl<<endl;
    cout<<"\t3.- Comparar dos metodos"<<endl<<endl;
    cout<<"\t0.- Salir"<<endl<<endl;
    cout<<"-------------------------------------------------------------------"<<endl<<endl;
    cout<<"Elige opcion: ";
    cin>>op;

    return op;
}

int menuordcasomedio(){
    int op;
    cout<<"\t*** Metodo a estudiar para el caso medio ***"<<endl<<endl;
    cout<<"\t\t1.- Burbuja"<<endl<<endl;
    cout<<"\t\t2.- Insercion"<<endl<<endl;
    cout<<"\t\t3.- Seleccion"<<endl<<endl;
    cout<<"\t\t0.- Salir"<<endl<<endl;
    cout<<"-------------------------------------------------------------------"<<endl<<endl;
    cout<<"Elige opcion: ";
    cin>>op;

    return op;
}

void menuordcompdosmet(int &met1,int &met2){
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
    int op, op2, met1, met2;
    //AlgoritmosOrdenacion Algoritmo;
    TestOrdenacion Test;
    do
    {
        system("cls");

        nombre();
        op=menu();

        system("cls");

        switch (op){

            case 0:{
                nombre();
                cout<<"Saliendo...";
            }break; //case 0 menu ppal

            case 1:{ //MENU ORDENACION
                TestOrdenacion Test;
                do
                {
                    system("cls");

                    nombre();
                    op2=menuordenacion();

                    system("cls");

                    switch (op2){
                    case 0:{
                        nombre();
                        cout<<"Saliendo...";
                    }break; //case 0 menubusqueda
                    case 1:{ //Probar los metodos de ordenacion
                    //comprueba el funcionamiento de todos los metodos de ordenacion de la clase AlgoritmosOrdenacion
                        system("cls");
                        nombre();

                        Test.comprobarMetodosOrdenacion();

                        system("cls");
                    }break; //termina op 1 del menu principal
                    case 2:{ //Obtener el caso medio de un metodo de ordenacion
                        do{
                            system("cls");

                            nombre();
                            op2=menuordcasomedio();

                            system("cls");
                            switch(op2){
                                case 0:{ //vuelve atras
                                    cout<<"Volviendo...";
                                    getch();
                                }break;
                                case 1: //burbuja
                                case 2: //insercion
                                case 3: //seleccion
                                    Test.casoMedio(op2-1); //como hemos puesto burbuja =1, inser = 2, selec = 3; todos valen la cte+1, por eso lo restamos
                                break;
                                default:{
                                    cout<<"Introduzca una opcion valida";
                                }break;
                            }
                        }while(op2!=0);
                    }break; //fin op 2 del menu principal
                    case 3:{ //Comparar dos metodos
                            nombre();
                            menuordcompdosmet(met1, met2);

                            Test.comparar(met1,met2);

                    }break; //fin op 3 del menu principal
                    default:{
                        nombre();
                        cout<<"Introduzca una opcion valida";
                        getch();
                    }break;
                    }
                }while(op2!=0); //fin do while menuppal
            }break;

            case 2:{ //MENU BUSQUEDA
                TestBusqueda Test;
                do
                {
                    system("cls");

                    nombre();
                    op2=menubusqueda();

                    system("cls");

                    switch (op2){
                        case 0:{
                            nombre();
                            cout<<"Saliendo...";
                        }break; //case 0 menubusqueda
                        case 1:{ //Probar los metodos de ordenacion
                        //comprueba el funcionamiento de todos los metodos de ordenacion de la clase AlgoritmosOrdenacion
                            system("cls");
                            nombre();

                            Test.comprobarMetodosBusqueda();

                            system("cls");
                        }break; //termina op 1 del menu principal
                        case 2:{ //Obtener el caso medio de un metodo de ordenacion
                            do{
                                system("cls");

                                nombre();
                                op2=menubuscasomedio();

                                system("cls");
                                switch(op2){
                                    case 0:{
                                        cout<<"Saliendo...";
                                    }break;
                                    case 1: //Busqueda secuencial iterativa
                                    case 2: //Busqueda Binaria Iterativa
                                    case 3: //Busqueda Interpolación Iterativa
                                        Test.casoMedio(op2-1); //como hemos puesto busqueda sec it =1, inser = 2, selec = 3; todos valen la cte+1, por eso lo restamos
                                    break;
                                    default:{
                                        cout<<"Introduzca una opcion valida";
                                    }break;
                                }
                            }while(op2!=0);
                        }break; //fin op 2 del menu ordenacion

                        case 3:{ //Comparar dos metodos
                            nombre();
                            menubuscompdosmet(met1, met2);

                            Test.comparardos(met1,met2);

                        }break; //fin op 3 del menu principal
                        case 4:{ //comparar todos los metodos
                            nombre();

                            Test.comparartres(SECUENCIALIT,BINARIAIT,INTERPOLACIONIT);

                        }break;
                        default:{
                            nombre();
                            cout<<"Introduzca una opcion valida";
                            getch();
                        }break;
                    }
                }while(op2!=0); //fin do while menuppal
            }break;

        } //fin switch menu ppal

    }while(op!=0);

    return 0;
}
