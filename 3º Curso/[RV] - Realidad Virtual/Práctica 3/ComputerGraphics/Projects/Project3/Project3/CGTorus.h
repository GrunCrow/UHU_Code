#pragma once

#include <GL/glew.h>
#include "CGFigure.h"

//
// CLASE: CGTorus
//
// DESCRIPCIÓN: Representa un toro con radio interior 'r0', radio exterior 'r1', 
//              dividido en 'p' capas y 'm' sectores.
//
class CGTorus : public CGFigure {
public:
	CGTorus(GLint p, GLint m, GLfloat r0, GLfloat r1);
};

