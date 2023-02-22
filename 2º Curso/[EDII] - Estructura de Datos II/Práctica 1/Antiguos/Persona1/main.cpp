#include <iostream>

#include "Persona.h"
#include "MultiConjunto.h"

using namespace std;

/*template <typename T>
void mostrarPertenencia(const Multiconjunto<T>& c, const T& elemento){
    //cout<<elemento;
    if (c.pertenece(elemento))
        cout<<" si";
    else
        cout<<" no";
    cout<<" pertenece al conjunto\n";
}
*/
int main()
{
    Multiconjunto<Persona> conj3;

    Persona p("Juan",34);
    conj3.anade(p);
    conj3.anade(Persona("Marisa",25));

//    mostrarPertenencia(conj3,p);
    conj3.elimina(p);

//    mostrarPertenencia(conj3,Persona("Juan",34));
//    mostrarPertenencia(conj3,Persona("Marisa",25));
}
