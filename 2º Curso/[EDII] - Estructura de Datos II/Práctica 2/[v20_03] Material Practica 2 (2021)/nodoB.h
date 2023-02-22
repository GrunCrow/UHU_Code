#ifndef _NODOB_H_
#define _NODOB_H_

#include <stdlib.h>

template <typename T>
class NodoB {
	typedef NodoB<T>* PtrNodoB;
    public:
		NodoB(const T& objeto);
		NodoB(const T& objeto, PtrNodoB nizq, PtrNodoB nder);
		NodoB(const NodoB& n);
		const T& getObj() const;
		PtrNodoB getIzq() const;
		PtrNodoB getDer() const;
		void setObj(const T& objeto);
		void setIzq(PtrNodoB nizq);
		void setDer(PtrNodoB nder);
	private:
		T  obj;
		PtrNodoB  izq, der;
};

#endif
