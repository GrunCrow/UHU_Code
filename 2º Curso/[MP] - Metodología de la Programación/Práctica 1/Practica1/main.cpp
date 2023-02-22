#include <cstdlib>
#include <iostream>
#include <iomanip> //std::setprecision
#include "Fecha.h" //definicion de la clase Fecha
#include "Contrato.h" // definicion de la clase Contrato
#include "ContratoTP.h" // definicion de la clase ContratoTP
#include "ContratoMovil.h" // definicion de la clase ContratoMovil
using namespace std;
int main(int argc, char *argv[])
{
    Fecha f1(29,2,2001), f2(f1), f3(29,2,2004);
    cout << "Fechas: ";
    f1.ver();
    cout << ", ";
    f2.ver();
    cout << ", ";
    f3.ver();
    cout << endl;
    Contrato *p = new Contrato(75547111, f1), c(23000111, Fecha(2,2,2002));
    cout << ContratoTP::getLimiteMinutos() << " - " << ContratoTP::getPrecio() << endl;

    ContratoTP ct1(17333256, f1, 250); //habla 250 minutoe
    ContratoTP ct2(12555100, f3, 320); //habla 320 minutos
    //system("pause");
    ContratoTP ct3(ct1);

  //  cout<<p->getFechaContrato(); system("pause");


    ContratoMovil cm1(17333256, f1, 0.12, 100, "ESPAÑOL"); //habla 100 minutos
    ContratoMovil cm2(17000000, Fecha(3,3,2003), 0.10, 180, "FRANCES"); //habla 180 minutos
    ContratoMovil cm3(cm2);

    p->ver();

    cout << "\n";
    c.ver();

    cout << endl;
    ct1.ver();
    cout << endl;

    ct2.ver();
    cout << "\n";
    ct3.ver();
    cout << "\n";
    cm1.ver();
    cout << endl;
    cm2.ver();

    cout << "\n";
    cm3.ver();
    cout << "\n";


    cout << p->getIdContrato() << ct2.getIdContrato() << cm2.getIdContrato() << endl;
    cout << setprecision(2) << fixed; //a partir de aqui float se muestra con 2 decimales
    cout << "Facturas: " << ct1.factura() <<" - "<< ct2.factura() <<" - "<< cm1.factura() << endl;
    ContratoTP::setTarifaPlana(350, 12); //350 minutos por 12 euros
    p->setDniContrato(cm1.getDniContrato());

    //ct3.setFechaContrato(f1+1);
    ct3.setFechaContrato((p->getFechaContrato())+1); //ERROR ? ?

    cm3.setNacionalidad(cm1.getNacionalidad());
    cm2.setPrecioMinuto(cm1.getPrecioMinuto()+0.02);
    cm1.setMinutosHablados(ct2.getMinutosHablados()/2);
    ct1.setMinutosHablados(cm3.getMinutosHablados()*2);
    cout << *p <<"\n"<< c << endl;
    cout << ct1 <<endl<< ct2 <<"\n"<< ct3 <<"\n"<< cm1 <<"\n"<< cm2 <<endl<< cm3 << endl;
    delete p;
    system("PAUSE");
    return 0;
}
