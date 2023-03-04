#pragma once

#include <GL/glew.h>
#include "CGFigure.h"

//
// CLASE: CGIcosahedron
//
// DESCRIPCIÓN: Representa un icosaedro con arista 'r'. 
//
class CGIcosahedron : public CGFigure {
public:
	CGIcosahedron(GLfloat r);
};
