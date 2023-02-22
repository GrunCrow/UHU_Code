#include "Fecha.h"
#include "iostream"

using namespace std;

Fecha::Fecha(int dia,int mes,int anio){
    this->setFecha(dia,mes,anio);
}

int Fecha::getDia() const{
    return dia;
}

int Fecha::getMes() const{
    return mes;
}

int Fecha::getAnio() const{
    return anio;
}

bool Fecha::Bisiesto() const{
    bool bisiesto=false;

    if((this->anio%4==0) && ((this->anio%100!=0) || (this->anio%400==0)))
       bisiesto=true;

    return bisiesto;
}

void Fecha::setFecha(const int &dia, const int &mes, const int &anio){
    int diaMes[] = {0,31,28,31,30,31,30,31,31,30,31,30,31}; //poner mes sin el +1al poner el primero como 0 (mes0=0)
    this->anio=anio;
    if(this->Bisiesto())
        diaMes[2]=29;

    if(mes>12)
        this->mes=12;
    else if (mes<1)
        this->mes=1;
    else //mes entre 1-12
        this->mes=mes;

    if(dia>diaMes[this->mes])
        this->dia=diaMes[mes];
    else if(dia<1)
        this->dia=1;
    else
        this->dia=dia;

}

void Fecha::ver() const{
    if (this->dia < 10)
        cout << "0";
    cout << this->dia << "/";
    if (this->mes < 10)
        cout << "0";
    cout << this->mes << "/" << this->anio;
}

Fecha Fecha::operator+(const int i) const{
    Fecha result=*this;
    /*result.dia=this->dia;
    result.mes=this->mes;
    result.anio=this->anio;*/

    int dmax, diaMes[] = {0,31,28,31,30,31,30,31,31,30,31,30,31};
    if (result.Bisiesto()) //si el año es bisiesto febrero tiene 29 dias
      diaMes[2]=29;

    dmax=diaMes[result.mes];

    result.dia=result.dia+i;

    if (result.dia>dmax) { //si al incrementar dia superamos el numero de dias de dicho mes
        do{
            result.dia=result.dia-dmax;      //pasamos al dia del mes anterior
            result.mes++;
            dmax=diaMes[result.mes];                 //incrementamos un mes
            if (result.mes>12) {                    //si al incrementar mes pasamos de 12 meses
                result.mes=1;                           //pasamos al mes 1
                result.anio++;   //del año siguiente
                if (result.Bisiesto()) //si el año es bisiesto febrero tiene 29 dias
                    diaMes[2]=29;
                else
                    diaMes[2]=28;
            }
        }while(result.dia>dmax);                      //hasta que el dia < diamax del mes en el q ns encontremos
    }

    return result; //devolvemos la copia en resultado
}

Fecha Fecha::operator++() {   //++f
    int dmax, diaMes[] = {0,31,28,31,30,31,30,31,31,30,31,30,31};
    if (this->Bisiesto()) //si el año es bisiesto febrero tiene 29 dias
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

Fecha Fecha::operator++(const int notused){   //f++
    Fecha copia(*this);
    /*int d,m,a;
    d=this->dia;
    m=this->mes;
    a=this->anio;*/

    //copia.setFecha(d,m,a);
    int dmax, diaMes[] = {0,31,28,31,30,31,30,31,31,30,31,30,31};
    if (this->Bisiesto()) //si el año es bisiesto febrero tiene 29 dias
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
    return copia; //devolvemos el objeto fecha ya incrementado
}

Fecha operator+(const int &i, const Fecha &f){ //const por seguridad y & por velocidad

    return f+i;

    /*int dmax, diaMes[] = {0,31,28,31,30,31,30,31,31,30,31,30,31};
    if (*f.Bisiesto()) //si el año es bisiesto febrero tiene 29 dias
      diaMes[2]=29;

    dmax=diaMes[*f.mes];

    int d,m,a;

    d=*f.getDia();
    m=*f.getMes();
    a=*f.getAnio();

    *f.setFecha(d,m,a);

    if (f.dia>dmax) { //si al incrementar dia superamos el numero de dias de dicho mes
        do{
            f.getDia()=f.getDia()-dmax;      //pasamos al dia del mes anterior
            f.mes++;
            dmax=diaMes[f.mes];                 //incrementamos un mes
            if (f.mes>12) {                    //si al incrementar mes pasamos de 12 meses
                f.mes=1;                           //pasamos al mes 1
                f.anio++;   //del año siguiente
                if (f.Bisiesto()) //si el año es bisiesto febrero tiene 29 dias
                    diaMes[2]=29;
                else
                    diaMes[2]=28;
            }
        }while(f.dia>dmax);                      //hasta que el dia < diamax del mes en el q ns encontremos
    }
    return f; //devolvemos la copia en resultado*/
}

ostream& operator<<(ostream& s, const Fecha &o) {
    s << (o.getDia()<10?"0":"") << o.getDia() << " ";
    switch(o.getMes()){
        case 1: s << "ene"; break;
        case 2: s << "feb"; break;
        case 3: s << "mar"; break;
        case 4: s << "abr"; break;
        case 5: s << "may"; break;
        case 6: s << "jun"; break;
        case 7: s << "jul"; break;
        case 8: s << "ago"; break;
        case 9: s << "sep"; break;
        case 10: s << "oct"; break;
        case 11: s << "nov"; break;
        case 12: s << "dic"; break;
    }
    s << " " << o.getAnio();
}

Fecha::~Fecha()
{
    //dtor
}
