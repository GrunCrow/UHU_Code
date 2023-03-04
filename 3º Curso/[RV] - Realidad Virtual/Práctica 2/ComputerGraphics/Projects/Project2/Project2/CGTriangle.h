#pragma once

#include <GL/glew.h>
#include "CGShaderProgram.h"

//
// CLASE: CGTriangle
//
// DESCRIPCIÓN: Clase que representa un triángulo descrito mediante
//              VAO para su renderizado mediante shaders
// 
class CGTriangle {
private:
	GLuint VBO;
	GLuint VAO;

public:
	CGTriangle();
	~CGTriangle();
	void Draw(CGShaderProgram* program, GLfloat posX, GLfloat posY, GLfloat size);
};

