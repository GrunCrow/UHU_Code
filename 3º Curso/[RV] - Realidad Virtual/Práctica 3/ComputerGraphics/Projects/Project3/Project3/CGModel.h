#pragma once

#include <GL/glew.h>
#include "CGShaderProgram.h"
#include "CGFigure.h"

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
	CGShaderProgram* program;
	CGFigure* fig0;
	CGFigure* fig1;
	CGFigure* fig2;
	CGFigure* fig3;
	CGFigure* fig4;
	CGFigure* fig5;
	CGFigure* fig6;
	CGFigure* fig7;

	GLfloat xAngle;
	GLfloat yAngle;
	int figure;

	glm::mat4 projection;
};

