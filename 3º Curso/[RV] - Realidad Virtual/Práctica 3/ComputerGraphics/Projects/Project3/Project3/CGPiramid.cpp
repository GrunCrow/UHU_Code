#include "CGPiramid.h"
#include <GL/glew.h>
#include <math.h>
#include "CGFigure.h"


CGPiramid::CGPiramid(GLfloat s)
{
	numFaces = 6;     // Number of faces
	numVertices = 16;  // Number of vertices

	GLfloat p_vertices[16][3] = {
		{ 0.0f, 0.0f, s }, // E // Positive X
		{ s, -s, -s },     // B  
		{ s, s, -s },      // A

		{ 0.0f, 0.0f, s }, // E // Positive Y
		{ s, s, -s },      // A
		{ -s, s, -s },     // D

		{ 0.0f, 0.0f, s }, // E // Negative X
		{ -s, s, -s },     // D
		{ -s, -s, -s },    // C

		{ 0.0f, 0.0f, s }, // E // Negative Y
		{ -s, -s, -s },    // C
		{ s, -s, -s },     // B  

		{ s, s, -s },      // A // Negative Z
		{ s, -s, -s },     // B  
		{ -s, -s, -s },    // C
		{ -s, s, -s },     // D
	};

	GLushort p_indexes[6][3] = {  // Array of indexes
		{ 0, 1, 2 },
		{ 3, 4, 5 },
		{ 6, 7, 8 },
		{ 9, 10, 11 },
		{ 12, 13, 14 },
		{ 12, 14, 15 }
	};

	vertices = new GLfloat[numVertices * 3];
	for (int i = 0; i < numVertices; i++) for (int j = 0; j < 3; j++) vertices[3 * i + j] = p_vertices[i][j];
	indexes = new GLushort[numFaces * 3];
	for (int i = 0; i < numFaces; i++) for (int j = 0; j < 3; j++) indexes[3 * i + j] = p_indexes[i][j];

	InitBuffers();
}
