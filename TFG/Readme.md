# TFG: Clasificación de imágenes de fototrampeo con una red neuronal convolucional

## Abstract

El estudio de la biodiversidad conlleva la observación directa en el campo o análisis de imágenes, suponiendo una carga en tiempo y esfuerzo para especialistas. En este contexto, este Trabajo Fin de Grado aborda el diseño y aplicación de un modelo de clasificación diseñado para imágenes de fototrampeo.

Para su desarrollo, se ha utilizado un conjunto de 8000 imágenes de fototrampeo clasificadas según la especie que contiene: caballo, ciervo, gamo, humano, jabalí, vaca, vacía y zorro. Como modelos de clasificación, se han utilizado dos redes neuronales convolucionales con dos niveles de profundidad, "MobileNetV2" (3.088.680 parámetros) y otra red llamada "Arquitectura de Crohn" (599.168 parámetros). El entrenamiento, validación y evaluación de estas redes se llevó a cabo con una distribución del 80%, 10% y 10% del conjunto respectivamente. La tasa de acierto de las redes se situó entorno al 70%. Las distintas pruebas realizadas para analizar los resultados mostraron que la principal causa de este bajo rendimiento se situaba en la dificultad inherente que presenta la extracción de conocimiento en las imágenes tratadas, unido al número reducido de imágenes disponibles. Esta conclusión se alcanzó tras aplicar las redes a una nueva base de datos de 21000 imágenes y 15 clases diferentes donde los elementos de interés se muestran en primer plano y en un entorno más acotado. La tasa de acierto de las redes sobre esta base de datos de referencia fue superior al 95%.

En resumen, este estudio subraya la importancia de contar con un conjunto de datos de alta calidad, ya que esto tiene un impacto directo y significativo en el rendimiento de las redes neuronales. Los resultados que se pueden lograr con una red están intrínsecamente vinculados a la calidad del conjunto de datos y las anotaciones disponibles.

## Repositorio

Para acceder al contenido del código con el que se realizaron las experimentaciones del TFG antes descrito puedes acceder al repositorio [Camera Trap CNN Model](https://github.com/GrunCrow/Camera-Trap-CNN-Model)

