#pragma once

#include <GL/glew.h>
#include "CGFigure.h"

//
// CLASE: CGCylinder
//
// DESCRIPCIÓN: Representa un cilindro de radio 'r', longitud '2·l', 
//              dividido en 'p' capas y 'm' líneas.
//
class CGCylinder : public CGFigure {
public:
	CGCylinder(GLint p, GLint m, GLfloat r, GLfloat l);
};
