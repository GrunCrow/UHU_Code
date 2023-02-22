#include "Fecha.h"

Fecha::Fecha(const int &dia, const int &m, const int &anio) {
    this->setFecha(dia, m, anio); //el codigo es el mismo que el del metodo setFecha
}

void Fecha::setFecha(const int &dia, const int &mes, const int &a) {

//ES MAS RAPIDO Y COMODO USAR UN ARRAY QUE GUARDE LOS DIAS DE CADA MES...
    int dmax, diaMes[] = {0,31,28,31,30,31,30,31,31,30,31,30,31};
    this->anio=a; //VIP debo asignar año para que al llamar a bisiesto() tenga el año bien
    if (this->bisiesto())
        diaMes[2]=29;

    if (mes<1)  //si el mes es incorrecto
      this->mes=1;
    else if (mes>12) //si el mes es incorrecto
      this->mes=12;
    else
    this->mes=mes;

    dmax=diaMes[this->mes]; //una vez fijado el mes veo cuantos dias tiene ese mes como maximo
/*cout<<"thismes:"<<this->mes<<"\n"<<"mes:"<<mes;
system("pause");*/

    if (dia>dmax) //si dia es superior al numero de dias de dicho mes
      this->dia=dmax;
    else if (dia<1) //si dia es inferior a 1
      this->dia=1;
    else
        this->dia=dia;

   // cout<<"thisdia:"<<this->dia<<endl<<"dia"<<dia<<endl<<"dmax:"<<dmax;
}

bool Fecha::bisiesto() const {
    if ((this->anio%4==0 && this->anio%100!=0) || (this->anio % 400 == 0)) //esto no es exacto... corregidlo ustedes
        return true;
    else
        return false;
}

void Fecha::ver() const {
  if (this->dia < 10)
    cout << "0";
  cout << this->dia << "/";
  if (this->mes < 10)
    cout << "0";
  cout << this->mes << "/" << this->anio;
}

Fecha Fecha::operator++() {   //++f
    int dmax, diaMes[] = {0,31,28,31,30,31,30,31,31,30,31,30,31};
    if (this->bisiesto()) //si el año es bisiesto febrero tiene 29 dias
      diaMes[2]=29;
    dmax=diaMes[this->mes];
    this->dia++;
    if (this->dia>dmax) { //si al incrementar dia superamos el numero de dias de dicho mes
        this->dia=1;      //pasamos a 1
        this->mes++;      //del mes siguiente
            if (this->mes>12) { //si al incrementar mes pasamos de 12 meses
                this->mes=1;    //pasamos al mes 1
                this->anio++;   //del año siguiente
            }
    }
    return *this; //devolvemos el objeto fecha ya incrementado
}
Fecha Fecha::operator++(/*const int &i*/int notused){ //devuelvo la copia, incremento el original
    Fecha copia = *this; //guardo una copia de la fecha.
    //Incremento la fecha original.
    int dmax, diaMes[] = {0,31,28,31,30,31,30,31,31,30,31,30,31};
    if (this->bisiesto()) //si el año es bisiesto febrero tiene 29 dias
      diaMes[2]=29;
    dmax=diaMes[this->mes];
    this->dia++;
    if (this->dia>dmax) { //si al incrementar dia superamos el numero de dias de dicho mes
        this->dia=1;      //pasamos a 1
        this->mes++;      //del mes siguiente
            if (this->mes>12) { //si al incrementar mes pasamos de 12 meses
                this->mes=1;    //pasamos al mes 1
                this->anio++;   //del año siguiente
            }
    }
    return copia; // Devuelvo la copia antes de ser incrementada.
} //f++
Fecha Fecha::operator+(const int &i) const{
    Fecha f=*this;
    for(int j=0;j<i;j++)
        f++;
    return f;
} //f+5
Fecha operator+(const int &i, const Fecha &f){
    Fecha fech=f;
    for(int j=0;j<i;j++)
        ++fech;
    return fech;
} //2+f
//RESTO DE METODOS Y FUNCIONES A RELLENAR POR EL ALUMNO...
ostream& operator<<(ostream &s, const Fecha &f){
    char *nombreMes[] = {"error", "ene", "feb", "mar", "abr", "may", "jun", "jul", "ago", "sep", "oct", "nov", "dic"};
  if (f.dia < 10)
    s << "0";
  s << f.dia << " ";

  s << nombreMes[f.mes] << " " << f.anio;

    return s;
}
