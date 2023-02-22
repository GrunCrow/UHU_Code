/*
 * La clase TestBusqueda contiene los metodos para:
 * 1. Comprobar que los métodos de búsqueda de la clase AlgoritmosBusqueda funcionan adecuadamente.
 * 2. Calcular la eficiencia para el caso medio de un método de búsqueda,
 *    permitiendo guardar los datos e imprimir la gráfica correspondiente con ajuste al Orden de complejidad.
 * 3. Comparar el coste temporal de dos métodos de búsqueda
 *    permitiendo guardar los datos e imprimir la gráfica correspondiente.
 * 4. Comparar todos los algoritmos de búsqueda implementados.
 */
#include "TestBusqueda.h"
#include "Constantes.h"
#include "AlgoritmosBusqueda.h"
#include "TestBusqueda.h"
#include "TestOrdenacion.h"
#include "ConjuntoInt.h"
#include "Graficas.h"
#include "Mtime.h"
#include <string>
#include <fstream>
#include <iomanip>
#include <iostream>
#include <conio.h>


//** ESCRIBIR PARA COMPLETAR LA PRACTICA **//
TestBusqueda::TestBusqueda()
{
    nombreAlgoritmo.push_back("SecuencialIt");
    nombreAlgoritmo.push_back("BinariaIt");
    nombreAlgoritmo.push_back("InterpolacionIt");
}
TestBusqueda::~TestBusqueda()
{
}

double TestBusqueda::buscaEnArrayDeInt(int v[],int size, int key, int metodo, int &pos){
    AlgoritmosBusqueda estrategia;
	Mtime t;
	LARGE_INTEGER t_inicial, t_final;
	QueryPerformanceCounter(&t_inicial);
	/* Invoca al método de busqueda elegido */
	switch (metodo){
		case SECUENCIALIT: pos=estrategia.busquedaSecuencialIt(v, size, key);
			break;
		case BINARIAIT: pos=estrategia.busquedaBinariaIt(v, size, key);
			break;
		case INTERPOLACIONIT: pos=estrategia.busquedaInterpolacionIt(v, size, key);
			break;
	}
	QueryPerformanceCounter(&t_final);
	return t.performancecounter_diff(&t_final, &t_inicial) * 1000;
}

/*
 * Comprueba los metodos de ordenacion
 */
void TestBusqueda::comprobarMetodosBusqueda()
{
	int talla, key, pos;
	double secs=0;
	TestOrdenacion Ordenar;
	cout<<endl<<endl<<"Introduce la talla: ";
	cin>>talla;
	system("cls");
	for (int metodo = 0; metodo < nombreAlgoritmo.size(); metodo++)
	{
		ConjuntoInt *v= new ConjuntoInt(talla);
		v->GeneraVector(talla);
		cout <<endl<<endl<< "vector para el metodo "<<nombreAlgoritmo[metodo]<< ":"<<endl<<endl;
		secs=Ordenar.ordenarArrayDeInt(v->getDatos(),talla,INSERCION);
		v->escribe();
		cout<<endl<<endl<<"Introduce la clave a buscar: ";
        cin>>key;
		secs=buscaEnArrayDeInt(v->getDatos(),talla,key,metodo, pos);
		cout<<endl<<endl<<"-> posicion de "<<key<< " buscado con el metodo "<<nombreAlgoritmo[metodo]<<": "<<pos<<endl<<endl;
		cout<<endl;
		v->vaciar();
		system("pause");
		system("cls");
	}
	system("cls");
}


void TestBusqueda::casoMedio(int metodo){
		ofstream f(nombreAlgoritmo[metodo]+".dat");
		system("cls");
		cout<<endl<<"*** Busqueda por " << nombreAlgoritmo[metodo]+" ***"<<endl<<endl;
		cout<<"Tiempos de ejecucion promedio"<<endl<<endl;
		cout<<"\tTalla\t\tTiempo (mseg)"<<endl<<endl;

		double tiempo=0;
        double secs=0;
        int talla, key, pos;
        TestOrdenacion Ordenar;

        ConjuntoInt *v;

        Graficas g;

		for (talla = tallaIni; talla <= tallaFin; talla += incTalla)
		{
            for(int r=0;r<NUMREPETICIONES;r++){ //genera vector aleatorio por cada ejecucion

                v = new ConjuntoInt(talla);
                v->GeneraVector(talla);
                secs=Ordenar.ordenarArrayDeInt(v->getDatos(),talla,INSERCION);
                key=v->generaKey();
                secs=buscaEnArrayDeInt(v->getDatos(),talla,key,metodo,pos);
                tiempo=tiempo+secs;
                delete v;
            }
            tiempo=tiempo/NUMREPETICIONES;

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
			case SECUENCIALIT:{
				/* Ejecutar el fichero por lotes (comandos)*/
				//llamar a Graficas::generarGraficaMEDIO
				g.generarGraficaMEDIO(nombreAlgoritmo[metodo],N); //cuadrado porq burbuja es de orden cuadratico
				system("SecuencialIt.gpl");
				system("cls");
				cout <<endl<<"Grafica guardada en el fichero "<<nombreAlgoritmo[metodo]<<+".pdf"<<endl;
                }break;
			case BINARIAIT:{
				/* Ejecutar el fichero por lotes (comandos)*/
				//g.generarGraficaMEDIO(nombreAlgoritmo[metodo],);
				g.generarGraficaMEDIO(nombreAlgoritmo[metodo],NlogN);
				system("BinariaIt.gpl");
				system("cls");
				cout <<endl<<"Grafica guardada en el fichero "<<nombreAlgoritmo[metodo]<<+".pdf"<<endl;
			}break;
			case INTERPOLACIONIT:{
				/* Ejecutar el fichero por lotes (comandos)*/
				//g.generarGraficaMEDIO(nombreAlgoritmo[metodo],);
				g.generarGraficaMEDIO(nombreAlgoritmo[metodo],loglogN);
				system("InterpolacionIt.gpl");
				system("cls");
				cout <<endl<<"Grafica guardada en el fichero "<<nombreAlgoritmo[metodo]<<+".pdf"<<endl;
			}break;
			default: {cout <<"Error caso "<<endl;}break;
			}
		}break;
		default:{cout <<"Grafica no guardada en fichero "<<endl;
        }break;
        } //fin switch
		cout<<endl;
		system("pause");
		system("cls");
}

void TestBusqueda::comparardos(int metodo1, int metodo2){
    TestOrdenacion Ordenar;
	ofstream f1(nombreAlgoritmo[metodo1]+".dat");
    ofstream f2(nombreAlgoritmo[metodo2]+".dat");

	system("cls");
	cout<<endl<<"Comparacion" <<metodo1<<" y "<<metodo2;
	cout<<". Tiempos de ejecucion "<<endl<<endl;
	cout<<endl;;
	cout<<"\tTalla\t\tTiempo (mseg)"<<endl<<endl;
	cout<<"\t       \t\t"<<nombreAlgoritmo[metodo1]<<"\t\t"<<nombreAlgoritmo[metodo2]<<endl<<endl;
	double tiempoMedio1=0, tiempoMedio2=0;

    Mtime t;
    double secs1,secs2;
    LARGE_INTEGER t_ini, t_fin;
    ConjuntoInt *v;
    int pos,key;

    Graficas g;

	for (int talla = tallaIni; talla <= tallaFin; talla += incTalla){

        v = new ConjuntoInt(talla);

        for(int r=0;r<NUMREPETICIONES;r++){

            v->GeneraVector(talla);
            secs1=Ordenar.ordenarArrayDeInt(v->getDatos(),talla,INSERCION);

            key=v->generaKey();

            secs1=buscaEnArrayDeInt(v->getDatos(),talla,key,metodo1,pos);
            secs2=buscaEnArrayDeInt(v->getDatos(),talla,key,metodo2,pos);


            tiempoMedio1=tiempoMedio1+secs1;
            tiempoMedio2=tiempoMedio2+secs2;
        }
        tiempoMedio1=tiempoMedio1/NUMREPETICIONES;
        tiempoMedio2=tiempoMedio2/NUMREPETICIONES;

		/*escribir en el fichero*/
		f1<<talla<<"\t"<< tiempoMedio1<<endl;
		f2<<talla<<"\t"<< tiempoMedio2<<endl;
		/*Visualizar en pantalla*/
		cout<<"\t"<<talla<<"\t\t"<<setw(10)<<setprecision(2)<<(double)tiempoMedio1<<" \t"<<setw(10)<<setprecision(2)<<(double)tiempoMedio2<<" \t\t" <<endl;
		cout<<endl;

		v->vaciar();

        delete v;
	}
	f1.close();
	f2.close();
	cout<<endl<<"Datos guardados en los ficheros "<<nombreAlgoritmo[metodo1]+".dat y "<<nombreAlgoritmo[metodo2]+".dat "<<endl;
	/* Generar grafica */
		char opc;
		cout<<endl<<"Generar grafica de resultados? (s/n): ";
		cin>>opc;
		switch (opc){
		case 's':
		case 'S':{
			g.generarGraficaCMP(nombreAlgoritmo[metodo1],nombreAlgoritmo[metodo2]);
			system("CmdCompararBusqueda.gpl");
			system("cls");
			//system((gpl).c_str());
			cout <<endl<<"Grafica guardada en el fichero "<<nombreAlgoritmo[metodo1]+nombreAlgoritmo[metodo2]+".pdf"<<endl;
            }break;
		default: {cout <<"Grafica no guardada en fichero "<<endl;
        }break;
		}
		cout<<endl;
		system("pause");
		system("cls");
}

void TestBusqueda::comparartres(int metodo1, int metodo2, int metodo3){
    TestOrdenacion Ordenar;
	ofstream f1(nombreAlgoritmo[metodo1]+".dat");
    ofstream f2(nombreAlgoritmo[metodo2]+".dat");
    ofstream f3(nombreAlgoritmo[metodo3]+".dat");

	system("cls");
	cout<<endl<<"Comparacion" <<metodo1<<", "<<metodo2<<" y "<<metodo3;
	cout<<". Tiempos de ejecucion "<<endl<<endl;
	cout<<endl;;
	cout<<"\tTalla\t\tTiempo (mseg)"<<endl<<endl;
	cout<<"\t       \t\t"<<nombreAlgoritmo[metodo1]<<"\t\t"<<nombreAlgoritmo[metodo2]<<"\t\t"<<nombreAlgoritmo[metodo3]<<endl<<endl;
	double tiempoMedio1=0, tiempoMedio2=0, tiempoMedio3=0;

    Mtime t;
    double secs1,secs2,secs3;
    LARGE_INTEGER t_ini, t_fin;
    ConjuntoInt *v;
    int pos,key;

    Graficas g;

	for (int talla = tallaIni; talla <= tallaFin; talla += incTalla){

        v = new ConjuntoInt(talla);

        for(int r=0;r<NUMREPETICIONES;r++){

            v->GeneraVector(talla);
            secs1=Ordenar.ordenarArrayDeInt(v->getDatos(),talla,INSERCION);

            key=v->generaKey();

            secs1=buscaEnArrayDeInt(v->getDatos(),talla,key,metodo1,pos);
            secs2=buscaEnArrayDeInt(v->getDatos(),talla,key,metodo2,pos);
            secs3=buscaEnArrayDeInt(v->getDatos(),talla,key,metodo2,pos);


            tiempoMedio1=tiempoMedio1+secs1;
            tiempoMedio2=tiempoMedio2+secs2;
            tiempoMedio3=tiempoMedio3+secs3;
        }
        tiempoMedio1=tiempoMedio1/NUMREPETICIONES;
        tiempoMedio2=tiempoMedio2/NUMREPETICIONES;
        tiempoMedio3=tiempoMedio3/NUMREPETICIONES;

		/*escribir en el fichero*/
		f1<<talla<<"\t"<< tiempoMedio1<<endl;
		f2<<talla<<"\t"<< tiempoMedio2<<endl;
		f3<<talla<<"\t"<< tiempoMedio3<<endl;
		/*Visualizar en pantalla*/
		cout<<"\t"<<talla<<"\t\t"<<setw(10)<<setprecision(2)<<(double)tiempoMedio1<<" \t"<<setw(10)<<setprecision(2)<<(double)tiempoMedio2<<" \t\t"<<setw(10)<<setprecision(2)<<(double) tiempoMedio3<<"\t\t"<<endl;
		cout<<endl;

		v->vaciar();

        delete v;
	}
	f1.close();
	f2.close();
	f3.close();
	cout<<endl<<"Datos guardados en los ficheros "<<nombreAlgoritmo[metodo1]+".dat, "<<nombreAlgoritmo[metodo2]+".dat y "<<nombreAlgoritmo[metodo3]+".dat "<<endl;
	/* Generar grafica */
		char opc;
		cout<<endl<<"Generar grafica de resultados? (s/n): ";
		cin>>opc;
		switch (opc){
		case 's':
		case 'S':{
			g.generarGraficaCMPtres(nombreAlgoritmo[metodo1],nombreAlgoritmo[metodo2],nombreAlgoritmo[metodo3]);
			system("CmdCompararBusquedas.gpl");
			system("cls");
			//system((gpl).c_str());
			cout<<endl<<"Grafica guardada en el fichero "<<nombreAlgoritmo[metodo1]+nombreAlgoritmo[metodo2]+nombreAlgoritmo[metodo3]+".pdf"<<endl;
            }break;
		default: {cout <<"Grafica no guardada en fichero "<<endl;
        }break;
		}
		cout<<endl;
		system("pause");
		system("cls");
}
