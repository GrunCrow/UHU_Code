#include <iostream>

using namespace std;

/*

8. Modificar el código del método void Leer() realizado para el ejercicio no 24 del guión
práctico no 1, de modo que el usuario pueda introducir el valor de la carga en cualquiera de las
siguientes unidades:
a) Miliculombios (mC = 10-3
C)
b) Microculombios (μC = 10-6
C)
c) Nanoculombios (nC = 10-9
C)

La distancia también podrá ser suministrada por parte del usuario en:
a) Decímetros (dm)
b) Centímetros (cm)
c) Milímetros (mm)
En dicho método se hará también la conversión a μC y a m, necesaria para poder almacenar los
valores en los atributos de la clase.
Cuando el usuario indique el valor numérico de la carga, el programa le ofrecerá mediante un
menú las diferentes opciones en cuanto a unidades, para que seleccione la correcta. Del mismo
modo se trabajará con la distancia. Si el usuario pulsa una opción incorrecta se tomará por
defecto la unidad de almacenamiento (μC y m) y se le avisará al usuario con un mensaje.
*/

#include <iostream>
#include <cmath>
using namespace std;

class CampoElec
{
    float q;
    float r;
public:
    void Leer();
    double Intensidad();
};

void CampoElec::Leer()
{
    int m1,m2;

    cout<<"En que medida quiere introducir la carga?\n";
    cout<<"1. mC - miliculombio\n";
    cout<<"2. uC microculombio\n";
    cout<<"3. nC - nanoculombio\n";

    cin>>m1;

    cout<<"\nIntroduzca un valor para q\n";
    cin>>q;

    switch (m1)
    {
    case 1:
        q=q*pow(10,-3);
        break;
    case 2:
        q=q*pow(10,-6);
        break;
    case 3:
        q=q*pow(10,-9);
        break;
    default:
        cout<<"Opcion no valida";
        break;
    }

    cout<<"En que medida quiere introducir la carga?\n";
    cout<<"1. dc - decimentros\n";
    cout<<"2. cm centimentro\n";
    cout<<"3. mm - milimetro\n";

    cin>>m2;

    cout<<"Introduzca un valor para r\n";
    cin>>r;

    switch (m2)
    {
    case 1:
        r=r*pow(10,-1);
        break;
    case 2:
        r=r*pow(10,-2);
        break;
    case 3:
        r=r*pow(10,-3);
        break;
    default:
        cout<<"Opcion no valida";
        break;
    }
}

double CampoElec::Intensidad()
{
    float u=8.85*pow(10,-12);
    float pi=3.14;
    float E=q/(4.0*pi*pow(r,2)*u);
    return E;
}

int main()
{
    CampoElec ob1;
    ob1.Leer();
    float E=ob1.Intensidad();
    cout<<"La intensidad del campo es= "<<E;
    return 0;
}
