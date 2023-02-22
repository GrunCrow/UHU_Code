#include <iostream>
#include "Multiconjunto.h"

using namespace std;

int main(){
    Multiconjunto<int> mc;
    cout << "Vacio: " << mc.esVacio() << "\n";
    cout << "Cardinalidad: " << mc.cardinalidad() << "\n";

    mc.anade(2);
    mc.anade(3);
    mc.anade(2);

    cout << "Vacio: " << mc.esVacio() << "\n";
    cout << "Cardinalidad: " << mc.cardinalidad() << "\n";
    cout << "Pertenece 1: " << mc.pertenece(1) << "\n";
    cout << "Pertenece 2: " << mc.pertenece(2) << "\n";
    cout << "Pertenece 3: " << mc.pertenece(3) << "\n";
    cout << "Pertenece 4: " << mc.pertenece(4) << "\n";

    mc.elimina(2);

    cout << "Vacio: " << mc.esVacio() << "\n";
    cout << "Cardinalidad: " << mc.cardinalidad() << "\n";
    cout << "Pertenece 1: " << mc.pertenece(1) << "\n";
    cout << "Pertenece 2: " << mc.pertenece(2) << "\n";
    cout << "Pertenece 3: " << mc.pertenece(3) << "\n";
    cout << "Pertenece 4: " << mc.pertenece(4) << "\n";



    return 0;
}
