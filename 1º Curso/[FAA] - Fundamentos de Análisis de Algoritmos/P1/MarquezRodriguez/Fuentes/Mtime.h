#ifndef _MTIME
#define _MTIME

#include <stdio.h>
#include <windows.h>
/////////// Declaración de la clase TIEMPO /////////////

class Mtime
{
public:
	/* retorna "a - b" en segundos */
	double performancecounter_diff(LARGE_INTEGER *a, LARGE_INTEGER *b);
};
#endif

// Uso
//.......
//{
//LARGE_INTEGER t_ini, t_fin;
//double secs;

//QueryPerformanceCounter(&t_ini);
/* ...hacer algo... */

/*
QueryPerformanceCounter(&t_fin);

secs = performancecounter_diff(&t_fin, &t_ini);

cout<<"tiempo= "<<secs * 1000.0<<"milisegundos\n";
.......
}
*/
