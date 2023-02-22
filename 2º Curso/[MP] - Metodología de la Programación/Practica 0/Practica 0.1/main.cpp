#include <iostream>
#include "complejo.h"

using namespace std;

int main()
{
    //const - no permite modificar el objeto que lo invoca

    complejo a(2,3),c(5,3),d(1,1);
    const complejo b(-9,4);
    d= a+c;
    a=-a;
    a.ver();

    cout<<"Parte real vale: "<< a.getr();
    cout<<endl;
    cout<<"Parte imaginaria vale: "<< a.geti();
    cout<<endl;
    a.ver();
    cout<<endl;
    b.ver();
    cout<<endl<<endl;
    a.set(5,-4);
    cout<<"Parte real vale: "<< a.getr();
    cout<<endl;
    cout<<"Parte imaginaria vale: "<< a.geti();
    cout<<endl<<endl;
    a.set(0,-4);
    cout<<"Parte real vale: "<< a.getr();
    cout<<endl;
    cout<<"Parte imaginaria vale: "<< a.geti();
    cout<<endl<<endl;
    a.set();
    cout<<"Parte real vale: "<< a.getr();
    cout<<endl;
    cout<<"Parte imaginaria vale: "<< a.geti();

    return 0;
}
