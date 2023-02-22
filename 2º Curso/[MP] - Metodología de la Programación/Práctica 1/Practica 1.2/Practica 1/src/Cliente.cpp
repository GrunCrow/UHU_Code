#include "Cliente.h"
#include <cstring>
#include "Fecha.h"

Cliente::Cliente(long int d, char *nom, Fecha f):fechaAlta(f){
    this->dni=d;

    this->nombre=new char[strlen(nom)+1];
    strcpy(this->nombre,nom);
                                                    //para fecha ya tenemos el constructor en su clase correspondiente, no es primitivo
}

long int Cliente::getDNI() const{
    return dni;
}

const char* Cliente::getNombre() const{
    return nombre;
}
Fecha Cliente::getFecha() const{
    return fechaAlta;
}

void Cliente::setNombre(char *nom){
    if(this->nombre!=NULL){
        delete[] this->nombre;                      //Si ya existe un nombre, eliminamos el espacio de memoria
        this->nombre=NULL;
    }
    this->nombre=new char[(strlen(nom)+1)];
    strcpy(this->nombre,nom);
}

void Cliente::setFecha(Fecha f){
    fechaAlta=f;
}

void Cliente::setDni(long int dni){
    this->dni=dni;
}

Cliente& Cliente::operator=(const Cliente& c) {
    if (this != &c) {                               //si no es x=x
        this->dni=c.dni;
        delete [] this->nombre;
        this->nombre=new char[strlen(c.nombre)+1];
        strcpy(this->nombre, c.nombre);
        this->fechaAlta=c.fechaAlta; //Se puede hacer una copia porque no se pasa por referencia
    }
    return *this;
}


bool Cliente::operator==(Cliente &c) const{
    bool iguales=false;
    if(c.dni==this->dni)
        if(strcmp(c.nombre,this->nombre)==0)
            if (this->fechaAlta.getDia()==c.fechaAlta.getDia() && this->fechaAlta.getMes()==c.fechaAlta.getMes() &&
                this->fechaAlta.getAnio()==c.fechaAlta.getAnio())
                iguales=true;

    return iguales;

}

/*bool Cliente::operator==(Cliente &c) const {
  if (this->dni!=c.dni) return false;
  if (strcmp(this->nombre, c.nombre)!=0) return false;
  if (this->fechaAlta.getDia()!=c.fechaAlta.getDia() ||
      this->fechaAlta.getMes()!=c.fechaAlta.getMes() ||
      this->fechaAlta.getAnio()!=c.fechaAlta.getAnio()) return false;
  return true;
}*/


ostream& operator<<(ostream &s, const Cliente &c){ //funcion no amiga de la clase
    s << c.getNombre() << " (" <<  c.getDNI() << " - " << c.getFecha() << ")";
    return s;
}


Cliente::~Cliente()
{
    delete [] this->nombre;
    this->nombre=NULL;
}

