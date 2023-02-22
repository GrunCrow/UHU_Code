#include <iostream>
using namespace std;
#include "conjuntoInt.h"

///////////// Implementación de los métodos /////////////

void conjuntoInt::vaciar ()
{
 tamano= 0;
}
void conjuntoInt::insertar (int n)
{
 if (tamano<MAXIMO)
    datos[tamano++]= n; // pueden estar repetidos pues no se comprueba si ya está el n
 else
     cerr << "ERROR: el conjunto esta lleno "<<endl;
}

bool conjuntoInt::miembro (int n)
{
	int i=0;
	while (datos[i]!= n && i<tamano)
	{
		i=i+1;
	}
	if (datos[i]==n)
		return true;	 // se encuentra el elemento en el array
	else
		return false;  // no se encuentra el elemento en el array
}
void conjuntoInt::ordena (int tam)
{
 for (int i= 0; i<tam-1; i++)
     for (int j= i+1; j<tam; j++)
         if (datos[j]<datos[i]) {
            int tmp= datos[i];
            datos[i]= datos[j];
            datos[j]= tmp;
         }
}

void conjuntoInt::escribe (int tam)
{
 for (int i= 0; i<tam; i++)
     cout << datos[i] << (i<tam-1? ", ": "\n");
}
