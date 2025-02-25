#include <iostream>
#include <stdlib.h>
#include <string.h>
#include <conio.h>
#include <time.h>

using namespace std;

typedef char cad[20];

class tprod {
    cad nombre;
    float precio;
    int stock;
public:
    tprod(){
        strcpy(nombre,"NO HAY PRODUCTO: ");
        precio=0;
        stock=0;
    };
    void cambiarnombre(cad nom){ //Este m�todo recibe nom como par�metro y lo copia en el atributo nombre.
        strcpy(nombre,nom);
    };
    void cambiarprecio(float prec){ //Recibe prec como par�metro y lo copia en el atributo precio.
        precio=prec;
    };
    void cambiarstock(int stoc){ //Recibe stoc como par�metro y lo copia en el atributo stock.
        stock=stoc;
    };
    void leenombre (cad nom){ //Devuelve en el par�metro nom el contenido del atributo nombre.
        cout<<nombre;
        cout<<endl;
    };
    float leeprecio (){ //Devuelve el contenido del atributo precio.
        return precio;
    };
    void leestock(int &st){ //Devuelve en el par�metro st el contenido del atributo stock.
        st=stock;
    };
    void vender(int cantidad){ //Simula la venta del producto, quitando del stock la cantidad cant pasada como par�metro, adem�s mostrar� por pantalla el precio a cobrar que ser� el
    //producto del precio unitario por la cantidad vendida. Si no hubiera en el stock suficiente cantidad mostrar� un mensaje por pantalla expresando dicha circunstancia no realiz�ndose la venta.
        if (cantidad<=stock)
        {
            stock=stock-cantidad;
            precio=precio*cantidad;
            cout<<"Cantidad a pagar: "<<precio;
            cout<<endl;
        }
        else
        {
            cout<<"ERROR NO SE PUEDE REALIZAR LA VENTA, STOCK INSUFICIENTE";
            cout<<endl;
        }
    };
};

#define MAX 5

class almacen {
    tprod productos[MAX];
    int nprod;
public:
    almacen(); //Constructor que pondr� el almac�n vac�o.
    void vaciar(); //M�todo que pondr� el almac�n vac�o.
    int existe(cad nom); //M�todo que recibiendo el nombre de un producto como par�metro devolver� en qu� posici�n de la tabla se encuentra almacenado un producto con ese nombre o bien -1 si no est�.
    void verprod (int pos, tprod &prod); //M�todo que pondr� en prod el contenido del producto que se encuentra en la posici�n pos de la tabla de productos.
    int insertar(tprod P); //M�todo que intentar� insertar un nuevo producto P pasado como par�metro en la tabla de productos. Si la tabla est� llena devolver� un 2 y si ya hay un
    //producto con el mismo nombre devolver� un 1 no insertando en ninguno de estos casos el producto. Si lo ha podido insertar devolver� un 0.
    void vertabla (); //M�todo que visualizar� por pantalla el contenido del almac�n. Cada producto deber� mostrarse en una l�nea diferente con su nombre, precio y stock. Si el
    //almac�n est� vac�o expresar� esta situaci�n por pantalla.
    void vender (int pos, int cant); //M�todo que recibiendo como par�metros pos y cantidad intentar� realizar la venta del producto que est� en la posici�n pos de la tabla y una
    //cantidad cant de ese producto.
};

int main()
{
    tprod prueba;
    cad n;
    float p;
    int s,op=0,ops=5;

    do{
        do{
            system("cls");
            cout<<"Opcion 1: Introducir producto\n";
            cout<<"Opcion 2: Consultar nombre del producto\n";
            cout<<"Opcion 3: Consultar precio\n";
            cout<<"Opcion 4: Consultar precio\n";
            cout<<"Opcion 5: Salir\n";
            cout<<endl;
            cout<<"Elija opcion del menu: ";
            cin>>op;
        }while((op<1)||(op>ops));

        switch(op){
            case 1:
            {
                cout<<"INTRODUCIR PRODUCTO";
                cout<<endl;
                cout<<"-------------------";
                cout<<endl;
                cout<<"Introduzca nombre del producto: ";
                cin>>n;
                prueba.cambiarnombre(n);
                cout<<"Introduzca precio unitario del producto: ";
                cin>>p;
                prueba.cambiarprecio(p);
                cout<<"Introduzca stock del producto: ";
                cin>>s;
                prueba.cambiarprecio(s);
                system("cls");
                break;
            }
            case 2:
            {
                cout<<"Producto: "<<prueba.leenombre();
                break;
            }
            case 3:
            {
                cout<<"Precio:   "<<prueba.leeprecio();
                break;
            }
            case 4:
            {
                cout<<"Stock:    "<<prueba.leestock();
                break;
            }
            case 5:
            {
                cout<<"Saliendo...";
                break;
            }
            default:
            {
                cout<<"OPCION NO VALIDA";
                break;
            }

        }
    }while (op!=5);





    return 0;
}
