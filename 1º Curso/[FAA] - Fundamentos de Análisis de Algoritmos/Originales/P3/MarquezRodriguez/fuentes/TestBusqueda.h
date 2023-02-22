/*
 * La clase TestBusqueda contiene los metodos para:
 * 1. Comprobar que los métodos de búsqueda de la clase AlgoritmosBusqueda funcionan adecuadamente.
 * 2. Calcular la eficiencia para el caso medio de un método de búsqueda,
 *    permitiendo guardar los datos e imprimir la gráfica correspondiente con ajuste al Orden de complejidad.
 * 3. Comparar el coste temporal de dos métodos de búsqueda
 *    permitiendo guardar los datos e imprimir la gráfica correspondiente.
 * 4. Comparar todos los algoritmos de búsqueda implementados.
 */
#ifndef _TEST_BUSQUEDA
#define _TEST_BUSQUEDA

#include <vector>
#include <string>
#include <iostream>
using namespace std;
//** ESCRIBIR PARA COMPLETAR LA PRACTICA **//

class TestBusqueda{
    vector<string> nombreAlgoritmo;
public:
	TestBusqueda();
	~TestBusqueda();
	double buscaEnArrayDeInt(int v[],int size, int key, int metodo, int &pos);
	void comprobarMetodosBusqueda();
	void casoMedio(int metodo);
	void comparardos(int metodo1, int metodo2);
	void comparartres(int metodo1, int metodo2, int metodo3);
};

#endif
