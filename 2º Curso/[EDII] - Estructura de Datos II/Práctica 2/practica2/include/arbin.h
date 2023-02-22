#ifndef _ARBIN_H_
#define _ARBIN_H_

#include "nodoB.h"
#include "excep_arbin.h"

template <typename T>
class Arbin {
	typedef NodoB<T>* PtrNodoB;
	public:
        class Iterador {      // clase iterador anidada dentro de la clase arbin
           friend class Arbin<T>;
           public:
                 const T& observar() const throw(PosicionArbolExcepcion)
                 {
                     if (pnodo == NULL) throw PosicionArbolExcepcion();
                     return pnodo->getObj();
                 }
                 bool arbolVacio() const
                 {
                     return pnodo == NULL;
                 }
                 bool operator!=(const Iterador& i) const
                 {
					 return (pnodo != i.pnodo);
			     }
                 bool operator==(const Iterador& i) const
                 {
					 return (pnodo == i.pnodo);
			     }
     			 int altura() const;
            private:
                 PtrNodoB pnodo;
                 Iterador(PtrNodoB p) { pnodo = p; }
        };

			Arbin();
			Arbin(const T& objeto, const Arbin& ai, const Arbin& ad);
			Arbin(const Arbin& a);
			Arbin& operator=(const Arbin& a);
			Iterador getRaiz() const;
			Iterador subIzq(const Iterador& r) const throw(PosicionArbolExcepcion);
			Iterador subDer(const Iterador& r) const throw(PosicionArbolExcepcion);
            bool esVacio() const;
			int altura() const;
			~Arbin();
	protected:
			PtrNodoB  raiz;
			PtrNodoB copia(PtrNodoB p);
			void elimina(PtrNodoB p);
};

#endif







