#include "Multiconjunto.h"
#include "Persona.h"

template<typename T>
Multiconjunto<T>::Multiconjunto(){
    num = 0;
}

template<typename T>
bool Multiconjunto<T>::esVacio() const{
    return num == 0;
}

template<typename T>
int Multiconjunto<T>::cardinalidad() const{
    return num;
}

template<typename T>
void Multiconjunto<T>::anade(const T& objeto){
    if(num < 100)
        c[num++] = objeto;
}

template<typename T>
void Multiconjunto<T>::elimina(const T& objeto){
    int i = 0;
    while(i < num){
        if(c[i] == objeto){
            c[i] = c[num-1];
            num--;
        }
        else
            i++;
    }
}

template<typename T>
bool Multiconjunto<T>::pertenece(const T& objeto) const{
    bool pertenece = false;

    int i = 0;
    while(i < num && !pertenece)
        if(c[i] == objeto)
            pertenece = true;
        else
            i++;

    return pertenece;
}

template class Multiconjunto<int>;
template class Multiconjunto<char>;
template class Multiconjunto<Persona>;
