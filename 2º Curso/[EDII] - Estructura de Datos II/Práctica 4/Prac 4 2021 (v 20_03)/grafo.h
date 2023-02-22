#ifndef _GRAFO_H_
#define _GRAFO_H_

#include "vertice.h"
#include "arista.h"
#include "conjunto.h"
#include "excep_grafo.h"
#include <map>

using namespace std;

template <typename T, typename U>
class Grafo {
    public:
        typedef Conjunto<Vertice<T> > ConjVertices;  
        typedef Conjunto<Arista<T, U> > ConjAristas;  
		Grafo(int n = 100);
		int numVertices() const;
        bool esVacio() const;
        bool estaVertice(const T& v) const;
        bool estaArista(const T& v1, const T& v2) const;
        const ConjVertices& vertices() const;
        const ConjAristas& aristas() const;
        const ConjVertices& adyacentes(const T& v) const;
        const ConjVertices& antecesores(const T& v) const;
        void insertarVertice(const T& v) throw (GrafoLlenoExcepcion);
        void insertarArista(const T& v1, const T& v2, const U& e = U()) throw (NoExisteVerticeExcepcion);
        void eliminarVertice(const T& v);
        void eliminarArista(const T& v1, const T& v2);
		~Grafo();
	private:
	    Arista<T, U>*** M;
	    int sigVer;
	    int capacidad;
        typedef map<T, int> DiccionarioVertices;
	    DiccionarioVertices dVertices;
};

#endif
