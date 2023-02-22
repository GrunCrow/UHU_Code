#include "autobuses.h"
#include <cstring>
#include <conio.h>

autobuses::autobuses(){

    n=0;
    tam=0;
    cargado=false;
    elementos=NULL; //se guarda en la tabla elemento, 4 espacios del tamaño autobus, para 4 autobuses

    //iniciar tabla a null o tabla minima

    fichero.open("Autobuses.dat", ios::binary | ios::in | ios::out); //comprobamos si fichero existia previamente intentando abrirlo
    //modo lectura escritura
    if(fichero.fail()) //si no existe
    {
        fichero.clear();
        fichero.close();
        fichero.open("Autobuses.dat", ios::out | ios::binary); //se abre en escritura para crear el fichero
        fichero.clear();
        fichero.close();
        fichero.open("Autobuses.dat", ios::binary | ios::out | ios::in); //abrir fichero tras crearlo
        //fichero.seekp(0,ios::beg);
        fichero.write((char*)&n,sizeof(int));
    }
    else{
        fichero.seekg(0,ios::beg);
        fichero.read((char*)&n,sizeof(int));
    }

    fichero.close(); //cerramos el fichero para que no de error posteriormente
}

autobuses::~autobuses()
{
    if(elementos!=NULL)
        delete[] elementos;
}

void autobuses::Insertar(autobus a){ //Insertar=> solicita los datos del autobús y lo inserta en la tabla dinámica o fichero,
                                    //al final. No se permite una matrícula repetida
    if(cargado){ //fichero no cargado en memoria
        if(n%SALTO==0){ //si está lleno ampliar tabla 1º
            tam=tam+SALTO; //se incrementa espacio
            autobus *auxiliar = new autobus[tam];
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
        bool existe=false;
        int i=0;
        int comp;

        while(!existe && i<n){
            comp=strcmp(a.matricula,elementos[i].matricula);
            if(comp==0)
                existe=true;
            else
                i++;
        }

        if(!existe){
            elementos[n]=a;
            n++;
            cout<<endl<<"Insertado en memoria con exito"<<endl;
        }
        else
            cout<<endl<<"El autobus ya existe"<<endl;
    }
    else{ //hacer ahora lo de insertar en el fichero no cargado
            int existe;
            existe=Buscar(a.matricula);

            if(existe!=-1){
                cout<<"El autobus ya existe"<<endl;
            }
            else{
                cout<<endl<<"Insertado en fichero con exito";
                fichero.open("Autobuses.dat", ios::binary |ios::in | ios::out);
                fichero.seekp(0,ios::beg); //principio
                n++; //incrementamos
                fichero.write((char *)&n, sizeof(int)); //escribimos nuevo n
                fichero.seekp(0,ios::end); //al final para insertar
                fichero.write((char *)&a, sizeof (autobus)); //escribe el autobus introducido en el fichero

                fichero.close();
            }
    }
}
void autobuses::Borrar(cadena mat,int pos){ //Borrar=> Solicita la matrícula o posición del autobús y lo elimina de la tabla
//dinámica o fichero. Es decir, se puede actuar por matrícula o posición. Si no existe se muestra mensaje de error
    if(cargado){
        if(pos==-1) //borrar por matricula
        {
            bool encontrado=false;
            pos=0;
            int comp;
            while (!encontrado && pos<n){
                comp=strcmp(mat,elementos[pos].matricula);
                if (comp==0)
                    encontrado=true;
                else
                    pos++;
            }

            if (!encontrado)
                cout<<"El autobus no existe";
            else{
                for(int j=pos;j<n;j++){
                    elementos[j]=elementos[j+1];
                }
                n--;
            }
        }
        else //borrar por pos
        {
            for(int j=pos;j<n;j++){
                elementos[j]=elementos[j+1];
            }
            n--;
        }
    }
    else{ //esta cargado, borrar en fichero
        fichero.open("Autobuses.dat", ios::binary |ios::in | ios::out);

        autobus aux;

        if(pos==-1) //por matricula
            pos=Buscar(mat);

        //por posicion, comun para ambas partes, fuera del if
        if(pos!=-1){
            fichero.seekg(sizeof(int),ios::beg); //nos colocamos despues de la n

            for(int i=pos;i<n;i++){
                fichero.seekg(sizeof(autobus)*pos+1,ios::cur); //nos colocamos antes del autobus a copiar (sig a eliminar)
                fichero.read((char *)&aux,sizeof(autobus));
                fichero.seekp(sizeof(autobus)*(-2),ios::cur);
                fichero.write((char *)&aux,sizeof(autobus));
            }

            n--;
            fichero.seekp(0,ios::beg);
            fichero.write((char *)&n,sizeof(int)); //decrementamos n


            if(fichero.fail()){
                cout<<"Error";
                fichero.clear();
                getch();
            }
            else{
                cout<<"Borrado con exito"<<endl;
                getch();
            }
        }
        fichero.close();
    }
}
void autobuses::Modificar(autobus a, cadena mat,int pos){ //Modificar=>Solicita matrícula o posición y si existe el autobús,
                                            //solicita los nuevos datos para modificar. Si no existe muestra mensaje de error.
    if(cargado){
        if(pos==-1){ //modifica por matricula
            pos=Buscar(mat);
            if(pos!=-1){
                elementos[pos]=a;
            }
        }
        else{
            if(pos<n){
                elementos[pos]=a;
            }
            else
                cout<<"Posicion no valida"<<endl;
        }
    }
    else{ //esta cargado, modificar en fichero
        fichero.open("Autobuses.dat", ios::binary |ios::in | ios::out);

        autobus aux;

        if(pos==-1) //por matricula
            pos=Buscar(mat);

        //por posicion, comun para ambas partes, fuera del if

        fichero.seekp(sizeof(int),ios::beg); //nos colocamos al principio, tras el numero de autobuses
        fichero.seekp (sizeof(autobus)*pos,ios::cur); //nos colocamos antes del autobus a modificar
        fichero.write((char *)&a,sizeof(autobus));

        if(fichero.fail()){
            cout<<"Error";
            fichero.clear();
            getch();
        }
        else{
            cout<<"Modificado con exito"<<endl;
            getch();
        }
        fichero.close();
    }
}
void autobuses::Listar(){ //Listar=> Lista los autobuses por pantalla. -- todos
    if(cargado){
        for(int i=0;i<n;i++){
            cout<<"Autobus "<<i+1<<endl;
            cout<<"Matricula: "<<elementos[i].matricula<<endl;
            cout<<"Conductor: "<<elementos[i].conductor<<endl;
            cout<<"Activo:    ";
                if(elementos[i].e.activo)
                    cout<<"Si"<<endl;
                else
                    cout<<"No"<<endl;
            cout<<"Deposito:  "<<elementos[i].e.deposito<<endl;
            cout<<"Plazas:    "<<elementos[i].e.plazas<<endl;
            cout<<"ITV:       ";
                    if(elementos[i].e.itv)
                        cout<<"Si"<<endl;
                    else
                        cout<<"No"<<endl;
            cout<<endl<<endl;
        }
    }
    else{ //listar en fichero
    fichero.open("Autobuses.dat", ios::binary |ios::in | ios::out);

    autobus aux;
    fichero.seekg(0,ios::beg); //inicio
    fichero.read((char* )&n, sizeof (int)); //ya tenemos los auutobses q tenemos para listar
    for (int i=0;i<n;i++){
        fichero.read((char* )&aux, sizeof (autobus));
        cout<<"Autobus "<<i+1<<endl;
        cout<<"Matricula: "<<aux.matricula<<endl;
            cout<<"Conductor: "<<aux.conductor<<endl;
            cout<<"Activo:    ";
                if(aux.e.activo)
                    cout<<"Si"<<endl;
                else
                    cout<<"No"<<endl;
            cout<<"Deposito:  "<<aux.e.deposito<<endl;
            cout<<"Plazas:    "<<aux.e.plazas<<endl;
            cout<<"ITV:       ";
                if(aux.e.itv)
                    cout<<"Si"<<endl;
                else
                    cout<<"No"<<endl;
            cout<<endl<<endl;
    }

    fichero.close();
    }
}
int autobuses::Buscar(cadena mat){ //Buscar => solicita matrícula o posición y si existe el autobús, muestra sus datos por pantalla.
                                //Si no existe muestra mensaje de error.
    int i=0;
    bool encontrado=false;

    if(cargado){
        int comp;
        while(!encontrado && i<n){
            comp=strcmp(mat,elementos[i].matricula);
            if(comp==0)
                encontrado=true;
            else
                i++;
        }; //si existe i es la pos
    }
    else{
        fichero.open("Autobuses.dat", ios::binary |ios::in | ios::out);
        fichero.seekg(0,ios::beg); //posicion al principio
        fichero.read((char *)&n, sizeof (int)); //guardamos en nn numero de autobuses n
        autobus b; //array de autobuses con espacio para n autobuses
        while (i<n && !encontrado){ //con un while, es una busqueda
            fichero.read((char *)&b,sizeof(autobus)); //va guardando en la tabla todos los autobuses
            if(strcmp(b.matricula,mat)==0)
                encontrado=true;
            else
                i++;
        }
        fichero.close();
    }

    if(!encontrado){
        i=-1;
        cout<<"Autobus no encontrado"<<endl;
    }


    return i; //devuelve posicion del autobus -- falta poner en el menu los datos del bus
                //i+1 porq la pos 3 de la tabla=4 - poner esto en el menu

}
void autobuses::Mostrar(cadena mat,int pos){ //muestra el autobus mandado por pantalla

    if(cargado){
        if(pos==-1)//por matricula
            //buscamos la posicion
            pos=Buscar(mat);
            // si nos da la posicion ya la tenemos y mostramos bus directamente
        //esto es comun tanto si nos da pos como matricula
        cout<<"Autobus "<<pos+1<<endl; //para mostrar los numeros naturales para una persona (en vez del 0 a n-1 de 1 a n)
        cout<<"Matricula: "<<elementos[pos].matricula<<endl;
        cout<<"Conductor: "<<elementos[pos].conductor<<endl;
        cout<<"Activo:    ";
            if(elementos[pos].e.activo)
                cout<<"Si"<<endl;
            else
                cout<<"No"<<endl;
        cout<<"Deposito:  "<<elementos[pos].e.deposito<<endl;
        cout<<"Plazas:    "<<elementos[pos].e.plazas<<endl;
        cout<<"ITV:       ";
            if(elementos[pos].e.itv)
                cout<<"Si"<<endl;
            else
                cout<<"No"<<endl;
    }
    else{
        fichero.open("Autobuses.dat", ios::binary |ios::in | ios::out);
        autobus aux;
        if(pos==-1){ //por matricula
            //buscamos la posicion
            pos=Buscar(mat);
        }
        //una vez tenemos la pos el algoritmo es común, por eso terminamos el if y siempre se realizará para la búsqueda:

        fichero.seekg(sizeof(int),ios::beg);
        fichero.seekg(sizeof(autobus)*pos,ios::cur);
        fichero.read((char *)&aux,sizeof(autobus));

        cout<<"Autobus "<<pos+1<<endl; //para mostrar los numeros naturales para una persona (en vez del 0 a n-1 de 1 a n)
        cout<<"Matricula: "<<aux.matricula<<endl;
        cout<<"Conductor: "<<aux.conductor<<endl;
        cout<<"Activo:    ";
            if(aux.e.activo)
                cout<<"Si"<<endl;
            else
                cout<<"No"<<endl;
        cout<<"Deposito:  "<<aux.e.deposito<<endl;
        cout<<"Plazas:    "<<aux.e.plazas<<endl;
        cout<<"ITV:       ";
            if(aux.e.itv)
                cout<<"Si"<<endl;
            else
                cout<<"No"<<endl;

        fichero.close();
    }
}
bool autobuses::Cargar(){ //Cargar=> Permite cargar en memoria los datos del fichero de autobuses

    fichero.open("Autobuses.dat", ios::binary | ios::in | ios::out);


        //error: falla el nuevo tamaño del array -> ampliar tamaño ??

    /*if(n%SALTO==0){ //si está lleno ampliar tabla 1º
        int ntam; //nuevo tamaño
        ntam=tam+SALTO; //se incrementa espacio
        autobus *auxiliar = new autobus[ntam];
        for(int i=0;i<n;i++){
            auxiliar[i]=elementos[i];
        }
        delete[] elementos;
        elementos = new autobus[ntam];
        elementos=auxiliar;
        tam=ntam;
        delete[] auxiliar;
    }*/

    if(fichero.fail()){
        cargado=false;
        fichero.clear();
    }
    else{
        fichero.seekg(0,ios::beg); //al inicio
        fichero.read((char*)&n,sizeof(int));

        autobus aux; //una variable de tipo autobus para guardar los datos de cada autobus q vayamos a guardar en la tabla dentro del for
        elementos= new autobus[n]; //creamos tabla dinamica del cn tantos espacios como autobuses hay almacenados en el fichero

        for(int i=0;i<n;i++){
            fichero.read((char*) &aux,sizeof(autobus)); //guardamos en f  el autobus actual
            elementos[i]=aux; //guardamos en el elemento correspondiente el autobus
        }

        cargado=true;
    }

    fichero.close();

    return cargado;
}
bool autobuses::Guardar() {//Guardar=> Vuelca el contenido de la tabla dinámica (si ésta existe) a fichero. En dicho
//volcado los datos de los autobuses se graban ordenados por número de matrícula (puede
//utilizar el algoritmo de ordenación que desee)
    bool guardado=false;
    if(cargado){
        fichero.open("Autobuses.dat", ios::binary |ios::in | ios::out);
        //ofstream fichero("Autobuses.dat",ios::binary); //abrimos para escritura, modo binario y nos colocamos al principio
        fichero.seekp(0,ios::beg);

            if(fichero.fail()){ //si no se abre
                cout<<"ERROR";
                fichero.clear();
            }
            else{ //si se abre

                //reordenar
                int pos,ele;
                autobus aux;

                for (pos=0; pos<n-1; pos++){ //contador que calcula que se haga tantas vees como elemento tiene
                //fin es la posición final valida (n-1)
                    for (ele=n-1; ele>pos; ele--){
                        if(strcmp(elementos[ele-1].matricula,elementos[ele].matricula)>0){
                            //intercambiar(celda[ele-1],celda[ele]);
                            //Función genérica que tendrá que ser implementada
                            aux=elementos[ele-1];
                            //strcpy(aux.matricula,elementos[ele-1].matricula);
                            elementos[ele-1]=elementos[ele];
                            //strcpy(elementos[ele-1].matricula,elementos[ele].matricula);
                            elementos[ele]=aux;
                            //strcpy(elementos[ele].matricula,aux.matricula);
                        }
                    }
                }

                fichero.write((char*) &n, sizeof(int));
                for(int i=0;i<n;i++){ //bucle para ir escribiendo todos los autobuses q hay
                    fichero.write((char*) &elementos[i], sizeof(autobus)); //escribe el autobus introducido en el fichero
                }
            }

        if(!fichero.fail())
            guardado=true;
        else{
            fichero.clear();
        }
        fichero.close();

    }
    return guardado;
}
