#pragma once

#include <GL/glew.h>
#include "CGShaderProgram.h"
#include "CGTriangle.h"

class CGModel
{
public:
	void initialize(int w, int h);
	void finalize();
	void render();
	void update();
	void key_pressed(int key);
	void mouse_button(int button, int action);
	void mouse_move(double xpos, double ypos);
	void resize(int w, int h);

private:
	GLfloat posX;
	GLfloat posY;
	GLfloat size;
	GLfloat stepX;
	GLfloat stepY;

	CGTriangle* triangle;
	CGShaderProgram* program;
};

