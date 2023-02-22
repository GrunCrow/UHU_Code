#include <iostream> //cin, cout
#include <conio.h> // getch
#include <fstream>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAXIMO 20
#define M 5
using namespace std;






class quebrado {
 int numerador, denominador;
public:
 quebrado() { numerador=0; denominador=1; }
 quebrado(int n, int d=1);
 int getnumerador() { return numerador; }
 int getdenominador() {return denominador; }
 void valor(int n, int d=1);
 quebrado operator+(quebrado q);
 quebrado operator-(quebrado q);
 quebrado operator*(quebrado q);
 quebrado operator/(quebrado q);
 quebrado operator-();
 int operator==(quebrado q);
 void mostrar();
};

typedef quebrado tipoelemento ;

int mcd(int a, int b) {
 int comun,encontrado=0;
 a=abs(a);
 b=abs(b);
 if (a>b)	comun=b;
 else comun=a;
 while (comun>1 && !encontrado)
 {
 if (a%comun==0 && b%comun==0)
	  	encontrado=1;
 else comun--;
}
 return(comun);
}
//calcula el mcm de a y b (en positivo)
int mcm(int a, int b) {
 int comun,encontrado;
 if (a<0) a=-a;
 if (b<0) b=-b;
 if (a>b)	comun=a;
 else comun=b;
 encontrado=0;
 while (!encontrado) {
	if (comun%a==0 && comun%b==0)
	 	encontrado=1;
	else
	 	comun++;
 }
 return(comun);
}

quebrado::quebrado(int n, int d) {
 if (d==0) 	cout << "\nError: Quebrado no valido";
 numerador=n; denominador=d;
}

void quebrado::valor(int n, int d) {
 if (d==0) 	cout << "\nError: Quebrado no valido";
 numerador=n; denominador=d;
}

void quebrado::mostrar() {
 if (denominador>0)	cout << numerador << "/" << denominador;
 else 	cout << -numerador << "/" << -denominador;
}

quebrado quebrado::operator/(quebrado q) {
 quebrado division;
 division.numerador=numerador*q.denominador;
 division.denominador=denominador*q.numerador;
 return division;
}
quebrado quebrado::operator-() {
 quebrado aux;
 aux.numerador=-numerador;
 aux.denominador=denominador;
 return aux;
}

int quebrado::operator==(quebrado q) {
 int igual;
 if (numerador*q.denominador==denominador*q.numerador)
	igual=1;
 else
	igual=0;
 return igual;
}


quebrado quebrado::operator+(quebrado q) {
quebrado suma;
 int comun;
 if (denominador==q.denominador) {
	suma.numerador= numerador + q.numerador;
	suma.denominador = denominador;
 }
 else {
	comun=mcm(denominador,q.denominador);
	suma.denominador = comun;
	suma.numerador=numerador*comun/denominador +	    q.numerador*comun/q.denominador;
  }
 return suma;
}
quebrado quebrado::operator-(quebrado q) {
 quebrado resta;
 q.numerador=-q.numerador;
 resta=(*this)+q;
 return(resta);
}
quebrado quebrado::operator*(quebrado q) {
 quebrado producto;
 producto.numerador=numerador*q.numerador;
 producto.denominador=denominador*q.denominador;
 return producto;
}


class complejo {
double real, imag;
public:
 complejo(void) { real = 0.0; imag = 0.0; }
 complejo(double re, double im=0.0) { real = re; imag = im;}
 complejo(const complejo& r) { real = r.real;imag = r.imag;}
 void SetReal(double re) { real = re; }
 void SetImag(double im) { imag = im; }
 double GetReal(void) {return real; }
 double GetImag(void) {return imag; }
 complejo operator+(int e);
 complejo operator+(complejo c);     //por valor
 complejo operator-(const complejo& c); //por ref
 int operator== (complejo c);
 complejo operator=(complejo c);
 complejo operator*(complejo c);
 complejo operator++(); // ++obj;
 complejo operator++(int notused); //obj++
 complejo operator-();
 void mostrar();
};


complejo complejo::operator+ (int e) {
 complejo suma;
 suma.real = real + e;   suma.imag = imag;
 return suma;
}
// sobrecarga de +
complejo complejo::operator+ (complejo c) {
 complejo suma;
 suma.real = real + c.real;
 suma.imag = imag + c.imag;
 return suma;
}
// sobrecarga de -
complejo complejo::operator- (const complejo &c) {
 complejo resta;
 resta.real = real - c.real;
 resta.imag = imag - c.imag;
 return resta;
}
// sobrecarga de ==
int complejo::operator== (complejo c) {
 if (real==c.real && imag==c.imag)
  return 1;
 else
  return 0;
}
// sobrecarga de =
complejo complejo::operator= (complejo c) {
 real=c.real; imag=c.imag;
 return c;
}
// sobrecarga de – unario
complejo complejo::operator-() {
complejo copia;
copia.real=-real;
copia.imag=-imag;
return copia;
}
// sobrecarga de ++ (++obj)
complejo complejo::operator++() {
complejo copia;
real++;
copia.real=real;
copia.imag=imag;
return copia;
}
// sobrecarga de ++ (obj++)
complejo complejo::operator++(int notused){
complejo copia;
copia.real=real;
copia.imag=imag;
real++;
return copia;
}
//sobrecarga de *
complejo complejo::operator*(complejo c){
//Falta implementar
complejo copia;


return copia;
}
// mostrar complejo
void complejo::mostrar(){
if (imag>0)
    cout<<real<<"+"<<imag<<"i";
else
    cout<<real<<imag<<"i";
}





class matriz {
private:
 tipoelemento celda[M][M];
 int fila,col;
public:
 matriz(int f=0, int c=0);
 int getfila() { return fila; }
 int getcol() { return col; }
 bool operator==(matriz m);
 matriz operator*(matriz m);
 matriz operator+(matriz m);
 matriz operator-(matriz m);
 matriz operator-();
 void mostrar();
 void cargar();
 void cargar(char cad[]);
};


void matriz::cargar(char cad[]) {
 int x, y;
 FILE *fin=NULL;
 do {
  cout << "Filas: "; cin >> fila;
  cout << "Columnas: "; cin >> col;
 } while (fila>M || fila<1 || col>M || col<1);
 cout << "Carga de una matriz " << fila << " x " << col << ":\n";
 fin = fopen(cad, "rb");
 if (fin != NULL) {
  for (int i=0; i<fila; i++)
   for (int j=0; j<col; j++) {
            int n= rand()%80+1;
            fseek(fin,sizeof(int)*n,SEEK_SET);
            fread(&x,sizeof(int),1,fin);
            fread(&y,sizeof(int),1,fin);
            tipoelemento A(x,y);
            celda[i][j]=A;
            cout << "[" << i+1 << "," << j+1 << "]: ";
            A.mostrar();
            cout<<'\n';
  }
    fclose(fin);
    fin = NULL;
  }
  else {
    cout << "Error al abrir el fichero de numeros\n";
  }
}
void matriz::cargar() {
int x, y;
 do {
  cout << "Filas: "; cin >> fila;
  cout << "Columnas: "; cin >> col;
 } while (fila>M || fila<1 || col>M || col<1);
 cout << "Carga de una matriz " << fila << " x " << col << ":\n";
 for (int i=0; i<fila; i++) {
  for (int j=0; j<col; j++) {
   cout << "[" << i+1 << "," << j+1 << "]: ";
   cin>>x>>y;
   tipoelemento A(x,y);
   celda[i][j]=A;
   //A.mostrar();
  }
 }
}

matriz::matriz(int f, int c) {
 fila=f;
 col=c;
 for (int i=0; i<fila; i++)
  for (int j=0; j<col; j++)
   celda[i][j]=0;
}

bool matriz::operator==(matriz m){
    bool iguales=true;
    if (fila==m.fila && col==m.col){
        int i=0;
        while(i<fila && iguales)
        {
            int j=0;
            while(j<col && iguales){
               if (!(celda[i][j]==m.celda[i][j]))
                    iguales=false;
               else j++;
            }
            i++;
        }
    }
    else iguales=false;
    return iguales;
}

matriz matriz::operator*(matriz m) {
 int i,j,k;
 tipoelemento prod;
 matriz p(fila,m.col);
 for (i=0; i< fila; i++)
  for (j=0; j< m.col; j++) {
   prod=0;
   for (k=0; k< col; k++)
    prod=prod+(celda[i][k]*m.celda[k][j]);
   p.celda[i][j]=prod;
  }
 return(p);
}

matriz matriz::operator+(matriz m) {
 int i,j;
 matriz p(fila,col);
 for (i=0; i< fila; i++) {
  for (j=0; j< col; j++) {
   p.celda[i][j]=celda[i][j]+m.celda[i][j];
  }
 }
 return(p);
}

matriz matriz::operator-(matriz m) {
 matriz p(fila,col);
 for (int i=0; i< fila; i++) {
  for (int j=0; j< col; j++) {
   p.celda[i][j]=celda[i][j]-m.celda[i][j];
  }
 }
 return(p);
}

matriz matriz::operator-() {
 int i,j;
 matriz p(fila,col);
 for (i=0; i< fila; i++) {
  for (j=0; j< col; j++) {
   p.celda[i][j]=-celda[i][j];
  }
 }
 return(p);
}

void matriz::mostrar() {
 int i,j;
 for (i=0; i<fila; i++) {
	for (j=0; j< col; j++) {
	 celda[i][j].mostrar();cout << "\t";
	}
	cout << "\n";
 }
}



int main() {
 matriz m[MAXIMO];
 matriz result;
 int n,N=0;//Numero de matrices del vector
 int i,pos,pos2;
 char comando[20];
 bool salir=false;
 system("cls");

 do {
  cout << ">";
  fflush(stdin); gets(comando);
  if (strcmp(comando,"cargar")==0) {
    cout<<"Cuantas matrices quieres cargar? \n"; cin>>n;
    if (n+N>=MAXIMO)
     cout<<"Se excede el numero de matrices con las que operar\n";
    else
    {
        N=N+n;
        for (i=0;i<n;i++)
                 m[i].cargar("numeros.dat");
    }
  }
  else if (strcmp(comando,"listar")==0) { //listar
   if (N==0)
    cout << "No hay cargada ninguna matriz" << endl;
   else
    {
       for (i=0;i<N;i++){
            cout<<"\nMatriz " <<i+1<<":\n\n";
            m[i].mostrar();
       }
    }
   }
   else if (strcmp(comando,"buscar")==0) { //buscar
   if (N==0)
    cout << "No hay cargada ninguna matriz" << endl;
   else
    {
       result.cargar();

       i=0;
       while (i<N && !(result==m[i]))
               i++;
       if (result==m[i])
              cout<<"\nLa matriz esta en la posicion "<<i<<" del vector\n";
       else cout<<"\nNo se ha encontrado la matriz\n";
    }
   }
   else if (comando[0]=='+'){
      switch(comando[1])
      {
          case '+': cout<<"Posicion?:";cin>>pos;//Insertar matriz en la posicion pos
                    if (pos>=0 && pos<=N){
                        N++;
                        for(i=N-1;i>=pos;i--)
                           m[i]=m[i-1];
                        m[pos].cargar();
                    }
                    else cout<<"La posicion no es valida\n";break;
          case 0:   cout<<"Posiciones?:";cin>>pos>>pos2;//Sumar matrices en estas posiciones
                    if (pos>=0 && pos<N && pos2>=0 && pos2<N ){
                       if (m[pos].getfila()!=m[pos2].getfila() || m[pos].getcol()!=m[pos2].getcol())
                           cout << "Error: Las matrices no se pueden sumar" << endl;
                       else {
                             result= m[pos]+ m[pos2];
                             cout<<"Matriz resultante:\n";result.mostrar();
                       }
                    }
                    else cout<<"Posiciones no validas\n";
       }
  }
  else if (comando[0]=='-') {
      switch(comando[1])
      {
          case '-':cout<<"Posicion?:";cin>>pos;//Eliminar matriz en la posicion pos
                   if (pos>=0 && pos<N){
                       for(i=pos;i<N-1;i++)
                           m[i]=m[i+1];
                       N--;
                   }
                   else cout<<"La posición no es valida\n";break;
          case 0:  cout<<"Posiciones?:";cin>>pos>>pos2;//Restar matrices en estas posiciones
                    if (pos>=0 && pos<N && pos2>=0 && pos2<N ){
                       if (m[pos].getfila()!=m[pos2].getfila() || m[pos].getcol()!=m[pos2].getcol())
                          cout << "Error: Las matrices no se pueden sumar" << endl;
                       else {
                             result= m[pos]-m[pos2];
                             cout<<"Matriz resultante:\n";result.mostrar();
                            }
                    }
                    else cout<<"Posiciones no validas\n";
      }
  }
  else if (comando[0]=='*') {
      cout<<"Posiciones?:";cin>>pos>>pos2;//Multiplicar matrices en estas posiciones
      if (pos>=0 && pos<N && pos2>=0 && pos2<N){
         if (m[pos].getcol()!=m[pos2].getfila())
               cout << "Error: Las matrices no se pueden multiplicar" << endl;
         else {
               result= m[pos]*m[pos2];
               cout<<"Matriz resultante:\n";result.mostrar();
              }
      }
      else cout<<"Posiciones no validas\n";
  }

  else if (comando[0]=='?') { //Mostrar una matriz del vector
         cout<<"Posicion?:";cin>>pos;
         if (pos>=0 && pos<N) m[pos].mostrar();
         else cout<<"La posicion no es valida\n";
  }
  else if (strcmp(comando,"salir")==0)   salir=true;
  else
      cout << "comando o orden incorrecta" << endl;

 } while (!salir);

return 0;           // Valor de retorno al S.O.
}


