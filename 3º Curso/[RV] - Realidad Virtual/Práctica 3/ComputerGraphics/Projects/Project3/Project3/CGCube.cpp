#include "CGCube.h"
#include <GL/glew.h>
#include "CGFigure.h"

CGCube::CGCube(GLfloat s)
{
	numFaces = 12;     // Number of faces
	numVertices = 24;  // Number of vertices

	GLfloat p_vertices[24][3] = {
		{ +s, +s, +s }, // A0 // Positive X
		{ +s, -s, +s }, // D0  
		{ +s, -s, -s }, // D1  
		{ +s, +s, -s }, // A1  

		{ -s, +s, +s }, // B0 // Positive Y
		{ +s, +s, +s }, // A0 
		{ +s, +s, -s }, // A1 
		{ -s, +s, -s }, // B1 

		{ -s, -s, +s }, // C0 // Negative X
		{ -s, +s, +s }, // B0 
		{ -s, +s, -s }, // B1 
		{ -s, -s, -s }, // C1

		{ +s, -s, +s }, // D0 // Negative Y
		{ -s, -s, +s }, // C0 
		{ -s, -s, -s }, // C1
		{ +s, -s, -s }, // D1  

		{ +s, +s, +s }, // A0 // Positive Z
		{ -s, +s, +s }, // B0 
		{ -s, -s, +s }, // C0 
		{ +s, -s, +s }, // D0  

		{ +s, +s, -s }, // A1 // Negative Z
		{ +s, -s, -s }, // D1  
		{ -s, -s, -s }, // C1 
		{ -s, +s, -s }  // B1 
	};

	GLushort p_indexes[12][3] = {  // Array of indexes
		{ 0, 1, 2 },
		{ 0, 2, 3 },
		{ 4, 5, 6 },
		{ 4, 6, 7 },
		{ 8, 9, 10 },
		{ 8, 10, 11 },
		{ 12, 13, 14 },
		{ 12, 14, 15 },
		{ 16, 17, 18 },
		{ 16, 18, 19 },
		{ 20, 21, 22 },
		{ 20, 22, 23 }
	};

	vertices = new GLfloat[numVertices * 3];
	for (int i = 0; i < numVertices; i++) for (int j = 0; j < 3; j++) vertices[3 * i + j] = p_vertices[i][j];
	indexes = new GLushort[numFaces * 3];
	for (int i = 0; i < numFaces; i++) for (int j = 0; j < 3; j++) indexes[3 * i + j] = p_indexes[i][j];

	InitBuffers();
}
