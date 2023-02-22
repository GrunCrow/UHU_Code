#include "cartelera.h"
#include <iostream>

using namespace std;

Cartelera::Cartelera(): espectaculos(){ //crear un dicc de espectaculos vacio
    //DEspectaculo es un MAP -> crear un MAP vacio
}

void Cartelera::insertaEspectaculo(const string& e){
    espectaculos.insert(PEspectaculos(e,DSalas()));
}

void Cartelera::insertaSala(const string& e, const string& s, const string& c){
    espectaculos[e].insert(PSalas(s,c));
}

void Cartelera::eliminaEspectaculo(const string& e){
    espectaculos.erase(e);
}

void Cartelera::eliminaSala(const string& e, const string& s){
    DEspectaculos::iterator it=espectaculos.find(e);
    if(it != espectaculos.end())
        it->second.erase(s);
    //espectaculos[e].erase(PEspectaculos(espectaculos,s));

}

void Cartelera::listaEspectaculos(){
    if (espectaculos.empty())
        cout<<"No hay ningun espectaculo."<<endl;
    else{
        cout<<"Lista de espectaculos:"<<endl;
        for(DEspectaculos::iterator it=espectaculos.begin(); it!=espectaculos.end();it++)
            cout<<it->first<<endl; //first porq el primer par es espectaculos y es el q queremos mostrar second seria para las salas
    }//no hace falta ordenar porque al ser un ARN es un ABB y ya está ordenado

}

void Cartelera::listaSalas(const string& e){
    DEspectaculos::iterator ite=espectaculos.find(e);
    if(ite==espectaculos.end()) //quiere decir que con el find anterior se ha insertado
        cout<<"No existe el espectaculo"<<e<<"."<<endl;
    else{
        if(ite->second.empty())
            cout<<"No hay ninguna sala para este espectaculo "<<e<<"."<<endl;
        else{
            for(DSalas::iterator its = ite->second.begin();its!=ite->second.end();its++)
                cout<<its->first<<"-"<<its->second<<endl;
        }
    }
}

