#include <GL/glew.h>
#include <SDKDDKVer.h>
#include <Windows.h>
#include "CGShaderProgram.h"
#include "resource.h"

//
// FUNCIÓN: CGShaderProgram::CGShaderProgram()
//
// PROPÓSITO: Crea un programa gráfico cargando y compilando los shaders que lo forman
//
CGShaderProgram::CGShaderProgram()
{
	GLint status;
	logInfo = NULL;

	// Crea y compila el vertex shader
	vertexShader = glCreateShader(GL_VERTEX_SHADER);
	glShaderSource(vertexShader, 1, GetShaderCodeFromResource(IDR_HTML1), NULL);
	glCompileShader(vertexShader);
	glGetShaderiv(vertexShader, GL_COMPILE_STATUS, &status);
	if (status == GL_FALSE)
	{
		linked = GL_FALSE;
		GLint logLength;
		glGetShaderiv(vertexShader, GL_INFO_LOG_LENGTH, &logLength);
		logInfo = (char*)malloc(sizeof(char) * logLength);
		GLsizei written;
		glGetShaderInfoLog(vertexShader, logLength, &written, logInfo);
		return;
	}

	// Crea y compila el fragment shader
	fragmentShader = glCreateShader(GL_FRAGMENT_SHADER);
	glShaderSource(fragmentShader, 1, GetShaderCodeFromResource(IDR_HTML2), NULL);
	glCompileShader(fragmentShader);
	glGetShaderiv(fragmentShader, GL_COMPILE_STATUS, &status);
	if (status == GL_FALSE)
	{
		linked = GL_FALSE;
		GLint logLength;
		glGetShaderiv(fragmentShader, GL_INFO_LOG_LENGTH, &logLength);
		logInfo = (char*)malloc(sizeof(char) * logLength);
		GLsizei written;
		glGetShaderInfoLog(fragmentShader, logLength, &written, logInfo);
		return;
	}

	//Crea y enlaza el programa
	program = glCreateProgram();
	glAttachShader(program, vertexShader);
	glAttachShader(program, fragmentShader);
	glLinkProgram(program);
	glGetProgramiv(program, GL_LINK_STATUS, &status);
	if (status == GL_FALSE)
	{
		linked = GL_FALSE;
		GLint logLength;
		glGetProgramiv(program, GL_INFO_LOG_LENGTH, &logLength);
		logInfo = (char*)malloc(sizeof(char) * logLength);
		GLsizei written;
		glGetProgramInfoLog(program, logLength, &written, logInfo);
		return;
	}

	linked = GL_TRUE;
}

//
// FUNCIÓN: CGShaderProgram::GetShaderCodeFromResource(int idr)
//
// PROPÓSITO: Obtiene el contenido de un fichero de texto almacenado como un recurso
//
char** CGShaderProgram::GetShaderCodeFromResource(int idr)
{
	HRSRC shaderHandle = FindResource(NULL, MAKEINTRESOURCE(idr), RT_HTML);
	HGLOBAL shaderGlobal = LoadResource(NULL, shaderHandle);
	LPCTSTR shaderPtr = static_cast<LPCTSTR>(LockResource(shaderGlobal));
	DWORD shaderSize = SizeofResource(NULL, shaderHandle);
	char* shaderCodeLine = (char*)malloc((shaderSize + 1) * sizeof(char));
	memcpy(shaderCodeLine, shaderPtr, shaderSize);
	shaderCodeLine[shaderSize] = '\0';
	char** shaderCode = (char**)malloc(sizeof(char*));
	shaderCode[0] = shaderCodeLine;
	FreeResource(shaderGlobal);
	return shaderCode;
}

//
// FUNCIÓN: CGShaderProgram::~CGShaderProgram()
//
// PROPÓSITO: Destruye el programa gráfico
//
CGShaderProgram::~CGShaderProgram()
{
	glDeleteShader(vertexShader);
	glDeleteShader(fragmentShader);
	glDeleteProgram(program);
}

//
// FUNCIÓN: CGShaderProgram::IsLinked()
//
// PROPÓSITO: Verifica si el programa se ha compilado y linkado de forma correcta
//
GLboolean CGShaderProgram::IsLinked()
{
	return linked;
}

//
// FUNCIÓN: CGShaderProgram::GetLog()
//
// PROPÓSITO: Obtiene el mensaje de error
//
char* CGShaderProgram::GetLog()
{
	return logInfo;
}

//
// FUNCIÓN: CGShaderProgram::Use()
//
// PROPÓSITO: Activa el funcionamiento del programa en la tarjeta gráfica
//
GLvoid CGShaderProgram::Use()
{
	glUseProgram(program);
}

//
// FUNCIÓN: CGShaderProgram::SetUniformF(const char* name, GLfloat f)
//
// PROPÓSITO: Asigna el valor de una variable uniforme de tipo float
//
void CGShaderProgram::SetUniformF(const char* name, GLfloat f)
{
	GLuint location = glGetUniformLocation(program, name);
	if (location >= 0) glUniform1f(location, f);
}

//
// FUNCIÓN: CGShaderProgram::SetUniformMatrix4(const char* name, glm::mat4 m)
//
// PROPÓSITO: Asigna el valor de una variable uniforme de tipo mat4 (matriz 4x4)
//
GLvoid CGShaderProgram::SetUniformMatrix4(const char* name, glm::mat4 m)
{
	GLuint location = glGetUniformLocation(program, name);
	if (location >= 0) glUniformMatrix4fv(location, 1, GL_FALSE, &m[0][0]);
}

//
// FUNCIÓN: CGShaderProgram::SetUniformVec4(const char* name, glm::vec4 v)
//
// PROPÓSITO: Asigna el valor de una variable uniforme de tipo vec4 (vector de 4 float)
//
void CGShaderProgram::SetUniformVec4(const char* name, glm::vec4 v)
{
	GLuint location = glGetUniformLocation(program, name);
	if (location >= 0) glUniform4fv(location, 1, &v[0]);
}

//
// FUNCIÓN: CGShaderProgram::SetUniformVec3(const char* name, glm::vec3 v)
//
// PROPÓSITO: Asigna el valor de una variable uniforme de tipo vec3 (vector de 3 float)
//
void CGShaderProgram::SetUniformVec3(const char* name, glm::vec3 v)
{
	GLuint location = glGetUniformLocation(program, name);
	if (location >= 0) glUniform3fv(location, 1, &v[0]);
}

//
// FUNCIÓN: CGShaderProgram::SetUniformI(const char* name, GLint i)
//
// PROPÓSITO: Asigna el valor de una variable uniforme de tipo entero
//
void CGShaderProgram::SetUniformI(const char* name, GLint i)
{
	GLuint location = glGetUniformLocation(program, name);
	if (location >= 0) glUniform1i(location, i);
}
