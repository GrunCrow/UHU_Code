#include "CGDisk.h"
#include <GL/glew.h>
#include <math.h>
#include "CGFigure.h"

//
// FUNCIÓN: CGDisk::CGDisk()
//
// PROPÓSITO: Dibuja un disco de radio interior 'r0' (puede ser cero), 
//              radio exterior 'r1', dividido en 'p' capas y 'm' sectores.
//     
CGDisk::CGDisk(GLint p, GLint m, GLfloat r0, GLfloat r1)
{
	if (r0 == 0.0f)
	{
		numFaces = 2 * (2 * m * p - m);     // Number of faces
		numVertices = 2 * (m * p + 1);       // Number of vertices
		vertices = new GLfloat[numVertices * 3];
		indexes = new GLushort[numFaces * 3];

		int verticesIndex = 0;
		int indexesIndex = 0;

		vertices[0] = 0.0f;
		vertices[1] = 0.0f;
		vertices[2] = 0.0;
		verticesIndex += 3;

		for (int j = 0; j < m; j++)
		{
			GLfloat r = (GLfloat)(r1 / p);
			GLfloat mCos = (GLfloat)cos(glm::radians(360.0 * j / m));
			GLfloat mSin = (GLfloat)sin(glm::radians(360.0 * j / m));
			vertices[verticesIndex] = mCos * r;
			vertices[verticesIndex + 1] = mSin * r;
			vertices[verticesIndex + 2] = 0.0f;
			verticesIndex += 3;

			indexes[indexesIndex] = 0; // center
			indexes[indexesIndex + 1] = j + 1;
			indexes[indexesIndex + 2] = (j + 2 > m ? 1 : j + 2);
			indexesIndex += 3;
		}


		for (int i = 2; i <= p; i++)
		{
			for (int j = 0; j < m; j++)
			{
				GLfloat r = (GLfloat)(r1 * i / p);
				GLfloat mCos = (GLfloat)cos(glm::radians(360.0 * j / m));
				GLfloat mSin = (GLfloat)sin(glm::radians(360.0 * j / m));
				vertices[verticesIndex] = mCos * r;
				vertices[verticesIndex + 1] = mSin * r;
				vertices[verticesIndex + 2] = 0.0f;
				verticesIndex += 3;
			}
		}


		for (int i = 0; i < p - 1; i++)
		{
			for (int j = 0; j < m; j++)
			{
				indexes[indexesIndex] = m * i + j + 1;
				indexes[indexesIndex + 1] = m * (i + 1) + j + 1;
				indexes[indexesIndex + 2] = (j + 1 == m ? m * (i + 1) + 1 : m * (i + 1) + j + 2);
				indexesIndex += 3;

				indexes[indexesIndex] = m * i + j + 1;
				indexes[indexesIndex + 1] = (j + 1 == m ? m * (i + 1) + 1 : m * (i + 1) + j + 2);
				indexes[indexesIndex + 2] = (j + 1 == m ? m * i + 1 : m * i + j + 2);
				indexesIndex += 3;
			}
		}

		int base = verticesIndex / 3;

		vertices[base + 0] = 0.0f;
		vertices[base + 1] = 0.0f;
		vertices[base + 2] = 0.0;
		verticesIndex += 3;

		for (int j = 0; j < m; j++)
		{
			GLfloat r = (GLfloat)(r1 / p);
			GLfloat mCos = (GLfloat)cos(glm::radians(360.0 * j / m));
			GLfloat mSin = (GLfloat)sin(glm::radians(360.0 * j / m));
			vertices[verticesIndex] = mCos * r;
			vertices[verticesIndex + 1] = mSin * r;
			vertices[verticesIndex + 2] = 0.0f;
			verticesIndex += 3;

			indexes[indexesIndex] = base + 0; // center
			indexes[indexesIndex + 1] = base + (j + 2 > m ? 1 : j + 2);
			indexes[indexesIndex + 2] = base + j + 1;
			indexesIndex += 3;
		}


		for (int i = 2; i <= p; i++)
		{
			for (int j = 0; j < m; j++)
			{
				GLfloat r = (GLfloat)(r1 * i / p);
				GLfloat mCos = (GLfloat)cos(glm::radians(360.0 * j / m));
				GLfloat mSin = (GLfloat)sin(glm::radians(360.0 * j / m));
				vertices[verticesIndex] = mCos * r;
				vertices[verticesIndex + 1] = mSin * r;
				vertices[verticesIndex + 2] = 0.0f;
				verticesIndex += 3;
			}
		}


		for (int i = 0; i < p - 1; i++)
		{
			for (int j = 0; j < m; j++)
			{
				indexes[indexesIndex] = base + m * i + j + 1;
				indexes[indexesIndex + 1] = base + (j + 1 == m ? m * (i + 1) + 1 : m * (i + 1) + j + 2);
				indexes[indexesIndex + 2] = base + m * (i + 1) + j + 1;
				indexesIndex += 3;

				indexes[indexesIndex] = base + m * i + j + 1;
				indexes[indexesIndex + 1] = base + (j + 1 == m ? m * i + 1 : m * i + j + 2);
				indexes[indexesIndex + 2] = base + (j + 1 == m ? m * (i + 1) + 1 : m * (i + 1) + j + 2);
				indexesIndex += 3;
			}
		}
	}
	else
	{
		numFaces = 2 * (2 * m * p);      // Number of faces
		numVertices = 2 * (m * (p + 1));  // Number of vertices
		vertices = new GLfloat[numVertices * 3];
		indexes = new GLushort[numFaces * 3];

		int verticesIndex = 0;
		int indexesIndex = 0;

		for (int i = 0; i <= p; i++)
		{
			GLfloat r = r0 + (r1 - r0) * i / p;
			for (int j = 0; j < m; j++)
			{
				GLfloat mCos = (GLfloat)cos(glm::radians(360.0 * j / m));
				GLfloat mSin = (GLfloat)sin(glm::radians(360.0 * j / m));
				vertices[verticesIndex] = mCos * r;
				vertices[verticesIndex + 1] = mSin * r;
				vertices[verticesIndex + 2] = 0.0f;
				verticesIndex += 3;
			}
		}

		for (int i = 0; i < p; i++)
		{
			for (int j = 0; j < m; j++)
			{
				indexes[indexesIndex] = m * i + j;
				indexes[indexesIndex + 1] = m * (i + 1) + j;
				indexes[indexesIndex + 2] = (j + 1 == m ? m * (i + 1) : m * (i + 1) + j + 1);
				indexesIndex += 3;

				indexes[indexesIndex] = m * i + j;
				indexes[indexesIndex + 1] = (j + 1 == m ? m * (i + 1) : m * (i + 1) + j + 1);
				indexes[indexesIndex + 2] = (j + 1 == m ? m * i : m * i + j + 1);
				indexesIndex += 3;
			}
		}

		int base = verticesIndex / 3;

		for (int i = 0; i <= p; i++)
		{
			GLfloat r = r0 + (r1 - r0) * i / p;
			for (int j = 0; j < m; j++)
			{
				GLfloat mCos = (GLfloat)cos(glm::radians(360.0 * j / m));
				GLfloat mSin = (GLfloat)sin(glm::radians(360.0 * j / m));
				vertices[verticesIndex] = mCos * r;
				vertices[verticesIndex + 1] = mSin * r;
				vertices[verticesIndex + 2] = 0.0f;
				verticesIndex += 3;
			}
		}

		for (int i = 0; i < p; i++)
		{
			for (int j = 0; j < m; j++)
			{
				indexes[indexesIndex] = base + m * i + j;
				indexes[indexesIndex + 1] = base + (j + 1 == m ? m * (i + 1) : m * (i + 1) + j + 1);
				indexes[indexesIndex + 2] = base + m * (i + 1) + j;
				indexesIndex += 3;

				indexes[indexesIndex] = base + m * i + j;
				indexes[indexesIndex + 1] = base + (j + 1 == m ? m * i : m * i + j + 1);
				indexes[indexesIndex + 2] = base + (j + 1 == m ? m * (i + 1) : m * (i + 1) + j + 1);
				indexesIndex += 3;
			}
		}

	}

	InitBuffers();
}