#include <iostream>
#include <MultiConjunto.h>

using namespace std;

int main()
{
    MultiConjunto<int> mc;

    cout << "Vacio: " << mc.esVacio() << "\n";
    cout << "Cardinalidad: " << mc.cardinalidad() << "\n";

    return 0;
}
