#ifndef ITINERARIOS_H
#define ITINERARIOS_H
#include <fstream>
#include <iostream>

#define SALTO 4

typedef char cadena[50];

using namespace std;

struct Hora
{
    int h;
    int m;
    bool am; //1 si am, 0 si pm
};
struct itinerario
{
    cadena nombre;
    cadena origen;
    cadena destino;
    Hora inicio;
    Hora fin;
    cadena matricula;
};
class itinerarios
{
    itinerario *elementos;
    fstream fichero;
    int tam; //tamaño de la tabla dinámica
    int n; //número de autobuses
    bool cargado; //indica si el fichero está cargado en memoria
public:
    itinerarios(); //constructor de la clase;
    ~itinerarios();
    void Insertar(itinerario i);
    void Borrar (cadena nombrei,cadena mat,int pos); //borra el itinerario (se le
// pasa nombre itinerario y matricula o bien posición)
    void Modificar(itinerario a, cadena nombrei, cadena mat,int pos); //modifica el
// itinerario cuyo nombre de itinerario sea nombrei y matrícula sea mat o
// bien esté en la posición pos, con los datos del itinerario i)
    int Buscar(cadena nombrei,cadena mat); //devuelve la posición del itinerario de
//nombre nombrei y matricula mat. – 1 si no lo encuentra
    void Mostrar(cadena nombrei, cadena mat,int pos); //muestra por pantalla el
// itinerario de nombre nombrei y matricula mat o bien de posición pos)
    void Listar();
    bool Cargar(); //permite cargar en memoria el fichero de itinerarios denominado
// “itinerarios.dat”. Devuelve true si correcto, false si error.
    bool Guardar();//Vuelca el contenido de la tabla dinámica (si ésta existe) al
// fichero “itinerarios.dat”
    void Itinerariosenintervalo(int inicio, int fin);
};

#endif // ITINERARIOS_H
