#include "TNodo_ListaD.h"
#include "string.h"

TNodo_ListaD::TNodo_ListaD()
{
    elementos=NULL; //PUNTERO A PRIMER ELEMENTO A NULL
    n=0;
}

bool TNodo_ListaD::esvacia(){
    return elementos==NULL;
}

int TNodo_ListaD::longitud(){
    return n;
}

void TNodo_ListaD::insertar(Paciente p, int pos){
    TNodo_Listamasc *Nodo_Aux=new TNodo_Listamasc;
    int cont=1;
    if(Nodo_Aux!=NULL){
        Nodo_Aux->P=p;
        Nodo_Aux->Sig=NULL;
        Nodo_Aux->Ant=NULL;

        TNodo_Listamasc *Nodo_Ant=NULL, //Elemento anterior
                        *Nodo_Tmp=elementos; //Primer nodo de la lista

        if(n==0){
            elementos=Nodo_Aux;
            n++;
            //cout<<"El elemento ha sido insertado en la primera posición al no haber más";
        }
        else{

            while (Nodo_Tmp!=NULL && cont<=pos){// && Nodo_Tmp->P.id<Nodo_Aux->P.id){
                Nodo_Ant=Nodo_Tmp;
                Nodo_Tmp=Nodo_Tmp->Sig;
                cont++;
            }

            Nodo_Aux->Sig=Nodo_Ant->Sig;  //SI INSERTAMOS POR ORDEN

            if (Nodo_Tmp!=NULL)
                Nodo_Ant->Sig->Ant=Nodo_Aux;
            Nodo_Ant->Sig=Nodo_Aux;
            Nodo_Aux->Ant=Nodo_Ant;

            n++; //se ha podido insertar
        }
    }
    else{
        cout<<"NO SE HA PODIDO INSERTAR";
        system("pause");
    }
}

TNodo_Listamasc *TNodo_ListaD::Anterior(int i){
    TNodo_Listamasc *Nodo_Ant=NULL; //Elemento anterior
    TNodo_Listamasc *Nodo_Aux=elementos; //Nodo Actual
    int v=1;
    if(Nodo_Aux!=NULL){
        while(Nodo_Aux!=NULL && v<i){
            Nodo_Aux=Nodo_Aux->Sig;
            v++;
        }
        Nodo_Ant=Nodo_Aux->Ant;
    }
    return Nodo_Ant;
}

Paciente TNodo_ListaD::observar(int i){
    TNodo_Listamasc *Nodo_Ant=Anterior(i);
    TNodo_Listamasc *Nodo_Aux;
    if (Nodo_Ant==NULL)
        Nodo_Aux=elementos;
    else
        Nodo_Aux=Nodo_Ant->Sig;

    return Nodo_Aux->P;
}

TNodo_ListaD::~TNodo_ListaD()
{
    TNodo_Listamasc *Nodo_Borr, *Nodo_Sig;
    Nodo_Borr=elementos;

    while (Nodo_Borr!=NULL)
    {
         Nodo_Sig=Nodo_Borr->Sig;
         delete Nodo_Borr;
         Nodo_Borr=Nodo_Sig;
    }

    elementos=NULL;
    n=0;
}


void TNodo_ListaD::modificar(int i, Paciente p){
    TNodo_Listamasc *Nodo_Tmp=elementos; //Primer nodo de la lista

    int cont=1;

    while (Nodo_Tmp!=NULL && cont<=i){// && Nodo_Tmp->P.id<Nodo_Aux->P.id){
        Nodo_Tmp=Nodo_Tmp->Sig;
        cont++;
    }

    if(Nodo_Tmp!=NULL){
        Nodo_Tmp->P=p;
    }
    else
        cout<<"NO SE HA PODIDO MODIFICAR, POSICIÓN SIN DATOS";
}

bool comparar(Paciente pac1, Paciente pac2){
    bool iguales=false;

    if(strcmp(pac1.nombre,pac2.nombre)==0){
        if(strcmp(pac1.apellidos,pac2.apellidos)==0){
            if(pac1.id==pac2.id){
                if(pac1.edad==pac2.edad){
                    iguales=true;
                }
            }
        }
    }

    return iguales;

}

int TNodo_ListaD::posicion(Paciente p){
    TNodo_Listamasc *Nodo_Tmp=elementos; //Primer nodo de la lista

    int cont=1;

    while (Nodo_Tmp!=NULL && !comparar(Nodo_Tmp->P,p)){// && Nodo_Tmp->P.id<Nodo_Aux->P.id){
        Nodo_Tmp=Nodo_Tmp->Sig;
        cont++;
    }

    if(!comparar(Nodo_Tmp->P,p))
        cont=-1;

    return cont;
}

void TNodo_ListaD::eliminar(int i){
    TNodo_Listamasc *Nodo_Tmp=elementos, *Nodo_Aux;
    int cont=1;

    while (Nodo_Tmp!=NULL && cont<=i){// && Nodo_Tmp->P.id<Nodo_Aux->P.id){
        Nodo_Tmp=Nodo_Tmp->Sig;
        cont++;
    }

    if(Nodo_Tmp!=NULL){
        Nodo_Aux=Nodo_Tmp->Ant;
        Nodo_Aux->Sig=Nodo_Tmp->Sig;
        Nodo_Aux=Nodo_Tmp->Sig;
        Nodo_Aux->Ant=Nodo_Tmp->Ant;

        delete Nodo_Tmp;
        n--;
    }
}

bool TNodo_ListaD::pertenece(Paciente p){
    bool pertenece=false;
    TNodo_Listamasc *Nodo_Tmp=elementos;

    while (Nodo_Tmp!=NULL && !comparar(Nodo_Tmp->P,p))// && Nodo_Tmp->P.id<Nodo_Aux->P.id){
        Nodo_Tmp=Nodo_Tmp->Sig;

    if(comparar(Nodo_Tmp->P,p))
        pertenece=true;

    return pertenece;
}

void TNodo_ListaD::concatenar(TNodo_ListaD lista2){
    TNodo_Listamasc *Nodo_Aux=lista2.elementos,
                    *Nodo_Tmp=elementos;


    while (Nodo_Tmp->Sig!=NULL){// && Nodo_Tmp->P.id<Nodo_Aux->P.id){
        Nodo_Tmp=Nodo_Tmp->Sig;
    }

        Nodo_Tmp->Sig=Nodo_Aux;
        Nodo_Aux->Ant=Nodo_Tmp;
}


