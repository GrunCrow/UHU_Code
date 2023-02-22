#include <iostream>
#include <fstream>
#include <conio.h>
#include <windows.h>
#include "TADColaPri.h"
#include "tadcola.h"
#include "time.h"
#include "TNodo_ListaD.h"
#include "TNodo_ListaC.h"

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
    cout<<"\t6- Listar Pacientes Atendidos"<<endl;
    cout<<"\t7- Salir"<<endl;
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

void listarpac(Paciente pac){
    cout<<"ID: "<<pac.id<<endl;
    cout<<"Nombre: "<<pac.nombre<<endl;
    cout<<"Apellidos: "<<pac.apellidos<<endl;
    cout<<"Edad: "<<pac.edad<<endl;
}

int main(){

    srand((unsigned) time(NULL));

    ColaPri test;
    TNodo_ListaD masc;
    TNodo_ListaC fem;
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

                cout<<endl<<"Prioridad: "<<i;
                getch();
                system("cls");

                nombre();
                cout<<"2. Admision de un nuevo Paciente"<<endl<<endl;
                test.insertarColaPri(i,paciente);


                }break;

            case 3:{ //3- Atender un Paciente
                nombre();
                cout<<"3- Atender un Paciente"<<endl<<endl;

                Paciente p;
                int genre;

                if(!test.esvaciaColaPri()){
                    p=test.consultarColaPri();
                    test.sacarColaPri();

                    genre = (rand()%100)+1;

                    //genre=4; //Prueba obligar a masculino
                    //genre=3; //obligar a femenino

                    if(genre%2==0){ //par = masc
                        int pos=masc.longitud(); //para insertar al final
                        masc.insertar(p,pos);
                        cout<<"Paciente masculino atendido";
                    }
                    else{ //impar = fem
                        int pos=fem.longitud(); //para insertr al final
                        fem.insertar(p,pos);
                        cout<<"Paciente femenino atendido";
                    }
                }
                else
                    cout<<"No hay mas pacientes";

                getch();

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
                        listarpac(pac);
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
                        listarpac(pac);
                        cout<<endl<<endl;
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

            case 6:{ //LISTAR ATENDIDOS
                nombre();
                cout<<"6. Listar Pacientes Atendidos"<<endl<<endl;

                int ops;

                do{

                cout<<"Introduzca si desea listar pacientes femeninos (0), masculinos (1) o ambos (2): ";
                cin>>ops;
                }while(ops!=0 && ops!=1 && ops!=2);

                switch(ops){
                case 0:{ //femeninos
                    int n=fem.longitud();
                    if(n!=0){
                        int cont=1;
                        Paciente p;

                        while (cont<=n){
                            p=fem.observar(cont);
                            listarpac(p);
                            cout<<endl<<endl;
                            cont++;
                        }
                    }
                    else
                        cout<<"No hay pacientes femeninos atendidos";
                    getch();
                }break;

                case 1:{ //masculinos
                    int n=masc.longitud();
                    if(n!=0){
                        int cont=1;
                        Paciente p;
                        while (cont<=n){
                            p=masc.observar(cont);
                            listarpac(p);
                            cout<<endl<<endl;
                            cont++;
                        }
                    }
                    else
                        cout<<"No hay pacientes masculinos atendidos";
                    getch();
                }break;

                case 2:{
                    int n=masc.longitud();
                    if(n!=0){
                        int cont=1;
                        Paciente p;

                        while (cont<=n){
                            p=masc.observar(cont);
                            listarpac(p);
                            cout<<endl<<endl;
                            cont++;
                        }
                    }
                    else
                        cout<<"No hay pacientes masculinos atendidos"<<endl<<endl;
                    n=fem.longitud();

                    if(n!=0){
                        int cont=1;
                        Paciente p;

                        while (cont<=n){
                            p=fem.observar(cont);
                            listarpac(p);
                            cout<<endl<<endl;
                            cont++;
                        }
                    }
                    else
                        cout<<"No hay pacientes femeninos atendidos"<<endl<<endl;
                    getch();
                }break;

                }   //fin switch

            }break;

            case 7:{
                nombre();
                cout<<"7. Guardando antes de salir"<<endl<<endl;

                bool guardado;
                cadena fich;

                cout<<"Introduzca nombre del fichero en el que desea guardar los datos: ";
                cin>>fich;

                guardado=test.guardarfichero(fich);

                system("cls");
                nombre();
                cout<<"7. Guardando antes de salir"<<endl<<endl;

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

    }while(op!=7);
    return 0;
}
