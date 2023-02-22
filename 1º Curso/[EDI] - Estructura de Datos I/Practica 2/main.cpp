#include <iostream>
#include <fstream>
#include <conio.h>
#include <windows.h>
#include "TADColaPri.h"
#include "tadcola.h"

using namespace std;

void nombre()
{
    cout<<"***ED. Practica 2. Curso 19/20"<<endl<<endl;
    cout<<"\t\t\t\t\t\t Alba Marquez Rodriguez"<<endl<<endl;
}

int menu(){
    int op;
    cout<<"\t\t*** MENU PRINCIPAL ***"<<endl<<endl;
    cout<<"\t1- Cargar datos desde fichero"<<endl;
    cout<<"\t2- Admision de un nuevo Paciente"<<endl;
    cout<<"\t3- Atender un Paciente"<<endl;
    cout<<"\t4- Listar Pacientes esperando para atender"<<endl;
    cout<<"\t5- Listar Pacientes según prioridad"<<endl;
    cout<<"\t6- Salir"<<endl;
    cout<<"-------------------------------------------------------------------"<<endl<<endl;
    cout<<"Elige opcion: ";
    cin>>op;

    return op;
}

int prioridad(Paciente paciente){
    int i;
    if(paciente.edad<=9){ //priori1
        i=0;
    }
    else if(paciente.edad<=19 && paciente.edad>=9){ //priori2
        i=1;
    }
    else if(paciente.edad<=29 && paciente.edad>=19){ //priori3
        i=2;
    }
    else if(paciente.edad<=39 && paciente.edad>=29){ //priori4
        i=3;
    }
    else if(paciente.edad<=49 && paciente.edad>=39){ //priori5
        i=4;
    }
    else if(paciente.edad<=59 && paciente.edad>=49){ //priori6
        i=5;
    }
    else if(paciente.edad<=69 && paciente.edad>=59){ //priori1
        i=6;
    }
    else if(paciente.edad<=79 && paciente.edad>=69){ //priori1
        i=7;
    }
    else{
        i=8;
    }
    return i;
}

int main()
{

    ColaPri test;
    int op;

    do{
        system("cls");

        nombre();
        op=menu();

        system("cls");

        switch(op){
            case 1:{ //1- Cargar datos desde fichero
                nombre();
                cout<<"1. Cargar datos desde fichero"<<endl<<endl;
                cadena fich;
                cout<<"Introduzca nombre del fichero a cargar:"<<endl;
                cin>>fich;
                system("cls");
                nombre();
                cout<<"1. CARGAR DATOS DESDE FICHERO"<<endl<<endl;
                if(test.cargarfichero(fich))
                    cout<<"Cargado con exito";
                else
                    cout<<"No se ha podido cargar, fichero no existente/no encontrado";
                getch();
            }break;
            case 2:{ //2- Admisión de un nuevo Paciente
                nombre();
                cout<<"2. Admision de un nuevo Paciente"<<endl<<endl;
                int i;
                Paciente paciente;
                cout<<"Introduzca datos del nuevo paciente: "<<endl;
                cout<<"Identificador: ";
                cin>>paciente.id;
                cout<<endl<<"Nombre: ";
                cin>>paciente.nombre;
                cout<<endl<<"Apellidos: ";
                cin>>paciente.apellidos;
                cout<<endl<<"Edad: ";
                cin>>paciente.edad;

                i=prioridad(paciente);

                cout<<endl<<"Prioridad: "<<i+1;
                getch();
                system("cls");

                nombre();
                cout<<"2. Admision de un nuevo Paciente"<<endl<<endl;
                test.insertarColaPri(i,paciente);


                }break;

            case 3:{ //3- Atender un Paciente
                nombre();
                cout<<"3- Atender un Paciente"<<endl<<endl;
                test.sacarColaPri();
            }break;

            case 4:{ //4- Listar Pacientes esperando para atender
                nombre();
                cout<<"4- Listar Pacientes esperando para atender"<<endl<<endl;

                ColaPri aux;
                int i;
                Paciente pac;
                if(!test.esvaciaColaPri()){
                    while(!test.esvaciaColaPri()){
                        pac=test.consultarColaPri();
                        i=prioridad(pac);
                        cout<<"ID: "<<pac.id<<endl;
                        cout<<"Nombre: "<<pac.nombre<<endl;
                        cout<<"Apellidos: "<<pac.apellidos<<endl;
                        cout<<"Edad: "<<pac.edad<<endl;
                        cout<<"Prioridad "<<i<<endl<<endl;
                        aux.insertarColaPri(i,pac);
                        test.sacarColaPri();
                    }
                    while(!aux.esvaciaColaPri()){
                        pac=aux.consultarColaPri();
                        i=prioridad(pac);
                        test.insertarColaPri(i,pac);
                        aux.sacarColaPri();
                    }
                }
                else
                    cout<<"No hay pacientes";
                getch();

            }break;

            case 5:{ //5- Listar Pacientes según prioridad
                nombre();
                cout<<"5- Listar Pacientes según prioridad"<<endl<<endl;

                int p;

                cout<<"Introduzca prioridad: ";
                cin>>p;
                p--;

                ColaPri aux;
                int i;
                Paciente pac;

                while(!test.esvaciaColaPri()){
                    pac=test.consultarColaPri();
                    i=prioridad(pac);
                    if(i==p){
                        cout<<"ID: "<<pac.id<<endl;
                        cout<<"Nombre: "<<pac.nombre<<endl;
                        cout<<"Apellidos: "<<pac.apellidos<<endl;
                        cout<<"Edad: "<<pac.edad<<endl<<endl;
                    }
                    aux.insertarColaPri(i,pac);
                    test.sacarColaPri();
                }
                while(!aux.esvaciaColaPri()){
                        pac=aux.consultarColaPri();
                        i=prioridad(pac);
                        test.insertarColaPri(i,pac);
                        aux.sacarColaPri();
                }
                getch();



            }break;

            case 6:{
                nombre();
                cout<<"6. Guardando antes de salir"<<endl<<endl;

                bool guardado;
                cadena fich;

                cout<<"Introduzca nombre del fichero en el que desea guardar los datos: ";
                cin>>fich;

                guardado=test.guardarfichero(fich);

                system("cls");
                nombre();
                cout<<"6. Guardando antes de salir"<<endl<<endl;

                if(guardado)
                    cout<<"Guardado con exito";
                else
                    cout<<"No se ha podido guardar";

                system("cls");
                nombre();
                cout<<"Saliendo..."<<endl<<endl;
                system("pause");
            }break;

            default:{
                cout<<"Por favor, introduzca una opcion valida, entre el 1 y el 6";
                system("pause");
            }break;
        }

    }while(op!=6);
    return 0;
}
