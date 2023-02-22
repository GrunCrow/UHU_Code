#include <iostream>
#include <conio.h>
#include "TestAlgoritmo.h"
#include "Constantes.h"

using namespace std;

void nombre()
{
    cout<<"***FAA. Practica 1. Curso 19/20"<<endl<<endl;
    cout<<"\t\t\t\t\t\t Alba Marquez Rodriguez"<<endl<<endl;

}

/* Programa principal */
int main()
{
    // MENU
    int op,op2,op3;
    TestAlgoritmo Test;
    do
    {
        system("cls");
        nombre();
        cout<<"\t*** ESTUDIO DE LA COMPLEJIDAD DEL ALGORITMO BUSQUEDA SECUENCIAL ***"<<endl<<endl;
        cout<<"\t\t\t1.- ESTUDIO TEORICO"<<endl<<endl;
        cout<<"\t\t\t2.- ESTUDIO EMPIRICO"<<endl<<endl;
        cout<<"\t\t\t0.- SALIR"<<endl<<endl;
        cout<<"-------------------------------------------------------------------"<<endl<<endl;
        cout<<"Elige opcion: ";
        cin>>op;
        system("cls");
        switch (op){
        case 0:
            nombre();
            cout<<"Saliendo...";
            break;
        case 1: //ESTUDIO TEORICO

            do
            {
                system("cls");
                nombre();
                cout<<"*** MENU TEORICO DEL ALGORITMO DE BUSQUEDA SECUENCIAL ***"<<endl<<endl;
                cout<<"1.- Probar el algoritmo busqueda secuencial"<<endl<<endl;
                cout<<"2.- Obtener los casos del metodo de busqueda secuencial"<<endl<<endl;
                cout<<"3.- Comparar los casos"<<endl<<endl;
                cout<<"0.- Volver al menu principal"<<endl<<endl;
                cout<<"-------------------------------------------------------------------"<<endl<<endl;

                cout<<"Elige opcion: ";
                cin>>op2;
                system("cls");
                switch(op2){
                case 0: //MODIFICADO PARA Q NO DE NINGUN MENSAJE CUANDO VUELVA Y LO HAGA DIRECTAMENTE
                    //nombre();
                    //cout<<"Volviendo...";
                    break;
                case 1: //1.1.- Probar el algoritmo busqueda secuencial
                    nombre();
                    Test.comprobarAlgoritmo();
                    break;
                case 2: //1.2.- Obtener los casos del metodo de busqueda secuencial
                    do
                    {
                        system("cls");
                        nombre();
                        cout<<"*** Caso a estudiar para la busqueda secuencial ***"<<endl<<endl;
                        cout<<"0.- Caso peor"<<endl<<endl;
                        cout<<"1.- Caso medio"<<endl<<endl;
                        cout<<"2.- Caso mejor"<<endl<<endl;
                        cout<<"3.- Volver"<<endl<<endl;
                        cout<<"-------------------------------------------------------------------"<<endl<<endl;

                        cout<<"Elige opcion: ";
                        cin>>op3;
                        system("cls");
                        switch(op3)
                        {
                        case 0: //CASO PEOR
                            nombre();
                            Test.costeCasoTeorico(SECUENCIALPEOR);
                            break;
                        case 1: //CASO MEDIO
                            nombre();
                            Test.costeCasoTeorico(SECUENCIALMEDIO);
                            break;
                        case 2: //CASO MEJOR
                            nombre();
                            Test.costeCasoTeorico(SECUENCIALMEJOR);
                            break;
                        case 3:
                            nombre();
                            //cout<<"Volviendo...";
                            break;
                        default:
                            nombre();
                            cout<<"INTRODUZCA UN CASO VALIDO"<<endl<<endl;
                            getch();
                            system("cls");
                        }
                    }while(op3!=3);
                    break;
                case 3:
                    nombre();
                    Test.compararTeorico(SECUENCIALPEOR,SECUENCIALMEDIO,SECUENCIALMEJOR);
                    break;
                default:
                    nombre();
                    cout<<"Introduzca una opcion valida";
                    getch();
                    break;
                }
            }while(op2!=0);
            break;//TERMINA CASO TEORICO


        case 2: //ESTUDIO EMPIRICO
            do
            {
                system("cls");
                nombre();
                cout<<"*** MENU EMPIRICO DEL ALGORITMO DE BUSQUEDA SECUENCIAL ***"<<endl<<endl;
                cout<<"1.- Probar el algoritmo busqueda secuencial"<<endl<<endl;
                cout<<"2.- Obtener los casos del metodo de busqueda secuencial"<<endl<<endl;
                cout<<"3.- Comparar los casos"<<endl<<endl;
                cout<<"0.- Volver al menu principal"<<endl<<endl;
                cout<<"-------------------------------------------------------------------"<<endl<<endl;

                cout<<"Elige opcion: ";
                cin>>op2;
                system("cls");
                switch(op2)
                {
                case 0:
                    //nombre();
                    //cout<<"Volviendo...";
                    break;
                case 1: //2.1.- Probar el algoritmo busqueda secuencial
                    nombre();
                    Test.comprobarAlgoritmo();
                    break;
                case 2: //2.2.- Obtener los casos del metodo de busqueda secuencial
                    do
                    {
                        system("cls");
                        nombre();
                        cout<<"*** Caso a estudiar para la busqueda secuencial ***"<<endl<<endl;
                        cout<<"0.- Caso peor"<<endl<<endl;
                        cout<<"1.- Caso medio"<<endl<<endl;
                        cout<<"2.- Caso mejor"<<endl<<endl;
                        cout<<"3.- Volver"<<endl<<endl;
                        cout<<"-------------------------------------------------------------------"<<endl<<endl;

                        cout<<"Elige opcion: ";
                        cin>>op3;
                        system("cls");
                        switch(op3)
                        {
                        case 0: //CASO PEOR
                            nombre();
                            Test.costeCasoEmpirico(SECUENCIALPEOR);
                            break;
                        case 1: //CASO MEDIO
                            nombre();
                            Test.costeCasoEmpirico(SECUENCIALMEDIO);
                            break;
                        case 2: //CASO MEJOR
                            nombre();
                            Test.costeCasoEmpirico(SECUENCIALMEJOR);
                            break;
                        case 3: //Vuelve
                            break;
                        default:
                            nombre();
                            cout<<"Introduzca una opcion valida";
                            getch();
                            break;
                        }
                    }while(op3!=3);
                    break;
                case 3:
                    nombre();
                    Test.compararEmpirico(SECUENCIALPEOR,SECUENCIALMEDIO,SECUENCIALMEJOR);
                    break;
                default:
                    nombre();
                    cout<<"Introduzca una opcion valida";
                    getch();
                    break;
                }
            }
            while(op2!=0);
            break; //FIN CASO EMPIRICO


        default: //CASE OPCION NO CORRECTA EN EL 1 MENU
            nombre();
            cout<<"INTRODUZCA UNA OPCION VALIDA";
            getch();
            break;
        }
    }while(op!=0);
    return 0;
}

