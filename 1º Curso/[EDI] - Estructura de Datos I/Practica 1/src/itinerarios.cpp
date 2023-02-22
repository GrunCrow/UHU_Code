#include "itinerarios.h"
#include <cstring>
#include <conio.h>
#include <autobuses.h>

itinerarios::itinerarios(){
    n=0;
    tam=0;
    cargado=false;
    elementos=NULL;

    //iniciar tabla a null o tabla minima
    fichero.open("Itinerarios.dat", ios::binary | ios::in | ios::out); //comprobamos si fichero existia previamente intentando abrirlo
    //modo lectura escritura

    if(fichero.fail()){ //si no existe
        fichero.clear();
        fichero.close();
        fichero.open("Itinerarios.dat", ios::out | ios::binary); //se abre en escritura para crear el fichero
        fichero.clear();
        fichero.close();
        fichero.open("Itinerarios.dat", ios::binary | ios::out | ios::in); //abrir fichero tras crearlo
    }
    else{ //fichero existe y se abre correctamente
        fichero.seekg(0,ios::beg);

        itinerario aux;
        int cont=0;
        fichero.read((char*)&aux,sizeof(itinerario));

        while(!fichero.eof()){
            fichero.read((char*)&aux,sizeof(itinerario));
            cont++;
        };

        n=cont;
    }
    fichero.close();
}

void itinerarios::Insertar(itinerario i){
    if(!cargado){
        cout<<"Itinerarios no cargados, no es posible realizar la insercion"<<endl;
        getch();
    }
    else{
        if(n==tam){ //si está lleno ampliar tabla 1º
            tam=tam+SALTO; //se incrementa espacio
            itinerario *auxiliar = new itinerario[tam];
            if(auxiliar!=NULL){
                for(int c=0;c<n;c++){
                    auxiliar[c]=elementos[c];
                }
                delete[] elementos;
                elementos=auxiliar;
            //delete[] auxiliar; con delete ppuntero se elimina a donde apunta, libera la memoria dinamica apuntada
            }
        }
        //busqueda e insertar en tabla

        int existe=0;

        existe=Buscar(i.nombre,i.matricula);

        if(existe==-1){
            elementos[n]=i;
            n++;
            cout<<endl<<"Insertado en memoria con exito"<<endl;
        }
        else
            cout<<endl<<"Ya hay un autobus con este itinerario"<<endl;
    }
}

void itinerarios::Borrar (cadena nombrei,cadena mat,int pos){ //borra el itinerario (se le
// pasa nombre itinerario y matricula o bien posición)
    if(!cargado){
        cout<<"Itinerarios no cargados, no es posible realizar borrar"<<endl;
        getch();
    }
    else{
        bool encontrado=true;
        if(pos==-1){ //borrar por matricula e itinerario
            pos=Buscar(nombrei,mat); //obtenemos posicion
            if (pos==-1) //no se encuentra
                encontrado=false; //si la posicion no existe
        }
        if (!encontrado){ //no existe en esa posicion
            cout<<"Itinerario y matricula no encontrados"<<endl;
            getch();
        }
        else{ //existe o se ha pasado por posicion
            for(int j=pos;j<n;j++){
                elementos[j]=elementos[j+1];
            }
            n--; //decremento
        }
    }
}

void itinerarios::Modificar(itinerario a, cadena nombrei, cadena mat,int pos){ //modifica el
// itinerario cuyo nombre de itinerario sea nombrei y matrícula sea mat o
// bien esté en la posición pos, con los datos del itinerario i)
    if(!cargado){
        cout<<"Itinerarios no cargados, no es posible realizar la modificacion"<<endl;
        getch();
    }
    else{
        bool encontrado=true;
        if(pos==-1){ //borrar por matricula e itinerario
            pos=Buscar(nombrei,mat); //obtenemos posicion
            if (pos==-1)
                encontrado=false; //si la posicion no existe
        }
        if (!encontrado){ //no existe en esa posicion
            cout<<"Itinerario y matricula no encontrados"<<endl;
            getch();
        }
        else{ //existe o se ha pasado por posicion
            elementos[pos]=a;
        }
    }
}

int itinerarios::Buscar(cadena nombrei,cadena mat){ //devuelve la posición del itinerario de
//nombre nombrei y matricula mat. – 1 si no lo encuentra
    int pos=-1;
    if(!cargado){
        cout<<"Itinerarios no cargados, no es posible realizar la busqueda"<<endl;
        getch();
    }
    else{
        bool existe=false;
        int c=0;
        int comp, comp2;

        while(!existe && c<n){
            comp=strcmp(nombrei,elementos[c].nombre);
            if(comp==0){ //existe el it, comprobar q no existe el autobus en ese horario
                comp2=strcmp(mat,elementos[c].matricula);
                if(comp2==0){
                    existe=true;
                }
                else
                    c++;
            }
            else
                c++;
        }

        if(existe){
            pos=c;
        }
    }

    return pos;
}

void itinerarios::Mostrar(cadena nombrei, cadena mat,int pos){ //muestra por pantalla el
// itinerario de nombre nombrei y matricula mat o bien de posición pos)
    if(!cargado){
        cout<<"Itinerarios no cargados, no es posible realizar mostrar"<<endl;
        getch();
    }
    else{
        bool encontrado=true;
        if(pos==-1)//por matricula
            //buscamos la posicion
            pos=Buscar(nombrei,mat);
            // si nos da la posicion ya la tenemos y mostramos bus directamente
            if(pos==-1)
                encontrado=false;
        //esto es comun tanto si nos da pos como matricula
        if(encontrado){
            cout<<"Itinerario "<<pos+1<<endl;
            cout<<"Nombre: "<<elementos[pos].nombre<<endl;
            cout<<"Origen: "<<elementos[pos].origen<<endl;
            cout<<"Destino:  "<<elementos[pos].destino<<endl;
            cout<<"Matricula:  "<<elementos[pos].matricula<<endl;
            cout<<"Hora de inicio:  "<<elementos[pos].inicio.h<<":"<<elementos[pos].inicio.m<<" ";
                if (elementos[pos].inicio.am)
                    cout<<"am";
                else
                    cout<<"pm";
                cout<<endl;
            cout<<"Hora de fin:  "<<elementos[pos].fin.h<<":"<<elementos[pos].fin.m<<" ";
                if (elementos[pos].fin.am)
                    cout<<"am";
                else
                    cout<<"pm";
                cout<<endl;
        }
        else{
            cout<<"No encontrado";
        }
    }
}

void itinerarios::Listar(){
    if(!cargado){
        cout<<"Itinerarios no cargados, no es posible realizar la lista"<<endl;
        getch();
    }
    else{
        for(int j=0;j<n;j++){
            cout<<"Itinerario "<<j+1<<endl;
            cout<<"Nombre: "<<elementos[j].nombre<<endl;
            cout<<"Origen: "<<elementos[j].origen<<endl;
            cout<<"Destino:  "<<elementos[j].destino<<endl;
            cout<<"Matricula:  "<<elementos[j].matricula<<endl;
            cout<<"Hora de inicio:  "<<elementos[j].inicio.h<<":"<<elementos[j].inicio.m<<" ";
                if (elementos[j].inicio.am)
                    cout<<"am";
                else
                    cout<<"pm";
                cout<<endl;
            cout<<"Hora de fin:  "<<elementos[j].fin.h<<":"<<elementos[j].fin.m<<" ";
                if (elementos[j].fin.am)
                    cout<<"am";
                else
                    cout<<"pm";
                cout<<endl<<endl;
        }
    }
}

bool itinerarios::Cargar(){ //permite cargar en memoria el fichero de itinerarios denominado
// “itinerarios.dat”. Devuelve true si correcto, false si error.

    fichero.open("Itinerarios.dat", ios::binary | ios::in | ios::out);

    if(fichero.fail()){
        cargado=false;
        fichero.clear();
    }
    else{
           if(n>tam){ //si está lleno ampliar tabla 1º
                while(n>tam){
                    tam=tam+SALTO; //se incrementa espacio hasta que haya suficiente
                }
            }

        fichero.seekg(0,ios::beg); //al inicio
        elementos = new itinerario[tam]; //creamos tabla dinamica del cn tantos espacios como itinerarios hay almacenados en el fichero

        itinerario aux;
        int cont=0;
        fichero.read((char*)&aux,sizeof(itinerario));

        while(!fichero.eof()){
            elementos[cont]=aux;
            cont++;
            fichero.read((char*)&aux,sizeof(itinerario));
        }
        cargado=true;
    }

    fichero.close();

    return cargado;
}

bool itinerarios::Guardar(){//Vuelca el contenido de la tabla dinámica (si ésta existe) al
// fichero “itinerarios.dat”
    bool guardado=false;

    if(!cargado){
        cout<<"Itinerarios no cargados, no es posible guardar"<<endl;
        getch();
    }
    else{

        fichero.open("Itinerarios.dat", ios::binary | ios::in | ios::out);

        fichero.seekp(0,ios::beg);

        if(fichero.fail()){ //si no se abre
            cout<<"ERROR";
            fichero.clear();
        }
        else{ //si se abre
            //fichero.write((char*) &n, sizeof(int));
            int c=0;
            do{ //bucle para ir escribiendo todos los autobuses q hay
                fichero.write((char*) &elementos[c], sizeof(itinerario)); //escribe el it introducido en el fichero
                c++;
            }while(n!=c);
            //guardado=true;
        }

        if(!fichero.fail())
            guardado=true;
        else
            fichero.clear();

        fichero.close();
    }

    return guardado;
}

void itinerarios::Itinerariosenintervalo(int inicio, int fin){
    //busqueda primer itinerario
    if(cargado){
        int aux;
        int ini,fi;

        for(int pos=0;pos<n;pos++){

            //gurdamos la hora del elemento en el q nos encontramos
            aux=elementos[pos].inicio.h;
            ini=aux*100;

            aux=elementos[pos].inicio.m;
            ini=ini+aux;

            aux=elementos[pos].inicio.am;

            if (aux==1)
                aux=0; //am = 0 para facilitar calculos de tiempo
            else
                aux=1;

            ini=ini+aux*10000;

            cout<<endl;

            aux=elementos[pos].fin.h;
            fi=aux*100;

            aux=elementos[pos].fin.m;
            fi=fi+aux;

            aux=elementos[pos].fin.am;

            if (aux==1)
                aux=0; //am = 0 para facilitar calculos de tiempo
            else
                aux=1;

            fi=fi+aux*10000;

            //comprobar si está dentro de la franja

            if(ini>=inicio && fi<=fin){ //si la hora de inicio es posterior o igual a la dada y la de fin es inferior o igual a la dada se lista
                Mostrar("","",pos);
            }

        }
    }
    else
        cout<<"Cargue itinerarios para realizar esto";

}


itinerarios::~itinerarios()
{
    if(elementos!=NULL)
        delete[] elementos;
}
