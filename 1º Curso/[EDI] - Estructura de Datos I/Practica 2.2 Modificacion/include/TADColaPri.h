#ifndef TADCOLAPRI_H
#define TADCOLAPRI_H
#include "tadcola.h"
#define MAXcolas 9

class ColaPri {
    cola tabla[MAXcolas];
public:
    ColaPri(); //Constructor: crea un objeto ColaPri vacío
    ~ColaPri(); //Destructor: libera la memoria dinámica del objeto ColaPri
    void insertarColaPri(int i, Paciente p);
    /*Insertará el paciente p en la cola de prioridad i de la ColaPri*/
    void sacarColaPri();
    /*Elimina el paciente de mayor prioridad. Si hay varios con la misma
    prioridad saldrá aquel que lleve más tiempo en el objeto ColaPri*/
    Paciente consultarColaPri();
    /*Devuelve el paciente de mayor prioridad almacenado en el objeto ColaPri
    original sin quitarlo. Si hay varios con la misma prioridad saldrá aquel
    que lleve más tiempo en el objeto ColaPri*/
    bool esvaciaColaPri();//Devuelve si el objeto ColaPri está vacío
    int longitudColaPri();//Devuelve la longitud del objeto ColaPri
    bool cargarfichero (cadena fich);
    /*Cargará los datos almacenados en el fichero cuyo nombre se pasa como
    parámetro en el objeto ColaPri. Devuelve true si no hay error en la carga*/
    bool guardarfichero (cadena fich);
    /*Guardará los datos del objeto ColaPri en el fichero cuyo nombre se pase
    como parámetro. Devuelve true si no hay error al guardar el objeto*/
    bool busqueda(cadena nombre, cadena apellido, int &prioridad);
};

#endif // TADCOLAPRI_H
