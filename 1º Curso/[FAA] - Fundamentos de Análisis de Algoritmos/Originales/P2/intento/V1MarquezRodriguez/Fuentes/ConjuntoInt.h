#ifndef _LIB_CONJUNTOINT
#define _LIB_CONJUNTOINT

#include <iostream>
using namespace std;

/////////// Declaración de la clase conjuntoInt /////////////

class ConjuntoInt
{
private:
	int tamano;
	int *datos; 
public:
	ConjuntoInt (int max= 0); 
	~ConjuntoInt (); 
	void vaciar ();
	void GeneraVector (int tam);
	int* getDatos();
	void escribe ();
};

#endif

