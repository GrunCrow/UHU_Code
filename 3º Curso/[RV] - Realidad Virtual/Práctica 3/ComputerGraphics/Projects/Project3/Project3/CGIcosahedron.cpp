#include "CGIcosahedron.h"
#include <GL/glew.h>
#include <math.h>
#include "CGFigure.h"

//
// FUNCIÓN: CGIcosahedron::CGIcosahedron(GLfloat r)
//
// PROPÓSITO: Dibuja un icosaedro de arista '2r'
// 
CGIcosahedron::CGIcosahedron(GLfloat r)
{
	numFaces = 20;         // Number of faces
	numVertices = 60;  // Number of vertices
	vertices = new GLfloat[numVertices * 3];
	indexes = new GLushort[numFaces * 3];

	GLfloat phi = (GLfloat)((1 + sqrt(5.0)) / 2.0);

	GLfloat A0[] = { 0, r * phi, r };
	GLfloat A1[] = { 0, r * phi, -r };
	GLfloat A2[] = { 0, -r * phi, -r };
	GLfloat A3[] = { 0, -r * phi, r };
	GLfloat B0[] = { r * phi, r, 0 };
	GLfloat B1[] = { r * phi, -r, 0 };
	GLfloat B2[] = { -r * phi, -r, 0 };
	GLfloat B3[] = { -r * phi, r, 0 };
	GLfloat C0[] = { r, 0, r * phi };
	GLfloat C1[] = { r, 0, -r * phi };
	GLfloat C2[] = { -r, 0, -r * phi };
	GLfloat C3[] = { -r, 0, r * phi };

	int verticesIndex = 0;

	// face 1
	vertices[verticesIndex] = A0[0]; vertices[verticesIndex + 1] = A0[1]; vertices[verticesIndex + 2] = A0[2]; verticesIndex += 3;
	vertices[verticesIndex] = A1[0]; vertices[verticesIndex + 1] = A1[1]; vertices[verticesIndex + 2] = A1[2]; verticesIndex += 3;
	vertices[verticesIndex] = B3[0]; vertices[verticesIndex + 1] = B3[1]; vertices[verticesIndex + 2] = B3[2]; verticesIndex += 3;

	// face 2
	vertices[verticesIndex] = A0[0]; vertices[verticesIndex + 1] = A0[1]; vertices[verticesIndex + 2] = A0[2]; verticesIndex += 3;
	vertices[verticesIndex] = B3[0]; vertices[verticesIndex + 1] = B3[1]; vertices[verticesIndex + 2] = B3[2]; verticesIndex += 3;
	vertices[verticesIndex] = C3[0]; vertices[verticesIndex + 1] = C3[1]; vertices[verticesIndex + 2] = C3[2]; verticesIndex += 3;

	// face 3
	vertices[verticesIndex] = A0[0]; vertices[verticesIndex + 1] = A0[1]; vertices[verticesIndex + 2] = A0[2]; verticesIndex += 3;
	vertices[verticesIndex] = C3[0]; vertices[verticesIndex + 1] = C3[1]; vertices[verticesIndex + 2] = C3[2]; verticesIndex += 3;
	vertices[verticesIndex] = C0[0]; vertices[verticesIndex + 1] = C0[1]; vertices[verticesIndex + 2] = C0[2]; verticesIndex += 3;

	// face 4
	vertices[verticesIndex] = A0[0]; vertices[verticesIndex + 1] = A0[1]; vertices[verticesIndex + 2] = A0[2]; verticesIndex += 3;
	vertices[verticesIndex] = C0[0]; vertices[verticesIndex + 1] = C0[1]; vertices[verticesIndex + 2] = C0[2]; verticesIndex += 3;
	vertices[verticesIndex] = B0[0]; vertices[verticesIndex + 1] = B0[1]; vertices[verticesIndex + 2] = B0[2]; verticesIndex += 3;

	// face 5
	vertices[verticesIndex] = A0[0]; vertices[verticesIndex + 1] = A0[1]; vertices[verticesIndex + 2] = A0[2]; verticesIndex += 3;
	vertices[verticesIndex] = B0[0]; vertices[verticesIndex + 1] = B0[1]; vertices[verticesIndex + 2] = B0[2]; verticesIndex += 3;
	vertices[verticesIndex] = A1[0]; vertices[verticesIndex + 1] = A1[1]; vertices[verticesIndex + 2] = A1[2]; verticesIndex += 3;

	// face 6
	vertices[verticesIndex] = B1[0]; vertices[verticesIndex + 1] = B1[1]; vertices[verticesIndex + 2] = B1[2]; verticesIndex += 3;
	vertices[verticesIndex] = C1[0]; vertices[verticesIndex + 1] = C1[1]; vertices[verticesIndex + 2] = C1[2]; verticesIndex += 3;
	vertices[verticesIndex] = B0[0]; vertices[verticesIndex + 1] = B0[1]; vertices[verticesIndex + 2] = B0[2]; verticesIndex += 3;

	// face 7
	vertices[verticesIndex] = B1[0]; vertices[verticesIndex + 1] = B1[1]; vertices[verticesIndex + 2] = B1[2]; verticesIndex += 3;
	vertices[verticesIndex] = B0[0]; vertices[verticesIndex + 1] = B0[1]; vertices[verticesIndex + 2] = B0[2]; verticesIndex += 3;
	vertices[verticesIndex] = C0[0]; vertices[verticesIndex + 1] = C0[1]; vertices[verticesIndex + 2] = C0[2]; verticesIndex += 3;

	// face 8
	vertices[verticesIndex] = B1[0]; vertices[verticesIndex + 1] = B1[1]; vertices[verticesIndex + 2] = B1[2]; verticesIndex += 3;
	vertices[verticesIndex] = C0[0]; vertices[verticesIndex + 1] = C0[1]; vertices[verticesIndex + 2] = C0[2]; verticesIndex += 3;
	vertices[verticesIndex] = A3[0]; vertices[verticesIndex + 1] = A3[1]; vertices[verticesIndex + 2] = A3[2]; verticesIndex += 3;

	// face 9
	vertices[verticesIndex] = B1[0]; vertices[verticesIndex + 1] = B1[1]; vertices[verticesIndex + 2] = B1[2]; verticesIndex += 3;
	vertices[verticesIndex] = A3[0]; vertices[verticesIndex + 1] = A3[1]; vertices[verticesIndex + 2] = A3[2]; verticesIndex += 3;
	vertices[verticesIndex] = A2[0]; vertices[verticesIndex + 1] = A2[1]; vertices[verticesIndex + 2] = A2[2]; verticesIndex += 3;

	// face 10
	vertices[verticesIndex] = B1[0]; vertices[verticesIndex + 1] = B1[1]; vertices[verticesIndex + 2] = B1[2]; verticesIndex += 3;
	vertices[verticesIndex] = A2[0]; vertices[verticesIndex + 1] = A2[1]; vertices[verticesIndex + 2] = A2[2]; verticesIndex += 3;
	vertices[verticesIndex] = C1[0]; vertices[verticesIndex + 1] = C1[1]; vertices[verticesIndex + 2] = C1[2]; verticesIndex += 3;

	// face 11
	vertices[verticesIndex] = B0[0]; vertices[verticesIndex + 1] = B0[1]; vertices[verticesIndex + 2] = B0[2]; verticesIndex += 3;
	vertices[verticesIndex] = C1[0]; vertices[verticesIndex + 1] = C1[1]; vertices[verticesIndex + 2] = C1[2]; verticesIndex += 3;
	vertices[verticesIndex] = A1[0]; vertices[verticesIndex + 1] = A1[1]; vertices[verticesIndex + 2] = A1[2]; verticesIndex += 3;

	// face 12
	vertices[verticesIndex] = C0[0]; vertices[verticesIndex + 1] = C0[1]; vertices[verticesIndex + 2] = C0[2]; verticesIndex += 3;
	vertices[verticesIndex] = C3[0]; vertices[verticesIndex + 1] = C3[1]; vertices[verticesIndex + 2] = C3[2]; verticesIndex += 3;
	vertices[verticesIndex] = A3[0]; vertices[verticesIndex + 1] = A3[1]; vertices[verticesIndex + 2] = A3[2]; verticesIndex += 3;

	// face 13
	vertices[verticesIndex] = A1[0]; vertices[verticesIndex + 1] = A1[1]; vertices[verticesIndex + 2] = A1[2]; verticesIndex += 3;
	vertices[verticesIndex] = C1[0]; vertices[verticesIndex + 1] = C1[1]; vertices[verticesIndex + 2] = C1[2]; verticesIndex += 3;
	vertices[verticesIndex] = C2[0]; vertices[verticesIndex + 1] = C2[1]; vertices[verticesIndex + 2] = C2[2]; verticesIndex += 3;

	// face 14
	vertices[verticesIndex] = A1[0]; vertices[verticesIndex + 1] = A1[1]; vertices[verticesIndex + 2] = A1[2]; verticesIndex += 3;
	vertices[verticesIndex] = C2[0]; vertices[verticesIndex + 1] = C2[1]; vertices[verticesIndex + 2] = C2[2]; verticesIndex += 3;
	vertices[verticesIndex] = B3[0]; vertices[verticesIndex + 1] = B3[1]; vertices[verticesIndex + 2] = B3[2]; verticesIndex += 3;

	// face 15
	vertices[verticesIndex] = C3[0]; vertices[verticesIndex + 1] = C3[1]; vertices[verticesIndex + 2] = C3[2]; verticesIndex += 3;
	vertices[verticesIndex] = B3[0]; vertices[verticesIndex + 1] = B3[1]; vertices[verticesIndex + 2] = B3[2]; verticesIndex += 3;
	vertices[verticesIndex] = B2[0]; vertices[verticesIndex + 1] = B2[1]; vertices[verticesIndex + 2] = B2[2]; verticesIndex += 3;

	// face 16
	vertices[verticesIndex] = C3[0]; vertices[verticesIndex + 1] = C3[1]; vertices[verticesIndex + 2] = C3[2]; verticesIndex += 3;
	vertices[verticesIndex] = B2[0]; vertices[verticesIndex + 1] = B2[1]; vertices[verticesIndex + 2] = B2[2]; verticesIndex += 3;
	vertices[verticesIndex] = A3[0]; vertices[verticesIndex + 1] = A3[1]; vertices[verticesIndex + 2] = A3[2]; verticesIndex += 3;

	// face 17
	vertices[verticesIndex] = B3[0]; vertices[verticesIndex + 1] = B3[1]; vertices[verticesIndex + 2] = B3[2]; verticesIndex += 3;
	vertices[verticesIndex] = C2[0]; vertices[verticesIndex + 1] = C2[1]; vertices[verticesIndex + 2] = C2[2]; verticesIndex += 3;
	vertices[verticesIndex] = B2[0]; vertices[verticesIndex + 1] = B2[1]; vertices[verticesIndex + 2] = B2[2]; verticesIndex += 3;

	// face 18
	vertices[verticesIndex] = C2[0]; vertices[verticesIndex + 1] = C2[1]; vertices[verticesIndex + 2] = C2[2]; verticesIndex += 3;
	vertices[verticesIndex] = C1[0]; vertices[verticesIndex + 1] = C1[1]; vertices[verticesIndex + 2] = C1[2]; verticesIndex += 3;
	vertices[verticesIndex] = A2[0]; vertices[verticesIndex + 1] = A2[1]; vertices[verticesIndex + 2] = A2[2]; verticesIndex += 3;

	// face 19
	vertices[verticesIndex] = C2[0]; vertices[verticesIndex + 1] = C2[1]; vertices[verticesIndex + 2] = C2[2]; verticesIndex += 3;
	vertices[verticesIndex] = A2[0]; vertices[verticesIndex + 1] = A2[1]; vertices[verticesIndex + 2] = A2[2]; verticesIndex += 3;
	vertices[verticesIndex] = B2[0]; vertices[verticesIndex + 1] = B2[1]; vertices[verticesIndex + 2] = B2[2]; verticesIndex += 3;

	// face 20
	vertices[verticesIndex] = A2[0]; vertices[verticesIndex + 1] = A2[1]; vertices[verticesIndex + 2] = A2[2]; verticesIndex += 3;
	vertices[verticesIndex] = A3[0]; vertices[verticesIndex + 1] = A3[1]; vertices[verticesIndex + 2] = A3[2]; verticesIndex += 3;
	vertices[verticesIndex] = B2[0]; vertices[verticesIndex + 1] = B2[1]; vertices[verticesIndex + 2] = B2[2]; verticesIndex += 3;

	for (int i = 0; i < numVertices; i++) indexes[i] = i;

	InitBuffers();
}