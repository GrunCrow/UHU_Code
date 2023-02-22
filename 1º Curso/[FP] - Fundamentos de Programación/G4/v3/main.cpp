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
    void cambiarnombre(cad &nom){ //Este método recibe nom como parámetro y lo copia en el atributo nombre.
        strcpy(nombre,nom);
    };
    void cambiarprecio(float prec){ //Recibe prec como parámetro y lo copia en el atributo precio.
        precio=prec;
    };
    void cambiarstock(int stoc){ //Recibe stoc como parámetro y lo copia en el atributo stock.
        stock=stoc;
    };
    void leenombre (cad &nom){ //Devuelve en el parámetro nom el contenido del atributo nombre.
        strcpy(nom,nombre);
    };
    float leeprecio (){ //Devuelve el contenido del atributo precio.
        return precio;
    };
    void leestock(int &st){ //Devuelve en el parámetro st el contenido del atributo stock.
        st=stock;
    };
    void vender(int cantidad){ //Simula la venta del producto, quitando del stock la cantidad cant pasada como parámetro, además mostrará por pantalla el precio a cobrar que será el
    //producto del precio unitario por la cantidad vendida. Si no hubiera en el stock suficiente cantidad mostrará un mensaje por pantalla expresando dicha circunstancia no realizándose la venta.
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
    almacen() //Constructor que pondrá el almacén vacío.
    {
        nprod=0;
    };
    void vaciar() //Método que pondrá el almacén vacío.
    {
        nprod=0;
    };
    int existe(cad nom) //Método que recibiendo el nombre de un producto como parámetro devolverá en qué posición de la tabla se encuentra almacenado un producto con ese nombre o bien -1 si no está.
    {
        bool encontrado=false;
        int pos=0;
        int r=-1;
        cad name;
        while(pos<MAX && !encontrado)
        {
            productos[pos].leenombre(name);
            if(strcmp(nom,name)==0)
            //(nom==productos[pos].leenombre)
            {
                encontrado=true;
                r=pos;
            }
            else
            {
                pos++;
                r=-1;
            }
        return r;
        }
    };
    void verprod (int pos, tprod &prod) //Método que pondrá en prod el contenido del producto que se encuentra en la posición pos de la tabla de productos.
    {
        cad nomprod;
        int stockprod;
        productos[pos].leenombre(nomprod);
        prod.cambiarnombre(nomprod);
        prod.cambiarprecio(productos[pos].leeprecio());
        productos[pos].leestock(stockprod);
        prod.cambiarstock(stockprod);
    };
    int insertar(tprod P)   //Método que intentará insertar un nuevo producto P pasado como parámetro en la tabla de productos. Si la tabla está llena devolverá un 2 y si ya hay un
                            //producto con el mismo nombre devolverá un 1 no insertando en ninguno de estos casos el producto. Si lo ha podido insertar devolverá un 0.
    {
        cad nomprod;
        P.leenombre(nomprod);

        int r;
        if(nprod==MAX)
        {
            r=2;
        }
        else if(existe(nomprod)!=-1)
        {

            r=1;
        }
        else
        {
            productos[nprod]=P;
            nprod++;

            r=0;
        }
    return r;
    };
    void vertabla (); //Método que visualizará por pantalla el contenido del almacén. Cada producto deberá mostrarse en una línea diferente con su nombre, precio y stock. Si el
    //almacén está vacío expresará esta situación por pantalla.
    void vender (int pos, int cant); //Método que recibiendo como parámetros pos y cantidad intentará realizar la venta del producto que está en la posición pos de la tabla y una
    //cantidad cant de ese producto.
};

int main()
{
    tprod prueba;
    almacen pru;
    cad n;
    float p;
    int s;
    int op=0;

    do{
        do{
            system("cls");
            cout<<"Opcion 1: Introducir producto\n";
            cout<<"Opcion 2: Consultar nombre del producto\n";
            cout<<"Opcion 3: Consultar precio\n";
            cout<<"Opcion 4: Consultar stock\n";
            cout<<"Opcion 5: Vender\n";
            cout<<"Opcion 6: Insertar\n";
            cout<<"Opcion 7: Ver tabla\n";
            cout<<"Opcion 8: Salir\n";
            cout<<endl;
            cout<<"Elija opcion del menu: ";
            cin>>op;
        }while((op<1)||(op>8));

        switch(op){
            case 1:
            {
                system("cls");
                cout<<"-----1. INTRODUCIR PRODUCTO-----";
                cout<<endl;
                cout<<"Introduzca nombre del producto: ";
                cin>>n;
                prueba.cambiarnombre(n);
                cout<<"Introduzca precio unitario del producto: ";
                cin>>p;
                prueba.cambiarprecio(p);
                cout<<"Introduzca stock del producto: ";
                cin>>s;
                prueba.cambiarstock(s);
                system("cls");
                break;
            }
            case 2:
            {
                system("cls");
                cout<<"-----2. CONSULTAR NOMBRE-----";
                cout<<endl;
                prueba.leenombre(n);
                cout << "Producto: " << n;
                cout<<endl;
                system("pause");
                break;
            }
            case 3:
            {
                system("cls");
                cout<<"-----3. CONSULTAR PRECIO-----";
                cout<<endl;
                cout<<"Precio:   "<< prueba.leeprecio();
                cout<<endl;
                system("pause");
                break;

                break;
            }
            case 4:
            {
                system("cls");
                cout<<"-----4. CONSULTAR PRECIO-----";
                cout<<endl;
                prueba.leestock(s);
                cout<<"Stock:   "<< s;
                cout<<endl;
                system("pause");
                break;
            }
            case 5:
            {
                int cant;
                system("cls");
                cout<<"-----5. VENTA-----";
                cout<<endl;
                cout<<"Introduzca cantidad que desea vender:";
                cin>>cant;
                if (cant<=s)
                {
                    s=s-cant;
                    p=p*cant;
                    cout<<"Se han vendido "<<cant<<" unidades por "<<p<<" euros, quedan "<<s<<" unidades en stock";
                    cout<<endl;
                    prueba.cambiarstock(s);
                    system("pause");
                }
                else
                {
                    cout<<"Stock insuficiente";
                    cout<<endl;
                    system("pause");
                }
                break;
            }
            case 6:
            {
                system("cls");
                cout<<"-----6. INSERTAR-----";
                cout<<endl;

                cad nomnuevoprod;
                tprod nuevoprod;
                float nuevoprec;
                int nuevostock;
                int pos;



                cout<<"Insertar nombre del nuevo producto: ";
                cin>>nomnuevoprod;
                cout<<endl;
                int produc;


                produc=pru.insertar(nuevoprod);

                if (produc==2)
                    cout<<"Almacen lleno"<<endl;
                else if(produc==1)
                    cout<<"El producto ya existe"<<endl;
                else if (produc==0){
                    prueba.cambiarnombre(nomnuevoprod);
                    cout<<"Introduzca precio del nuevo producto"<<endl;
                    cin>>nuevoprec;
                    cout<<endl;
                    prueba.cambiarprecio(nuevoprec);
                    cout<<"Introduzca stock del nuevo producto"<<endl;
                    cin>>nuevostock;
                    cout<<endl;
                    prueba.cambiarstock(nuevostock);

                }

                cout<<endl;
                system("pause");

                break;
            }
            case 7:
            {
                system("cls");
                cout<<"-----7. VER TABLA-----";
                cout<<endl;

                //pru.vertabla();

                break;
            }
            case 8:
            {
                cout<<"Saliendo...";
                cout<<endl;
                system("pause");
                break;
            }
            default:
            {
                cout<<"OPCION NO VALIDA";
                break;
            }

        }
    }while (op!=8);

    return 0;
}
