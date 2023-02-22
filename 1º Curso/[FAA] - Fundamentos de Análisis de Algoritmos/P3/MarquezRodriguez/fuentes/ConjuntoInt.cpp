#include <iostream>
using namespace std;
#include <cstdlib>
#include "ConjuntoInt.h"

ConjuntoInt::ConjuntoInt (int max)
{
 tamano= max;
 datos= new int[max];
}

void ConjuntoInt::copiarDatos (int max,int *d)
{
//copia datos que se pasen
 tamano=max;

 for(int i=0;i<max;i++){
    datos[i]=d[i];
 }
}

ConjuntoInt::~ConjuntoInt ()
{
 delete[] datos;
}
void ConjuntoInt::vaciar ()
{
 tamano= 0;
}
int* ConjuntoInt::getDatos()
{
	int* v=datos;
	for (int i= 0; i <tamano;i++){
		v[i]=datos[i];}
	return v;
}

void ConjuntoInt::GeneraVector (int tam)
{
 tamano=tam;
 for (int i= 0; i<tamano; i++){
     datos[i] = rand()%1000; //genera un número aleatorio entre 1 y 999
 }
}

void ConjuntoInt::escribe()
{
 for (int i= 0; i<tamano; i++)
     cout << datos[i] << (i<tamano-1? ", ": "\n");
}

int ConjuntoInt::generaKey()
{
	return datos[rand()%tamano]; // devuelve el valor del  array en una posición aleatoria entre 1 y el tamaño del array
}

