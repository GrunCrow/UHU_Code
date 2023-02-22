/*
 * La clase TestOrdenacion contiene los metodos para:
 * 1. Comprobar que los métodos de ordenacion de la clase Ordenacion funcionan adecuadamente.
 * 2. Calcular la eficiencia para el caso medio de un método de ordenación,
 *    permitiendo guardar los datos e imprimir la gráfica correspondiente
 * 3. Comparar el coste temporal de dos de los métodos de ordenación
 *    Burbuja, Inserción, y Selección, permitiendo guardar los datos e imprimir la
 *    gráfica correspondiente.
 */
#ifndef _TEST_ORDENACION
#define _TEST_ORDENACION

#include <vector>
#include <string>
#include <iostream>
using namespace std;

class TestOrdenacion {
	vector<string> nombreAlgoritmo;
public:
	TestOrdenacion();
	~TestOrdenacion();
  /*
   * Ordena un array de enteros según el método indicado
   * param v: el array de enteros a ordenar
   * param size: tamaño del array de enteros a ordenar
   * param metodo: Metodo de ordenacion a utilizar
   * return Tiempo empleado en la ordenación (en milisegundos)
   */
	static double ordenarArrayDeInt(int v[],int size,int metodo);
  /*
   * Comprueba que los metodos de ordenación funcionan correctamente
   */
	void comprobarMetodosOrdenacion();

  /*
   * Compara dos metodos de ordenacion.
   * Permite las opciones de crear el fichero de datos y la gráfica correspondiente.
   * param metodo1: Primer metodo de ordenacion a comparar
   * param metodo2: Segundo metodo de ordenacion a comparar
   */
	void comparar(int metodo1, int metodo2);

	void comparar2(int metodo1, int metodo2);

  /*
   * Calcula el caso medio de un metodo de ordenacion.
   * Permite las opciones de crear el fichero de datos y la gráfica correspondiente.
   * param metodo: metodo de ordenacion a estudiar.
   */
	void casoMedio(int metodo);

};
#endif
