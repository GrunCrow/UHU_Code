#include <iostream>
#include "Fecha.h"
#include "Cliente.h"
#include "Contrato.h"
#include "ContratoMovil.h"

#include <cstring>


using namespace std;

int main()
{
    Fecha f1(29,2,2001);
    Cliente *p = new Cliente(75547001, "Susana Diaz", f1);
    cout << p->getDni() << endl;
    cout << p->getNombre() << endl;
    //strcpy(p->getNombre(), "Susanita");
    cout << p->getDni() << endl;
    cout << p->getNombre() << endl;
    cout << "-----------\n";

    Contrato c1(12312321, f1), c2(322443, f1);
    c1.ver(); cout << endl;
    c2.ver(); cout << endl;

    ContratoMovil cm1(17333256, f1, 0.12, 100, "ESPAÑOL"); //habla 100 minutos
    cm1.ver();
    return 0;
}
