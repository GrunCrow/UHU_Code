#ifndef AUTOBUSES_H
#define AUTOBUSES_H
#include <fstream>
#include <iostream>

#define SALTO 4 //valor de constante usado para adaptar el tamaño de las tablas
 // dinámicas, si éstas necesitan “crecer”

typedef char cadena[50];
using namespace std;

struct estado
{
    bool activo; //en servicio si/no
    float deposito; //litros del depósito
    int plazas; //capacidad
    bool itv; //itv pasada si/no
};
struct autobus
{
    cadena matricula; //formato NNNNLLL
    estado e;
    int conductor; //identificador conductor
};



class autobuses
{
    autobus *elementos;
    fstream fichero;
    int tam; //tamaño de la tabla dinámica
    int n; //número de autobuses
    bool cargado; //indica si el fichero está cargado en memoria
public:
    autobuses(); //constructor de la clase. Inicializa las variables de la clase. En
//particular destacar que se “enlaza” ya con el fichero físico de
//“autobuses.dat” para permitir poder trabajar con él mientras no se
//cargue en memoria
    ~autobuses();
    void Insertar(autobus a);
//posición)
    void Borrar (cadena mat,int pos); //borra el autobús (se le pasa matrícula o
    void Modificar(autobus a, cadena mat,int pos); //modifica el autobús cuya
// matrícula sea mat o esté en la posición pos, con los datos del autobus a)
    int Buscar(cadena mat); //devuelve la posición del autobús mat. – 1 si no lo
// encuentra
    void Mostrar(cadena mat,int pos); //muestra por pantalla el autobús (se le pasa
// matrícula o posición)
    void Listar();
    bool Cargar(); //permite cargar en memoria el fichero de autobuses denominado
// “autobuses.dat”. Devuelve true si correcto, false si error.
    bool Guardar();//Vuelca el contenido de la tabla dinámica (si ésta existe) al
// fichero “autobuses.dat”
};


#endif // AUTOBUSES_H
