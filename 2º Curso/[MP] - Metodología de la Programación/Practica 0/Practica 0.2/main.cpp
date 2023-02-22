/*#include <iostream>
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
}*/

#include <iostream>   // std::cout, std::fixed
#include <iomanip>    // std::setprecision
#include <cstdlib>    // system
#include <fstream>
#include "complejo.h" // definicion de la clase complejo


using namespace std;

int main(int argc, char *argv[]){

    complejo a(1,2), b(3),c(a), e(6,2);//b debe ser  3+0i, c es 1+2i
    const complejo d(-1,-2);
    cout << fixed << setprecision(2); //mostrar 2 (setprecision) decimales (fixed)
    a.set(a.getr()+1,-1*a.geti());
                a.ver(); cout << endl; //a = 2-2i
    b=5+c+a;    b.ver(); cout <<endl; //b = 8+0i
    c=5+c+a+2;  c.ver(); cout << endl; //c = 10+0i
    c=-c;       c.ver(); cout << endl; //c =-10+0i
    c=d+1;      c.ver(); cout << endl; //c = 0-2i
    c=d+c;      c.ver(); cout << endl; //c =-1-4i

    ++a;       cout << a<< endl;    //a =3-2i
    a++;       cout << b<< endl;  //a= 4-2i

    int r = (int)a;             //r= (int) a devuelve la parte real de a (4)

    e.set(8,0);//e = 8+0i

    if (e==b) //da error porque no está sobrecargado y debemos crear el operator==
        cout << "e y b son iguales \n";
    else
        cout << "e y bson distintos \n";

    if (e==8)
        cout << e<< " es igual a " << 8 << endl;

    b=++a;
    c=b++;

    cout << a << "," << b << "," << c << endl; //a=5-2i, b=6-2i, c=6-2i, c=5-2i

    system("PAUSE");

    return EXIT_SUCCESS;

}












