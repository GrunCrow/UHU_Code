#include "CGSphere.h"
#include <GL/glew.h>
#include <math.h>
#include "CGFigure.h"


CGSphere::CGSphere(GLint p, GLint m, GLfloat r)
{
	numFaces = 2 * m * (p - 1);         // Number of faces
	numVertices = (m + 1) * (p + 1);  // Number of vertices
	vertices = new GLfloat[numVertices * 3];
	indexes = new GLushort[numFaces * 3];

	int verticesIndex = 0;
	int indexesIndex = 0;
	/* northern polar cap*/
	for (int j = 0; j <= m; j++)
	{
		vertices[verticesIndex] = 0.0;
		vertices[verticesIndex + 1] = 0.0f;
		vertices[verticesIndex + 2] = r;
		verticesIndex += 3;
	}

	for (int i = 1; i < p; i++)
	{
		for (int j = 0; j <= m; j++)
		{
			GLfloat pCos = (GLfloat)cos(glm::radians(180.0 * i / p));
			GLfloat pSin = (GLfloat)sin(glm::radians(180.0 * i / p));
			GLfloat mCos = (GLfloat)cos(glm::radians(360.0 * j / m));
			GLfloat mSin = (GLfloat)sin(glm::radians(360.0 * j / m));

			vertices[verticesIndex] = pSin * mCos * r;
			vertices[verticesIndex + 1] = pSin * mSin * r;
			vertices[verticesIndex + 2] = pCos * r;
			verticesIndex += 3;
		}
	}

	/* southern polar cap*/
	for (int j = 0; j <= m; j++)
	{
		vertices[verticesIndex] = 0.0;
		vertices[verticesIndex + 1] = 0.0f;
		vertices[verticesIndex + 2] = -r;
		verticesIndex += 3;
	}

	/* northern polar cap*/
	for (int j = 0; j < m; j++)
	{
		indexes[indexesIndex] = j;
		indexes[indexesIndex + 1] = m + j + 1;
		indexes[indexesIndex + 2] = m + j + 2;
		indexesIndex += 3;
	}
	for (int i = 1; i < p - 1; i++)
	{
		for (int j = 0; j < m; j++)
		{
			indexes[indexesIndex] = i * (m + 1) + j;
			indexes[indexesIndex + 1] = (i + 1) * (m + 1) + j;
			indexes[indexesIndex + 2] = i * (m + 1) + j + 1;
			indexes[indexesIndex + 3] = (i + 1) * (m + 1) + j;
			indexes[indexesIndex + 4] = (i + 1) * (m + 1) + j + 1;
			indexes[indexesIndex + 5] = i * (m + 1) + j + 1;
			indexesIndex += 6;
		}
	}
	for (int j = 0; j < m; j++)
	{
		indexes[indexesIndex] = (p - 1) * (m + 1) + j;
		indexes[indexesIndex + 1] = p * (m + 1) + j;
		indexes[indexesIndex + 2] = (p - 1) * (m + 1) + j + 1;
		indexesIndex += 3;
	}

	InitBuffers();
}
