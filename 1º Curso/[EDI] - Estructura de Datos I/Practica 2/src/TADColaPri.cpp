#include "TADColaPri.h"
#include "fstream"

int priori(Paciente paciente){
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

ColaPri::ColaPri(){ //Constructor: crea un objeto ColaPri vacío
    //delete [] tabla;
    for(int i=0;i<MAXcolas;i++){
        if (!tabla[i].esvacia()){
            //for(int j=0;j<tabla[i].longitud();j++){
            while(!tabla[i].esvacia()){
                tabla[i].desencolar();
            }
        }
    }
}

ColaPri::~ColaPri(){ //Destructor: libera la memoria dinámica del objeto ColaPri
    //delete [] tabla;
}

void ColaPri::insertarColaPri(int i, Paciente p){
/*Insertará el paciente p en la cola de prioridad i de la ColaPri*/
    tabla[i].encolar(p);
}

void ColaPri::sacarColaPri(){
/*Elimina el paciente de mayor prioridad. Si hay varios con la misma
prioridad saldrá aquel que lleve más tiempo en el objeto ColaPri*/
    if(!esvaciaColaPri()){
        int i=0;
        while(tabla[i].esvacia() && i<9){
            i++; //para colocarnos en la tabla tabla de mayor prioridad que no esté vacía
        }
        //OBTENEMOS EN i LA PRIMERA PRIORIDAD Q NO ESTA VACIA

        if(i<9) //si i<9 quiere decir que no está todo vacío
            tabla[i].desencolar();
    }
}

Paciente ColaPri::consultarColaPri(){
/*Devuelve el paciente de mayor prioridad almacenado en el objeto ColaPri
original sin quitarlo. Si hay varios con la misma prioridad saldrá aquel
que lleve más tiempo en el objeto ColaPri*/
    Paciente pac;

    int i=0;
    while(tabla[i].esvacia()){
        i++; //para colocarnos en la tabla tabla de mayor prioridad que no esté vacía
    }

    pac=tabla[i].primero();

    return pac;
}

bool ColaPri::esvaciaColaPri(){//Devuelve si el objeto ColaPri está vacío
    bool vacio=false;

    int i=0;
    while(tabla[i].esvacia() && i<9){
        i++; //para colocarnos en la tabla tabla de mayor prioridad que no esté vacía
    }

    if(i==9)
        vacio=true;

    return vacio;
}

int ColaPri::longitudColaPri(){//Devuelve la longitud del objeto ColaPri
    int n=0;
    int i=0;

    while(i<9){
        if(!tabla[i].esvacia()){
            n=n+tabla[i].longitud(); //suma numeros de elementos en la prioridad actual
        }
        i++;
    }

    return n;
}

bool ColaPri::cargarfichero (cadena fich){
/*Cargará los datos almacenados en el fichero cuyo nombre se pasa como
parámetro en el objeto ColaPri. Devuelve true si no hay error en la carga*/
    bool cargado=false;

    fstream fichero;
    fichero.open(fich, ios::binary | ios::in | ios::out);

    if(fichero.fail()){
        cargado=false;
        fichero.clear();
    }
    else{
        Paciente aux;
        int i;

        fichero.seekg(sizeof(int),ios::beg); //al inicio

        fichero.read((char*)&aux,sizeof(Paciente)); //lectura anticipada

        while(!fichero.eof()){
            i=priori(aux);
            tabla[i].encolar(aux);
            fichero.read((char*)&aux,sizeof(Paciente));
        }
        cargado=true;
    }

    fichero.close();

    return cargado;
}

bool ColaPri::guardarfichero (cadena fich){
/*Guardará los datos del objeto ColaPri en el fichero cuyo nombre se pase
como parámetro. Devuelve true si no hay error al guardar el objeto*/
    bool guardado=false;

    fstream fichero;
    fichero.open(fich, ios::binary | ios::in | ios::out);

    if(fichero.fail()){ //si no se abre==no existe -> crear fichero
            fichero.clear();
            fichero.close();
            fichero.open(fich, ios::out | ios::binary); //se abre en escritura para crear el fichero
            fichero.close();
    }
    fichero.seekg(0,ios::beg);
    int i=0;
    Paciente pac;
    ColaPri aux;

    i=longitudColaPri();

    fichero.write((char*) &i, sizeof(int));

        while(!esvaciaColaPri()){
            pac=consultarColaPri();
            i=priori(pac);
            aux.insertarColaPri(i,pac);
            sacarColaPri();
            fichero.write((char*) &pac, sizeof(Paciente));
        }
        while(!aux.esvaciaColaPri()){
            pac=aux.consultarColaPri();
            i=priori(pac);
            insertarColaPri(i,pac);
            aux.sacarColaPri();
        }


    /*while(i<MAXcolas){ //bucle para ir escribiendo todos los pacientes q hay
        aux=tabla[i];
        while(!aux.esvacia()){
            pac=aux.primero();
            fichero.write((char*) &pac, sizeof(Paciente)); //escribe el paciente
            aux.desencolar();
            i++;
        }
    }
    */

    if(!fichero.fail())
        guardado=true;
    else
        fichero.clear();

    fichero.close();

    return guardado;
}
