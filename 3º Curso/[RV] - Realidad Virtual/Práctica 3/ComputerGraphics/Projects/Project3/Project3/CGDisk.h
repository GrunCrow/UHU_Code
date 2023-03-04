#pragma once

#include <GL/glew.h>
#include "CGFigure.h"

//
// CLASE: CGDisk
//
// DESCRIPCIÓN: Representa un disco de radio interior 'r0' (puede ser cero), 
//              radio exterior 'r1', dividido en 'p' capas y 'm' sectores.
//
class CGDisk : public CGFigure {
public:
	CGDisk(GLint p, GLint m, GLfloat r0, GLfloat r1);
};
