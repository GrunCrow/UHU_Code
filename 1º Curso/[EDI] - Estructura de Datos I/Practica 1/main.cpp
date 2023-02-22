#include <iostream>
#include <windows.h>
#include <fstream>
#include <autobuses.h>
#include <itinerarios.h>
#include <conio.h>

#include <cstdlib>
using namespace std;

int menu(){ //DEVUELVE OP
        int op;
        cout<<"----Menu principal----"<<endl;
        cout<<"1- Gestion de Autobuses"<<endl;
        cout<<"2- Gestion de Itinerarios"<<endl;
        cout<<"3- Listar itinerarios según franja horaria"<<endl;
        cout<<"4- Salir"<<endl;
        cin>>op;

        return op;
}

char menuautobuses(){ //DEVUELVE OP1
    char op1;
    cout<<"MENU AUTOBUSES"<<endl;
    cout<<"a) Insertar"<<endl;
    cout<<"b) Borrar"<<endl;
    cout<<"c) Modificar"<<endl;
    cout<<"d) Buscar"<<endl;
    cout<<"e) Listar"<<endl;
    cout<<"f) Cargar autobuses desde fichero"<<endl;
    cout<<"g) Guardar autobuses en fichero"<<endl;
    cout<<"v) Volver"<<endl;

    cin>>op1;
    op1=tolower(op1);

    return op1;
}

char menuitinerarios(){ //DEVUELVE OP2 que la guardo en op1
    char op2;

    cout<<"MENU ITINERARIOS"<<endl;
    cout<<"a) Insertar"<<endl;
    cout<<"b) Borrar"<<endl;
    cout<<"c) Modificar"<<endl;
    cout<<"d) Buscar"<<endl;
    cout<<"e) Listar"<<endl;
    cout<<"f) Cargar itinerarios desde fichero"<<endl;
    cout<<"g) Guardar itinerarios en fichero"<<endl;
    cout<<"v) Volver"<<endl;

    cin>>op2;
    op2=tolower(op2);

    return op2;
}

void pedirit(itinerario &i){

    cout<<"Introduzca datos del itinerario a insertar: "<<endl;
    cout<<"Nombre: ";
    cin>>i.nombre;
    cout<<endl;
    cout<<"Origen: ";
    cin>>i.origen;
    cout<<endl;
    cout<<"Destino: ";
    cin>>i.destino;
    cout<<endl;
    cout<<"Introduzca matricula: ";
    cin>>i.matricula;
    cout<<endl;
    cout<<"Hora de inicio: ";
    cin>>i.inicio.h;
    cout<<"min de inicio: ";
    cin>>i.inicio.m;
    cout<<"tramo de inicio (1 si am/0 si pm)";
    cin>>i.inicio.am;
    cout<<endl;
    cout<<"Hora de fin: ";
    cin>>i.fin.h;
    cout<<"min de fin: ";
    cin>>i.fin.m;
    cout<<"tramo de fin (1 si am/0 si pm)";
    cin>>i.fin.am;
    cout<<endl;
}

void listaritinerarios(){
    cout<<"Hora inicio: "<<endl;
    cout<<"Hora fin: "<<endl;
}

int main()
{
    int op;
    char op1;
    autobuses bus;
    itinerarios it;
    bool realizado;

    //MENU

    do{
        system("cls");
        op=menu();
        system("cls");
       switch(op){
           //case 1 MENU GESTION DE AUTOBUSES
           case 1:
               do{
                    system("cls");
                    op1=menuautobuses();
                    system("cls");
                    //switch(op1)
                    switch(op1){
                    case 'a':{ //Insertar
                        cout<<"MENU AUTOBUSES"<<endl;
                        cout<<"a) Insertar autobus"<<endl<<endl;
                        autobus a;
                        cout<<"Introduzca datos del autobus a insertar"<<endl;
                        cout<<"Matricula :";
                        cin>>a.matricula;
                        cout<<endl;
                        cout<<"Introduzca el estado (activo=1, no activo=0) ";
                        cin>>a.e.activo;
                        cout<<endl;
                        cout<<"Introduzca el estado del deposito (litros) ";
                        cin>>a.e.deposito;
                        cout<<endl;
                        cout<<"Introduzca n de plazas ";
                        cin>>a.e.plazas;
                        cout<<endl;
                        cout<<"Introduzca si ha pasado la itv (si=1, no=0) ";
                        cin>>a.e.itv;
                        cout<<endl;
                        cout<<"Introduzca el identificador del conductor ";
                        cin>>a.conductor;
                        cout<<endl;
                        system("cls");
                        bus.Insertar(a);
                        system("pause");
                    }break;
                    case 'b':{ //borrar
                        cout<<"MENU AUTOBUSES"<<endl;
                        cout<<"b) Borrar autobus"<<endl<<endl;
                        char opb;
                        int pos=-1;
                        cadena matricula;
                        cout<<"Introduzca si prefiere eliminar autobus por matricula (m) o pos (p): ";
                        cin>>opb;
                        cout<<endl;
                        opb=tolower(opb);
                        switch(opb){
                        case 'm':{
                            cout<<"Introduzca matricula: ";
                            cin>>matricula;
                            if (bus.Buscar(matricula)!=-1)
                                bus.Borrar(matricula,pos);
                        }break;
                        case 'p':{
                            cout<<"Introduzca posicion (de 1 a n):";
                            cin>>pos; //se supone que el usuario introducira una posicion valida (por tanto mayor de 0 y nunca -1)
                            pos--;
                            bus.Borrar("",pos);
                        }break;
                        default:
                            cout<<"Opción no valida"<<endl;
                        break;
                        }
                    }break;
                    case 'c':{ //modificar
                        cout<<"MENU AUTOBUSES"<<endl;
                        cout<<"c) Modificar autobus"<<endl<<endl;
                        char opc;
                        cadena matricula;
                        autobus c;
                        int pos;
                        cout<<"Introduzca si prefiere modificar autobus por matricula (m) o pos (p): ";
                        cin>>opc;
                        cout<<endl;
                        opc=tolower(opc);
                        switch(opc){
                        case 'm':{
                            cout<<"Introduzca matricula del autobus a modificar: ";
                            cin>>matricula;
                            cout<<endl;
                            pos=bus.Buscar(matricula);
                            if(pos!=-1){
                                cout<<"Introduzca datos del nuevo autobus a modificar"<<endl;
                                cout<<"Matricula :";
                                cin>>c.matricula;
                                cout<<endl;
                                cout<<"Introduzca el estado (activo=1, no activo=0) ";
                                cin>>c.e.activo;
                                cout<<endl;
                                cout<<"Introduzca el estado del deposito (litros) ";
                                cin>>c.e.deposito;
                                cout<<endl;
                                cout<<"Introduzca n de plazas ";
                                cin>>c.e.plazas;
                                cout<<endl;
                                cout<<"Introduzca si ha pasado la itv (si=1, no=0) ";
                                cin>>c.e.itv;
                                cout<<endl;
                                cout<<"Introduzca el identificador del conductor ";
                                cin>>c.conductor;
                                cout<<endl;
                                bus.Modificar(c,matricula,-1);
                            }
                        }break;
                        case 'p':{
                            int pos;
                            cout<<"Introduzca posicion (del 1 a n):";
                            cin>>pos;
                            pos--;
                            cout<<endl;
                            cout<<"Introduzca datos del nuevo autobus a modificar"<<endl;
                            cout<<"Matricula :";
                            cin>>c.matricula;
                            cout<<endl;
                            cout<<"Introduzca el estado (activo=1, no activo=0) ";
                            cin>>c.e.activo;
                            cout<<endl;
                            cout<<"Introduzca el estado del deposito (litros) ";
                            cin>>c.e.deposito;
                            cout<<endl;
                            cout<<"Introduzca n de plazas ";
                            cin>>c.e.plazas;
                            cout<<endl;
                            cout<<"Introduzca si ha pasado la itv (si=1, no=0) ";
                            cin>>c.e.itv;
                            cout<<endl;
                            cout<<"Introduzca el identificador del conductor ";
                            cin>>c.conductor;
                            cout<<endl;
                            bus.Modificar(c,"",pos);
                        }break;
                        default:
                            cout<<"Opción no valida"<<endl;
                            break;
                        }
                    }break;
                    case 'd':{ //mostrar autobus = buscar
                        //pedir bus a buscar y poner datos del bus buscado
                        cout<<"MENU AUTOBUSES"<<endl;
                        cout<<"d) Buscar autobus"<<endl<<endl;
                        autobus d;
                        int pos=-1;
                        char opc;

                        cout<<"Introduzca si prefiere modificar autobus por matricula (m) o pos (p): ";
                        cin>>opc;
                        cout<<endl;
                        opc=tolower(opc);

                        switch(opc){
                        case 'm':{
                            cout<<"Introduzca matricula del autobus que desea buscar: ";
                            cin>>d.matricula;
                            system("cls");
                            if(bus.Buscar(d.matricula)!=-1){
                                bus.Mostrar(d.matricula,pos); //como mostrar llama a buscar paara obtener la posicion, llamamos directamente a mostrar
                                system("pause");               //pos tiene el valor de -1 inciial
                            }
                        }break;
                        case 'p':{
                            cout<<"Introduzca posicion del autobus que desea buscar (del 1 a n): ";
                            cin>>pos; //suponemos q mete una posicion positiva y por tanto nunca será <0 (no -1)
                            pos--; //decrementamos a numeracion de c
                            system("cls");
                            bus.Mostrar("",pos);
                            system("pause");
                        }break;
                        }
                    }break;
                    case 'e':{ //listar
                        cout<<"MENU AUTOBUSES"<<endl;
                        cout<<"e) Listar autobuses"<<endl<<endl;
                        bus.Listar();
                        system("pause");
                        system("cls");
                        }break;
                    case 'f':{ //cargar autobuses desde fichero
                        cout<<"MENU AUTOBUSES"<<endl;
                        cout<<"f) Cargar autobuses desde fichero"<<endl<<endl;
                        realizado=bus.Cargar();
                        if(realizado){
                            cout<<"CARGADO"<<endl;
                            getch();
                        }
                        else{
                            cout<<"No realizado"<<endl;
                            getch();
                        }
                        }break;
                    case 'g':{ //guardar autobuses en fichero
                        cout<<"MENU AUTOBUSES"<<endl;
                        cout<<"d) Guardar autobuses en fichero"<<endl<<endl;
                        realizado=bus.Guardar();
                        if(realizado){
                            cout<<"GUARDADO"<<endl;
                            getch();
                        }
                        else{
                            cout<<"No realizado"<<endl;
                            getch();
                        }
                        }break;
                    case 'v':{
                        }break;
                    default:{
                        cout<<"Introduzca una opcion valida";
                        getch();
                        }break;
                    }
                }while(op1!='v');
            break;

            //case 2 MENU GESTION DE ITINERARIOS
            case 2:
                do{
                    system("cls");
                    op1=menuitinerarios();
                    system("cls");

                    //switch(op1)
                    switch(op1){
                    case 'a':{ //insertar
                        itinerario i;
                        pedirit(i); //pedir itinerario i
                        system("cls");
                        it.Insertar(i);
                        }break;
                    case 'b':{ //borrar
                        cadena nombrei;
                        cadena mat;
                        char opb;
                        cout<<"Introduzca si prefiere eliminar itinerario por matricula y nombre (m) o pos (p): ";
                        cin>>opb;
                        cout<<endl;
                        opb=tolower(opb);
                        switch(opb){
                            case 'm':{
                                cout<<"Introduzca matricula: ";
                                cin>>mat;
                                cout<<endl<<"Introduzca nombre: ";
                                cin>>nombrei;
                                getch();
                                system("cls");
                                it.Borrar(nombrei,mat,-1);
                            }break;
                            case 'p':{
                                int pos;
                                cout<<"Introduzca posicion (de 1 a n):";
                                cin>>pos; //se supone que el usuario introducira una posicion valida (por tanto mayor de 0 y nunca -1)
                                pos--;
                                getch();
                                system("cls");
                                it.Borrar("","",pos);
                            }break;
                            default:
                                cout<<"Opción no valida"<<endl;
                            break;
                        }
                        getch();
                        system("cls");
                        }break;

                    case 'c':{ //modificar
                        itinerario i;
                        char opb;
                        cadena mat;
                        cadena nombrei;
                        cout<<"Introduzca si prefiere modificar itinerario por matricula y nombre (m) o pos (p): ";
                        cin>>opb;
                        cout<<endl;
                        opb=tolower(opb);
                        switch(opb){
                        case 'm':{
                            cout<<"Introduzca matricula: ";
                            cin>>mat;
                            cout<<endl<<"Introduzca nombre: ";
                            cin>>nombrei;
                            getch();
                            system("cls");
                            pedirit(i);
                            getch();
                            system("cls");
                            it.Modificar(i,nombrei,mat,-1);
                        }break;
                        case 'p':{
                            int pos;
                            cout<<"Introduzca posicion (de 1 a n):";
                            cin>>pos; //se supone que el usuario introducira una posicion valida (por tanto mayor de 0 y nunca -1)
                            pos--;
                            getch();
                            system("cls");
                            pedirit(i);
                            getch();
                            system("cls");
                            it.Modificar(i,"","",pos);
                        }break;
                        default:
                            cout<<"Opción no valida"<<endl;
                        break;
                        }
                        getch();
                        system("cls");
                        }break;

                    case 'd':{ //buscar
                        cadena mat;
                        cadena nombrei;
                        int pos;
                        cout<<"Introduzca matricula: ";
                        cin>>mat;
                        cout<<endl<<"Introduzca nombre: ";
                        cin>>nombrei;
                        getch();
                        system("cls");
                        pos=it.Buscar(nombrei,mat);
                        it.Mostrar("","",pos);
                        getch();
                        system("cls");
                        }break;
                    case 'e':{ //listar
                        it.Listar();
                        getch();
                        system("cls");
                        }break;
                    case 'f':{ //cargar
                        realizado=it.Cargar();
                        if(realizado){
                            cout<<"Cargado con exito";
                            getch();
                            system("cls");
                        }
                        else{
                            cout<<"No cargado";
                            getch();
                            system("cls");
                        }
                        }break;
                    case 'g':{ //guardar
                        realizado=it.Guardar();
                        if(realizado){
                            cout<<"Guardado con exito";
                            getch();
                            system("cls");
                        }
                        else{
                            cout<<"No guardado";
                            getch();
                            system("cls");
                        }
                        }break;
                    case 'v':{
                        cout<<"Volviendo...";
                        getch();
                        system("cls");
                    }break;
                    default:{
                        cout<<"Introduzca una opcion valida";
                        getch();
                        system("cls");
                    }break;
                    }
                }while(op1!='v'); //se sale del bucle si indica volver
            break;

            //case 3
            case 3:
                int aux, inicio, fin;
                cout<<"\nIntroduce la hora de inicio del itinerario a buscar: ";
                cin>>aux;
                inicio=aux*100;
                cout<<"\nIntroduce los minutos de inicio del itinerario a buscar: ";
                cin>>aux;
                inicio=inicio+aux;
                cout<<"\nIntroduce si es am(1) o no(0) ";
                cin>>aux;
                if (aux==1)
                    aux=0; //am = 0 para facilitar calculos de tiempo
                else
                    aux=1;

                inicio=inicio+aux*10000;

                cout<<endl;

                cout<<"\nIntroduce la hora de fin del itinerario a buscar: ";
                cin>>aux;
                fin=aux*100;

                cout<<"\nIntroduce los minutos de fin del itinerario a buscar: ";
                cin>>aux;
                fin=fin+aux;

                cout<<"\nIntroduce si es am(1) o no(0) ";
                cin>>aux;

                if (aux==1)
                    aux=0; //am = 0 para facilitar calculos de tiempo
                else
                    aux=1;

                fin=fin+aux*10000;

                system("cls");

                it.Itinerariosenintervalo(inicio,fin);

                system("pause");
                system("cls");

                listaritinerarios(); //meter en un bucle para hacer tantas veces como itinerarios haya
            break;

            //case 4
            case 4:
                cout<<"Saliendo...";
            break;

            //default
            default:
                cout<<"Introduzca una opcion valida (entre 1 y 4)"<<endl;
                system("pause");
            break;
       }
    }while(op!=4);


    return 0;
}
