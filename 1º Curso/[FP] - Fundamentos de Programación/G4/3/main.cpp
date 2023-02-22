#include <iostream>
using namespace std;

typedef char Cadena[50]; //Tipo de datos Cadena
#define MAX_CUENTAS 100 //Número de Cuentas
class Cuenta //Contiene los datos de una cuenta bancaria
{
    float Saldo; //Saldo de la cuenta
    int NoCuenta; //Número de la cuenta
    bool Bloqueada; //true si está bloqueada
public:
    Cuenta(){
        Saldo=0;
        NoCuenta=0;
        Bloqueada=0;
    };
    Cuenta(int pNo, float pSal){
        Saldo=pSal;
        NoCuenta=pNo;
        Bloqueada=0;
    };
    bool ActualizarSaldo(int pSal){;
        bool realizado;
        if (!Bloqueada){
            Saldo=pSal;
            realizado=1;
        }
        else
           realizado=0;
        return realizado;
    };
    void ActualizarBloqueo(bool pBloq){
        Bloqueada=pBloq;
    };
    float DameSaldo(){
        return Saldo;
    };
    int DameNoCuenta(){
        return NoCuenta;
    };
    bool EstaBloqueada(){
        return Bloqueada;
    };
};

int BuscarCuenta(Cuenta Ctas[MAX_CUENTAS], int NCuentas, int NoCuenta){
//función genérica que recibe un vector de cuentas (Ctas), cuantas cuentas están utilizandose (NCuentas) y el número de cuenta a buscar (NoCuenta).
//Esta función devuelve la posición dentro del vector de cuentas que contiene el número de cuenta especificado por parámetro.
//Si no existe ninguna cuenta en el vector con ese número de cuenta devolverá -1.
    bool encontrado=0;
    int i, pos, CuentaAct;
    do{
        for(i=0;i<NCuentas;i++){
            CuentaAct=Ctas[i].DameNoCuenta();
            if(CuentaAct==NoCuenta){
                encontrado=1;
            }
        }
    }while(!encontrado || i<NCuentas);

    if (encontrado){
        i--;
    }
    else
        i=-1;
    return i;
};

int MenuCuentas(){ //función genérica que mostrará el siguiente menú y devolverá la opción seleccionada. Las opciones del menú son las siguientes:
    int op=0;
    cout<<"-------Menu  Gestion de Cuentas-------"<<endl;
    cout<<"  1. Añadir una cuenta a un cliente  "<<endl;
    cout<<"  2. Mostrar las cuentas del cliente "<<endl;
    cout<<"   3. Borrar una cuenta del cliente  "<<endl;
    cout<<"    4. Modificar Saldo de una cuenta  "<<endl;
    cout<<"  5. Modificar Estado de una cuenta  "<<endl;
    cout<<"               6. Salir              "<<endl;
    cout<<endl<<"Elige Opcion:";
    cin>>op;
    return op;
};
int main()
{
    Cuenta DatosCuentas[MAX_CUENTAS];
    Cuenta cuenta;
    int nCuentas=0;
    int op, numcuenta;
    do{
    op=MenuCuentas();
    }while (op<0 || op>6); //Restrincion para que solo se pueda sleccionar una opción del menu valida

    switch (op){
        case 1:
            if(nCuentas<MAX_CUENTAS){
                cout<<"INTRODUZCA NUMERO DE NUEVA CUENTA: ";
                cin>>numcuenta;
                bool existe=0;
                bool sepuede=1;
                do{
                    for(int i=0;i<nCuentas;i++){
                        cuenta=DatosCuentas[i];
                        if (numcuenta==cuenta.DameNoCuenta()){
                            existe=1;
                            sepuede=0;
                            cout<<"ERROR, LA CUENTA YA EXISTE";
                        }
                    }
                }while(!existe || i<NCuentas)

                if(sepuede){
                    cuenta[nCuentas]
                    NCuentas++;
                }
            }
            break;
        case 2:
            break;
        case 3:
            break;
        case 4:
            break;
        case 5:
            break;
        case 6:
            break;

    }
    return 0;
}
