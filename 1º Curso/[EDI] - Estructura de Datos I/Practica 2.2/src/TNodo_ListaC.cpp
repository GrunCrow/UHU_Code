#include "TNodo_ListaC.h"
#include "string.h"

TNodo_ListaC::TNodo_ListaC()
{
    elementos=NULL; //PUNTERO A PRIMER ELEMENTO A NULL
    n=0;
}

bool TNodo_ListaC::esvacia(){
    return elementos==NULL;
}

int TNodo_ListaC::longitud(){
    return n;
}

void TNodo_ListaC::insertar(Paciente p, int pos){
    TNodo_Listafem *Nodo_Aux=new TNodo_Listafem;
    int cont=1;
    if(Nodo_Aux!=NULL){
        //1º guardar datos del nuevo nodo
        Nodo_Aux->P=p;
        Nodo_Aux->Sig=Nodo_Aux; //para el caso en el que n=0

        if(n==0){
            elementos=Nodo_Aux;
            //Nodo_Aux->Sig=elementos;
            n++;
            //cout<<"El elemento se ha insertado en la primera posición al no haber más";
        }
        else{
            TNodo_Listafem *Nodo_Ant=elementos,
                           *Nodo_Tmp=elementos->Sig;

            while(Nodo_Tmp!=elementos && cont<=pos){// && Nodo_Tmp->P.id < Nodo_Aux->P.id){ //para insertar ordenado por id
                Nodo_Ant=Nodo_Tmp;
                Nodo_Tmp=Nodo_Tmp->Sig;
                cont++;
            }

            Nodo_Aux->Sig=Nodo_Ant->Sig;
            Nodo_Ant->Sig=Nodo_Aux; //el ultimo nodo con valor apunta al que insertamos

            n++;
        }
    }
    else{
        cout<<"NO SE HA PODIDO INSERTAR";
        system("pause");
    }
}

TNodo_Listafem *TNodo_ListaC::Anterior(int i){
    TNodo_Listafem *Nodo_Ant=NULL; //Elemento anterior
    TNodo_Listafem *Nodo_Aux=elementos; //primer elemento
    TNodo_Listafem *Nodo_Act=elementos;

    int v=1;
    if(Nodo_Act->Sig!=elementos){
        while(Nodo_Act!=NULL && v<i){
            Nodo_Act=Nodo_Act->Sig;
            v++;
        }
    }

    if (Nodo_Aux!=NULL && Nodo_Act!=NULL){// && Nodo_Act!=elementos){

        while (Nodo_Aux->Sig!=NULL && Nodo_Aux->Sig!=Nodo_Act)
            Nodo_Aux=Nodo_Aux->Sig;

        if (Nodo_Aux->Sig==Nodo_Act)
            Nodo_Ant=Nodo_Aux;
        else
            Nodo_Ant=NULL;
    }

    return Nodo_Ant;
}

Paciente TNodo_ListaC::observar(int i){
    TNodo_Listafem *Nodo_Ant=Anterior(i);
    TNodo_Listafem *Nodo_Aux;

    if (Nodo_Ant->Sig==elementos)
        Nodo_Aux=elementos;
    else
        Nodo_Aux=Nodo_Ant->Sig;

    return Nodo_Aux->P;
}

TNodo_ListaC::~TNodo_ListaC()
{
    TNodo_Listafem *Nodo_Borr, *Nodo_Sig;
    Nodo_Borr=elementos;

    while (Nodo_Borr->Sig!=elementos)
    {
         Nodo_Sig=Nodo_Borr->Sig;
         delete Nodo_Borr;
         Nodo_Borr=Nodo_Sig;
    }

    delete Nodo_Borr;
    elementos=NULL;

    n=0;
}




bool compararfem(Paciente pac1, Paciente pac2){
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

int TNodo_ListaC::posicion(Paciente p){
    TNodo_Listafem *Nodo_Sig=elementos->Sig, //Primer nodo de la lista
                   *Nodo_Tmp=elementos;

    int cont=1;

    while (Nodo_Sig!=elementos && !compararfem(Nodo_Tmp->P,p)){// && Nodo_Tmp->P.id<Nodo_Aux->P.id){
        Nodo_Sig=Nodo_Sig->Sig;
        Nodo_Tmp=Nodo_Tmp->Sig;
        cont++;
    }

    if(Nodo_Sig==elementos){ //falta por comparar el ultimo elemento
        Nodo_Tmp=Nodo_Tmp->Sig;
        cont++;
    }

    if(!compararfem(Nodo_Tmp->P,p))
        cont=-1;

    return cont;
}

void TNodo_ListaC::eliminar(int i){
    TNodo_Listafem *Nodo_Tmp=elementos,
                   *Nodo_Ant=NULL;
    int cont=1;

    while (Nodo_Tmp->Sig!=elementos && cont<i){// && Nodo_Tmp->P.id<Nodo_Aux->P.id){
        if(Nodo_Tmp==elementos)
            Nodo_Ant=elementos;
        else
            Nodo_Ant=Nodo_Ant->Sig;

        Nodo_Tmp=Nodo_Tmp->Sig;
        cont++;
    }

    //if(Nodo_Tmp->Sig!=elementos)
    if(Nodo_Ant==NULL){
        Nodo_Ant=elementos;
        while (Nodo_Ant->Sig!=elementos){// && Nodo_Tmp->P.id<Nodo_Aux->P.id){
            Nodo_Ant=Nodo_Ant->Sig; //el nodo anterior
        } //hasta llegar al ultimo nodo
    }

    Nodo_Ant->Sig=Nodo_Tmp->Sig;

    if(Nodo_Tmp==elementos)
        elementos=Nodo_Tmp->Sig;

    delete Nodo_Tmp;
    n--;
}

bool TNodo_ListaC::pertenece(Paciente p){ //comprobar ultimo
    bool pertenece=false;
    TNodo_Listafem *Nodo_Tmp=elementos;

    while (Nodo_Tmp->Sig!=NULL && !compararfem(Nodo_Tmp->P,p))// && Nodo_Tmp->P.id<Nodo_Aux->P.id){
        Nodo_Tmp=Nodo_Tmp->Sig;

    if(compararfem(Nodo_Tmp->P,p))
        pertenece=true;

    return pertenece;
}

void TNodo_ListaC::concatenar(TNodo_ListaC lista2){
    TNodo_Listafem *Nodo_Aux=lista2.elementos,
                    *Nodo_Tmp=elementos;


    while (Nodo_Tmp->Sig!=elementos){
        Nodo_Tmp=Nodo_Tmp->Sig;
    }

    Nodo_Tmp->Sig=Nodo_Aux;

    while (Nodo_Tmp->Sig!=Nodo_Aux){
        Nodo_Tmp=Nodo_Tmp->Sig;
    }

    Nodo_Tmp->Sig=elementos;

}
