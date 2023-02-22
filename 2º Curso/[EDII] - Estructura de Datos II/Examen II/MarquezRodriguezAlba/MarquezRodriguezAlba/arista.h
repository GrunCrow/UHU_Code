#ifndef _ARISTA_H_
#define _ARISTA_H_

#include "vertice.h"

template <typename T, typename U>
class Arista {
	public:
		   Arista(const T& vo, const T& vd); 
	       Arista(const T& vo, const T& vd, const U& etiq); 
           Arista(const Arista<T, U>& a);
           const T& getOrigen() const;
           const T& getDestino() const;
           const U& getEtiqueta() const;
           void setOrigen(const T& orig);
           void setDestino(const T& dest);
           void setEtiqueta(const U& etiq);
           bool operator==(const Arista<T, U>& a) const;
           bool operator!=(const Arista<T, U>& a) const;
	private:
			T origen;
            T destino;
            U etiqueta;
};

#endif
