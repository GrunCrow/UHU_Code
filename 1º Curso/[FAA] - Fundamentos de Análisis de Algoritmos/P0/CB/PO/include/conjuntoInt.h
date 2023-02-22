#ifndef CONJUNTOINT_H
#define CONJUNTOINT_H
// Clase conjunto de enteros con tama�o m�ximo limitado.
#define MAXIMO 5  // TA�A�O M�XIMO 5

////////////// Declaraci�n de la clase conjuntoInt //////////////
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
