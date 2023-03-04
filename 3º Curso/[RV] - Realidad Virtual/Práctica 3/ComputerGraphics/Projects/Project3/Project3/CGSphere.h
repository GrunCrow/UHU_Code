#pragma once

#include <GL/glew.h>
#include "CGFigure.h"

//
// CLASE: CGSphere
//
// DESCRIPCIÓN: Representa una esfera de radio 'r', dividida en 'p' 
//              capas (paralelos) y 'm' líneas (meridianos).
//
class CGSphere : public CGFigure {
public:
	CGSphere(GLint p, GLint m, GLfloat r);
};