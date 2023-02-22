#ifndef CONJUNTOINT_H
#define CONJUNTOINT_H
// Clase conjunto de enteros con tamaño máximo limitado.
#define MAXIMO 5  // TAÑAÑO MÁXIMO 5

////////////// Declaración de la clase conjuntoInt //////////////
class conjuntoInt {
  private:
      int tamano;
      int datos[MAXIMO];
  public:
      void vaciar ();
      void insertar (int n);
      bool miembro (int n);
			void ordena (int tam);
      void escribe ();
};

#endif //CONJUNTOINT_H
