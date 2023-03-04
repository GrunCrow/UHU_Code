#pragma once

#include <GL/glew.h>
#include "CGFigure.h"

//
// CLASE: CGPiramid
//
// DESCRIPCIÓN: Representa una pirámide de base cuadrada de 
//              lado 2·s y altura 2·s.
// 
class CGPiramid : public CGFigure {
public:
	CGPiramid(GLfloat s);
};
