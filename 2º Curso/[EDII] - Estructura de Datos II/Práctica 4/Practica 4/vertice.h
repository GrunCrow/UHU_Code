#ifndef _VERTICE_H_
#define _VERTICE_H_

template <typename T>
class Vertice {
	public:
			Vertice(const T& objeto); 
            const T& getObj() const;
            void setObj(const T& objeto);
            bool operator==(const Vertice<T>& v) const;
            bool operator!=(const Vertice<T>& v) const;
	private:
			T obj;
};

#endif
