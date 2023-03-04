#pragma once

#include <GL/glew.h>
#include <glm/glm.hpp>

//
// CLASE: CGShaderProgram
//
// DESCRIPCIÓN: Clase que desarrolla un programa GLSL
// 
class CGShaderProgram {
private:
	GLuint program;
	GLuint vertexShader;
	GLuint fragmentShader;
	GLboolean linked;
	char* logInfo;

	char** GetShaderCodeFromResource(int idr);

public:
	CGShaderProgram();
	~CGShaderProgram();
	GLboolean IsLinked();
	char* GetLog();
	GLvoid Use();
	GLvoid SetUniformF(const char* name, GLfloat f);
	GLvoid SetUniformVec4(const char* name, glm::vec4 m);
	GLvoid SetUniformVec3(const char* name, glm::vec3 m);
	GLvoid SetUniformMatrix4(const char* name, glm::mat4 m);
	GLvoid SetUniformI(const char* name, GLint i);
};

