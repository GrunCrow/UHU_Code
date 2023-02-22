#ifndef MULTICONJUNTO_H
#define MULTICONJUNTO_H

//template <typename T>
template <typename T>
class Multiconjunto{
        public:
        Multiconjunto ();               // Constructor
        bool esVacio() const;           // Comprueba si el multiconjunto es o no vacío
        int cardinalidad() const;       // Devuelve el número de elementos
        void anade(const T& objeto);    // Añade un objeto de tipo T al multiconjunto
                                        // Se permiten elementos repetidos
        void elimina(const T& objeto);  // Elimina todas las ocurrencias del objeto pasado como parámetro
        bool pertenece(const T& objeto) const;  // Comprueba si el objeto pasado como parámetro
                                                // existe en el multiconjunto
        private:
            T c[100];                       // Vector de almacenamiento de elementos
            int num;                        // Indica el número de elementos en el multiconjunto

};

#endif // MULTICONJUNTO_H



