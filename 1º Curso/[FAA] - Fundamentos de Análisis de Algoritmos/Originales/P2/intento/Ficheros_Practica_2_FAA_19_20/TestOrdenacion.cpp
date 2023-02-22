/*
 * La clase TestOrdenacion contiene los metodos para:
 * 1. Comprobar que los métodos de ordenacion de la clase Ordenacion funcionan adecuadamente.
 * 2. Calcular la eficiencia para el caso medio de un método de ordenación,
 *    guardando los datos y permitiendo imprimir la gráfica correspondiente
 * 3. Comparar el coste temporal de dos de los métodos de ordenación
 *    burbuja, inserción, y selección, guardando los datos y permitiendo imprimir la gráfica correspondiente.
 */
#include "AlgoritmosOrdenacion.h"
#include "TestOrdenacion.h"
#include "ConjuntoInt.h"
#include "Graficas.h"
#include "Mtime.h"
#include "Constantes.h"
#include <string>
#include <fstream>
#include <iomanip>
#include <iostream>
using namespace std;


TestOrdenacion::TestOrdenacion()
{
	nombreAlgoritmo.push_back("Burbuja");
	nombreAlgoritmo.push_back("Insercion");
	nombreAlgoritmo.push_back("Seleccion");
}
TestOrdenacion::~TestOrdenacion(){}

/*
 * Ordena un array de enteros según el método indicado
 * param v: el array de enteros a ordenar
 * param size: tamaño del array de enteros a ordenar
 * param metodo: Metodo de ordenacion a utilizar
 * return Tiempo empleado en la ordenación (en milisegundos)
 */
double TestOrdenacion::ordenarArrayDeInt(int v[],int size,int metodo)
{
	AlgoritmosOrdenacion estrategia;
	Mtime t;
	LARGE_INTEGER t_inicial, t_final;
	QueryPerformanceCounter(&t_inicial);
	/* Invoca al método de ordenación elegido */
	switch (metodo){
		case BURBUJA: estrategia.ordenaBurbuja(v, size);
			break;
		case INSERCION: estrategia.ordenaInsercion(v, size);
			break;
		case SELECCION: estrategia.ordenaSeleccion(v, size);
			break;
	}
	QueryPerformanceCounter(&t_final);
	return t.performancecounter_diff(&t_final, &t_inicial) * 1000;
}

/*
 * Comprueba los metodos de ordenacion
 */
void TestOrdenacion::comprobarMetodosOrdenacion()
{
	int talla;
	cout<<endl<<endl<<"Introduce la talla: ";
	cin>>talla;
	system("cls");
	for (int metodo = 0; metodo < nombreAlgoritmo.size(); metodo++)
	{
		ConjuntoInt *v= new ConjuntoInt(talla);
		v->GeneraVector(talla);
		cout <<endl<<endl<< "vector inicial para el metodo "<<nombreAlgoritmo[metodo]<< ":"<<endl<<endl;
		v->escribe();
		double secs=ordenarArrayDeInt(v->getDatos(),talla,metodo);
		cout<<endl<<endl<<"Array ordenado con metodo "<<nombreAlgoritmo[metodo]<< ":"<<endl<<endl;
		v->escribe();
		cout<<endl;
		v->vaciar();
		system("pause");
		system("cls");
	}
	system("cls");
}

/*
 * Calcula el caso medio de un metodo de ordenacion.
 * Permite las opciones de crear el fichero de datos y la gráfica correspondiente.
 * param metodo: metodo de ordenacion a estudiar.
 */
void TestOrdenacion::casoMedio(int metodo)
{
		ofstream f(nombreAlgoritmo[metodo]+".dat");
		system("cls");
		cout<<endl<<"Ordenacion por " << nombreAlgoritmo[metodo]<<endl;
		cout<<"Tiempos de ejecucion "<<endl<<endl;
		cout<<"\tTalla\t\tTiempo (oe)"<<endl<<endl;

		double tiempo=0;
        double secs=0;

        ConjuntoInt *v;

        Graficas g;

		for (int talla = tallaIni; talla <= tallaFin; talla += incTalla)
		{

			switch (metodo){
			case BURBUJA: /*Caso peor */
				{
				    for(int r=0;r<NUMREPETICIONES;r++){

                        v = new ConjuntoInt(talla);
                        v->GeneraVector(talla);
                        double secs=ordenarArrayDeInt(v->getDatos(),talla,metodo);
                        tiempo=tiempo+secs;
                        delete v;
                    }
                    tiempo=tiempo/NUMREPETICIONES;
				}
				break;
			case INSERCION:/*Caso medio*/
				{

				}
				break;
			case SELECCION:/*Caso mejor (T(n)= 9)*/
				{

				}
				break;
			}
			f<<talla<<"\t"<< tiempo<<endl;
			cout<<"\t"<<talla<<"\t\t"<<setw(10)<<setprecision(2)<<(double)tiempo<<" \t\t"<<endl;
		}
		f.close();
		cout <<endl<<"Datos guardados en el fichero "<<nombreAlgoritmo[metodo]<<".dat "<<endl;

		/* Generar grafica */
		char opc;
		cout<<endl<<"Generar grafica de resultados? (s/n): ";
		cin>>opc;
		switch (opc){
		case 's':
		case 'S':{
			switch (metodo){
			case BURBUJA:{
				/* Ejecutar el fichero por lotes (comandos)*/
				//llamar a Graficas::generarGraficaMEDIO
				g.generarGraficaMEDIO(nombreAlgoritmo[metodo],CUADRADO); //cuadrado porq burbuja es de orden cuadratico
				system("Burbuja.gpl");
				system("cls");
				cout <<endl<<"Grafica guardada en el fichero "<<nombreAlgoritmo[metodo]<<+".pdf"<<endl;
                }break;
			case INSERCION:{
				/* Ejecutar el fichero por lotes (comandos)*/
				g.generarGraficaMEDIO(nombreAlgoritmo[metodo],);
				system("Insercion.gpl");
				system("cls");
				cout <<endl<<"Grafica guardada en el fichero "<<nombreAlgoritmo[metodo]<<+".pdf"<<endl;
			}break;
			case SELECCION:{
				/* Ejecutar el fichero por lotes (comandos)*/
				g.generarGraficaMEDIO(nombreAlgoritmo[metodo],);
				system("Insercion.gpl");
				system("cls");
				cout <<endl<<"Grafica guardada en el fichero "<<nombreAlgoritmo[metodo]<<+".pdf"<<endl;
			}break;
			default: {cout <<"Error caso "<<endl;}break;
			}
		default:{cout <<"Grafica no guardada en fichero "<<endl;
        }break;
        }
    }
		cout<<endl;
		system("pause");
		system("cls");
}
/*
 * Compara dos metodos de ordenacion.
 * Genera el fichero de datos y permite las opcion de crear la gráfica correspondiente.
 * param metodo1: Primer metodo de ordenacion a comparar
 * param metodo2: Segundo metodo de ordenacion a comparar
 */
void TestOrdenacion::comparar(int metodo1, int metodo2) {
	 //** ESCRIBIR PARA COMPLETAR LA PRACTICA **//
}
