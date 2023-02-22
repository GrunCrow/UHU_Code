/*#include <cstdlib>
#include <iostream>
#include "Fecha.h" //definicion de la clase Fecha
#include "Cliente.h" // definicion de la clase Cliente

using namespace std;

int main(){
    Fecha f1(29,2,2001), f3(29,2,2004), f4(29,2,1900);

    //f1 = 28 porq febrero del 2001 max = 28

    //Fecha f5; //no permitido

    const Fecha f2=f1; //indica que metodo se esta ejecutando aqui       */                    /*SETFECHA*/

    /*f1.setFecha(f3.getDia()-3, f3.getMes()-2, 2007); //29-3/2-2/2007 --> f1=26/1/2007
    cout << "Fechas: ";
    f1.ver();
    cout << ", ";
    f2.ver();
    cout << ", ";
    f3.ver();
    cout << ", ";
    f4.ver();
    cout << endl;
    if (f3.Bisiesto() && !f2.Bisiesto() && f4.Bisiesto()==false)
        cout << f3.getAnio() << " es bisiesto, " << f2.getAnio() << " y " << f4.getAnio() << " no\n";
    f4.setFecha(31, 12, 2000); //f4=31/12/2000
    f3=f4++; //indica que método/s se esta ejecutando aqui operator++(int notused)
    ++f4;
    f1=2+f2+3;
    cout << "Fechas: ";
    f1.ver();
    cout << ", ";
    f2.ver();
    cout << ", ";
    f3.ver();
    cout << ", ";
    f4.ver();
    cout << endl;



    Cliente *p = new Cliente(75547001, "Susana Diaz", f1);
    f1.setFecha(7,10,2015);
    Cliente c(75547999, "Juan Sin Miedo", Fecha(29,2,2000));
    const Cliente j(44228547, "Luis", f1);
    c.setNombre("Juan Palomo");
    if (j==c)
        cout << "\nj y c son iguales\n";
    else
        cout << "\nj y c no son iguales\n";
    cout << p->getDNI() << " - " << c.getNombre() << ": " << j.getFecha() << endl;
    cout << *p << "\n" << c << "\n" << j << "\n";
    c = *p;
    p->setNombre("Susanita");
    p->setFecha(p->getFecha()+10);
    cout << "\nDatos de los clientes: \n";
    cout << *p << "\n" << c << "\n" << j << "\n";
    delete p;
    p = NULL;
    system("PAUSE");
    return 0;*/


//PRACTICA 2

#include <cstdlib>
#include <iostream>
#include <iomanip> //std::setprecision
#include "Fecha.h" //definicion de la clase Fecha
#include "Contrato.h" // definicion de la clase Contrato
#include "ContratoTP.h" // definicion de la clase ContratoTP
#include "ContratoMovil.h" // definicion de la clase ContratoMovil
#include "Empresa.h"

using namespace std;

int main(int argc, char *argv[]) {

    /*Contrato *t[4];
    t[0]=p; t[1]=&c; t[2]=&ct2; t[3]=&cm1;
    cout << "\n-- Datos de los contratos: -- \n";
    t[3]->setDniContrato(75547111);
    for(int i=0; i<4; i++) {
        t[i]->setFechaContrato(t[i]->getFechaContrato()+2);
        t[i]->ver(); cout << endl;
    }*/
    bool ok;
    Empresa Yoigo;
    cout << setprecision(2) << fixed; //a partir de aqui float se muestra con 2 decimales
    cout << endl << "APLICACION DE GESTION TELEFONICA\n" << endl;
    Yoigo.cargarDatos(); //crea 3 clientes y 7 contratos. metodo creado para no
    Yoigo.ver();        //tener que meter datos cada vez que pruebo el programa
    cout <<"Yoigo tiene " << Yoigo.nContratosTP() << " Contratos de Tarifa Plana\n\n";
    //Yoigo.crearContrato(); //ContratoMovil a 37000017 el 01/01/2017 con 100m a 0.25
    //Yoigo.crearContrato(); //ContratoTP a 22330014 (pepe luis) el 2/2/2017 con 305m
    Yoigo.cargarDatos2();
    ok=Yoigo.cancelarContrato(28); //este Contrato no existe
    if (ok)
        cout << "Contrato 28 cancelado\n";
    else
        cout << "El Contrato 28 no existe\n";
    ok=Yoigo.cancelarContrato(4); //este Contrato si existe
    if (ok)
    cout << "El Contrato 4 ha sido cancelado\n";
    else
    cout << "El Contrato 4 no existe\n";
    ok=Yoigo.bajaCliente(75547001); //debe eliminar el cliente y sus 3 Contratos
    if (ok) cout << "El cliente 75547001 y sus Contratos han sido cancelados\n";
    else cout << "El cliente 75547001 no existe\n";
    Yoigo.ver();
    Yoigo.descuento(20);
    cout << "\nTras rebajar un 20% la tarifa de los ContratosMovil...";
    Yoigo.ver();
    cout <<"Yoigo tiene " << Yoigo. nContratosTP () << " Contratos de Tarifa Plana\n";

    system("PAUSE");

    return 0;
}

