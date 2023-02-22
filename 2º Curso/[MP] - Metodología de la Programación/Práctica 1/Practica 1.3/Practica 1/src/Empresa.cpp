#include "Empresa.h"
#include <cstdio>
#include "Fecha.h"
#include "Contrato.h"
#include "ContratoTP.h"
#include "ContratoMovil.h"

#include <typeinfo>

using namespace std;

Empresa::Empresa():nmaxcli(100){
    this->ncli=0;
    this->ncon=0;

    this->nmaxcon=10;

    this->contratos = new Contrato*[10]; //inicialmente tiene capacidad paara 10 contratos
}

//METODOS AUXILIARES:
int Empresa::altaCliente(Cliente *c){ //añade cliente apuntado por c al array clientes
    int pos=-1; //en principio no se ha insertado

    if(this->ncli<nmaxcli){
        this->clientes[this->ncli]=c;
        pos=this->ncli;
        this->ncli++;
    }
    else{
        cout << "Lo siento, el cupo de clientes esta lleno";
        pos=1;
    }
    return pos;
}

int Empresa::buscarCliente(long int dni) const{
    int i=0;
    bool existe=false;
    while(i<ncli && !existe){
        if(clientes[i]->getDNI()==dni)
            existe=true;
        else
            i++;
    }//i=posicion cliente con ese dni

    if(!existe)
        i=-1;

    return i;
}

void Empresa::crearContrato(){
    //primero si el cliente existe
    long int dni;
    cout<<"Introduzca DNI: ";
    cin>>dni;

    int pos=this->buscarCliente(dni); //i=pos del cliente


    if(pos==-1){
        Cliente *c;
        char nombre[100];
        int dia, mes, anio;
        cout<<"Nombre del cliente: ";
        cin>>nombre;//cin.getline(nombre,100);
        cout<<"dia: ";
        cin>>dia;
        cout<<"mes: ";
        cin>>mes;
        cout<<"anio: ";
        cin>>anio;

        c = new Cliente(dni,nombre,Fecha(dia,mes,anio));
        pos=this->altaCliente(c);

    }

    if(pos!=-1){ //si el cliente sse ha podido dar de alta
        int tipocon;
        do{
            cout<<"Tipo de contrato a abrir: (1-Tarifa Plana, 2-Movil): ";
            cin>>tipocon;

            if(tipocon!=1 && tipocon!=2)
                cout<<"INTRODUZCA TARIFA VALIDA"<<endl;

        }while(tipocon!=1 && tipocon!=2);

        int dia,mes,anio;
        cout<<"Fecha del contrato "<<endl;
        cout<<"dia: ";
        cin>>dia;
        cout<<"mes: ";
        cin>>mes;
        cout<<"anio: ";
        cin>>anio;
        int minutosha;
        cout<<"Minutos hablados: ";
        cin>>minutosha;

        if(ncon==nmaxcon){
            nmaxcon=nmaxcon*2;
            Contrato **ConAux = new Contrato*[ncon*2];
            ConAux=contratos;
            for(int i=0 ; i<ncon ; i++)
            {
                contratos[i]=ConAux[i];
            }
            delete [] ConAux;
        }
        //tipo de contrato:

        if(tipocon==1){

            cout<<endl;
            this->contratos[ncon++] = new ContratoTP(dni, Fecha(dia,mes,anio),minutosha);

        }
        else if(tipocon==2){

            float precio;
            cout<<"Precio Minuto: ";
            cin>>precio;
            char nac[20];
            cout << "Nacionalidad: ";
            cin >> nac;
            cout<<endl;

            this->contratos[ncon++] = new ContratoMovil(dni,Fecha(dia,mes,anio),precio,minutosha,nac);
        }
    }
}

void Empresa::cargarDatos(){
    Fecha f1(29,2,2001), f2(31,1,2002), f3(1,2,2002);
    this->clientes[0] = new Cliente(75547001, "Peter Lee", f1);
    this->clientes[1] = new Cliente(45999000, "Juan Perez", Fecha(29,2,2000));
    this->clientes[2] = new Cliente(37000017, "Luis Bono", f2);
    this->ncli=3;
    this->contratos[0] = new ContratoMovil(75547001, f1, 0.12, 110, "DANES"); //habla 110m a 0.12€/m
    this->contratos[1] = new ContratoMovil(75547001, f2, 0.09, 170, "DANES"); //habla 170m a 0.09€/m
    this->contratos[2] = new ContratoTP(37000017, f3, 250); //habla 250m (300m a 10€, exceso 0.15€/m)
    this->contratos[3] = new ContratoTP(75547001, f1, 312); //habla 312m (300m a 10€, exceso 0.15€/m)
    this->contratos[4] = new ContratoMovil(45999000, f2, 0.10, 202, "ESPAÑOL"); //habla 202m a 0.10/m
    this->contratos[5] = new ContratoMovil(75547001, f2, 0.15, 80, "DANES"); //habla 80m a 0.15€/m
    this->contratos[6] = new ContratoTP(45999000, f3, 400); //habla 400m (300m a 10€, exceso 0.15€/m)

    this->ncon=7;
}

void Empresa::cargarDatos2(){
    Fecha f1(29,2,2001), f2(31,1,2002), f3(1,2,2002);
    this->clientes[3] = new Cliente(22330014, "Pepe Luis", Fecha(2,2,2017));
    this->ncli=this->ncli+1;
    this->contratos[7] = new ContratoMovil(37000017, Fecha(1,1,2017), 0.25, 100, "ALEMAN"); //habla 202m a 0.10/m
    this->contratos[8] = new ContratoTP(22330014, Fecha(2,2,2017), 305); //habla 312m (300m a 10€, exceso 0.15€/m)

    this->ncon=this->ncon+2;
}

void Empresa::ver() const{
    cout<<"La empresa tiene "<<ncli<<" clientes y "<<ncon<<" contratos";
    cout<<endl<<"Clientes: "<<endl;
    for(int i=0;i<ncli;i++)
        cout<<*clientes[i]<<endl;
    cout<<endl<<"Contratos: "<<endl;
    for(int i=0;i<ncon;i++){
        contratos[i]->ver();
        cout<<endl;
    }

}

int Empresa::descuento(float porcentaje) const{ //devuelve a cuantos aplica el descuento
    int afectados=0;

    porcentaje= 1- porcentaje/100;

    for(int i=0;i<ncon;i++){
        if(ContratoMovil *c = dynamic_cast<ContratoMovil*>(contratos[i])){
            c->setPrecioMinuto(c->getPrecioMinuto()*porcentaje);
            afectados++;
        }
    }
    return afectados;
}

bool Empresa::cancelarContrato(int idContrato){ //true si el Contrato existe, false si no
    bool existe=false;
    int i=0;

    while(i<ncon && !existe){
        if(contratos[i]->getIdContrato()==idContrato){
            delete contratos[i];
            while(i<ncon-1){
                contratos[i]=contratos[i+1];
                i++;
            }
            ncon--;
            existe=true;
        }
        else
            i++;
    }

    //reducir tabla si esta a menos de la mitad:
    if(ncon < nmaxcon/2){
        nmaxcon /= 2;
        Contrato **aux = new Contrato*[nmaxcon];
        for(int i = 0; i < ncon; i++)
            aux[i] = contratos[i];

        delete [] contratos;
        contratos = aux;
    }

    return existe;
}

bool Empresa::bajaCliente(long int dni){
    //int pos=buscarCliente(dni);
    int i=0;
    bool baja=false;

    //if(pos!=-1){ //primero comprobamos que el cliente existe

        while(i < ncon){ //primero eliminamos contratos de ese cliente
            if(contratos[i]->getDniContrato() == dni){
                cancelarContrato(contratos[i]->getIdContrato());
            }
            else
                i++;
        }

        /*delete clientes[pos];

        for(i=pos;i<ncli-1;i++){
            clientes[i]=clientes[i+1];
        }
        ncli--;
        baja=true;*/
        i=0;
        while(i<ncli && !baja){
            if(clientes[i]->getDNI() == dni){
                delete clientes[i];
                while(i<ncli-1){
                    clientes[i]=clientes[i+1];
                    i++;
                }
                ncli--;
                baja=true;
            }
            else
                i++;
        }
    //}

    return baja;
}



int Empresa::nContratosTP() const{
    int nconTP=0;

    for(int i=0;i<ncon;i++){
        if(typeid(*contratos[i])==typeid(ContratoTP))
            nconTP++;
    }

    return nconTP;
}



Empresa::~Empresa()
{
    for(int i = 0; i < this->ncli; i++)
        delete this->clientes[i];
    //delete [] this->contratos; //ERROR PORQUE CLIENTES NO ES DINAMICO
    for(int i = 0; i < this->ncon; i++)
        delete this->contratos[i];
    delete [] this->contratos;
}
