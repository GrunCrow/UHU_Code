#include <cstdlib>
#include <cstring> //strlen, strcpy
#include <iomanip> //std::setprecision
#include <sstream> //stringstream
#include "Cliente.h"

//Cliente::Cliente(long int d, char *nom, Fecha f):fechaAlta(f.getDia(), f.getMes(), f.getAnio()) {
Cliente::Cliente(long int d, char *nom, Fecha f):fechaAlta(f) { //esta cabecera es mas corta (invoco
  this->dni=d;                                                  //constructor copia de fecha
                                                                //en vez de constructor de 3 parametros)
  //this->nombre=nombre;  //MAL!!!!
 // cout<<strlen(nom)+1<<endl;
  this->nombre=new char[strlen(nom)+1];
  //cout<<"nombre"<<nom; system("pause");
  strcpy(this->nombre, nom);
    //cout<<nombre; system("pause");
  //this->fechaAlta=f;//MAL!!!! los tipos no primitivos debe ir en zona inicializadores
}

Cliente::~Cliente() {
  delete [] this->nombre; //si en el constructor uso new [] en el destructor uso delete []
  this->nombre=NULL;
}

Cliente& Cliente::operator=(const Cliente& c) { //Es lo mismo que un constructor de copia.
  if (this != &c) { //si no es x=x
    this->dni=c.dni;
    delete [] this->nombre;
    //this->nombre=c.nombre;  //MAL!!!!
    this->nombre=new char[strlen(c.nombre)+1];
    strcpy(this->nombre, c.nombre);
    this->fechaAlta=c.fechaAlta;
  }
  return *this;
}

bool Cliente::operator==( Cliente &c) const { //¿&?
  if (this->dni!=c.dni) return false;

  if (strcmp(this->nombre, c.nombre)!=0) return false;

  if (this->fechaAlta.getDia()!=c.fechaAlta.getDia() ||
      this->fechaAlta.getMes()!=c.fechaAlta.getMes() ||
      this->fechaAlta.getAnio()!=c.fechaAlta.getAnio()) return false;

  return true;
}
  void Cliente::setNombre(char *nom){
        if(this->nombre!=NULL)
            delete [] this->nombre;
      //cout<<strlen(nom)+1;system("pause");
      this->nombre=new char [strlen(nom)+1];
      //cout<<"nombre:"<<nombre<<endl<<"nom"<<nom<<endl;
      //system("pause");
      strcpy(this->nombre,nom);
        //cout<<"nombre:"<<this->nombre<<endl<<"nom"<<nom<<endl;
      //system("pause");
  }
  void Cliente::setFecha(Fecha f){
      fechaAlta.setFecha(f.getDia(),f.getMes(),f.getAnio());
  }

  ostream& operator<<(ostream &s, const Cliente &c){
      s << c.getNombre() << " (" << c.getDni() << " - " << c.getFecha() << ")" << endl;
      return s;
  }

//RESTO DE METODOS Y FUNCIONES A RELLENAR POR EL ALUMNO...
