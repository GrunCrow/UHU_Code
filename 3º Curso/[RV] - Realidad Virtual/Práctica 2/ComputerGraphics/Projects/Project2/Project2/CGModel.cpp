#include "CGModel.h"
#include <GLFW\glfw3.h>
#include <iostream>

//
// FUNCI�N: CGModel::initialize(int, int)
//
// PROP�SITO: Initializa el modelo 3D
//
void CGModel::initialize(int w, int h)
{
    // Crea el programa
    program = new CGShaderProgram();
    if (program->IsLinked() == GL_TRUE) program->Use();     // si se linkea sin problemas, entonces se linkea
    else std::cout << program->GetLog() << std::endl;       // si da problemas, entonces se le pone al programa basico que nos de el mensaje de error con getlog

    // Crea la escena
    triangle = new CGTriangle();
    posX = 0.0f;
    posY = 0.0f;
    size = 5.0f;
    stepX = 0.02f;
    stepY = 0.01f;

    // Asigna el viewport
    resize(w, h);

    // Opciones de dibujo
    glClearColor(0.0f, 0.0f, 1.0f, 1.0f);
    glPolygonMode(GL_FRONT, GL_FILL);
}

//
// FUNCI�N: CGModel::finalize()
//
// PROP�SITO: Libera los recursos del modelo 3D
//
void CGModel::finalize()
{
    delete triangle;
    delete program;
}

//
// FUNCI�N: CGModel::resize(int w, int h)
//
// PROP�SITO: Asigna el viewport y el clipping volume
//
void CGModel::resize(int w, int h)
{
    glViewport(0, 0, w, h);
}

//
// FUNCI�N: CGModel::render()
//
// PROP�SITO: Genera la imagen
//
void CGModel::render()
{
    // Limpia el framebuffer
    glClear(GL_COLOR_BUFFER_BIT);

    // Dibuja la escena
    triangle->Draw(program, posX, posY, size);
}

//
// FUNCI�N: CGModel::update()
//
// PROP�SITO: Anima la escena
//
void CGModel::update()
{
    GLfloat length = 0.01f * size;
    posX += stepX;
    if (posX - length < -1.0f) { posX -= stepX; stepX = 0.02f; }
    if (posX + length > 1.0f) { posX -= stepX; stepX = -0.02f; }

    posY += stepY;
    if (posY - length < -1.0f) { posY -= stepY; stepY = 0.01f; }
    if (posY + length > 1.0f) { posY -= stepY; stepY = -0.01f; }
}

//
// FUNCI�N: CGModel::key_pressed(int)
//
// PROP�SITO: Respuesta a acciones de teclado
//
void CGModel::key_pressed(int key)
{
    switch (key)
    {
    case GLFW_KEY_R:
        posX = 0.0f;
        posY = 0.0f;
        size = 5.0f;
        break;
    case GLFW_KEY_UP:
        size += 0.5;
        if (size >= 50.0f) size = 50.0f;
        break;
    case GLFW_KEY_DOWN:
        size -= 0.5;
        if (size <= 1.0f) size = 1.0f;
        break;
    }
}

//
//  FUNCI�N: CGModel:::mouse_button(int button, int action)
//
//  PROP�SITO: Respuesta del modelo a un click del rat�n.
//
void CGModel::mouse_button(int button, int action)
{
}

//
//  FUNCI�N: CGModel::mouse_move(double xpos, double ypos)
//
//  PROP�SITO: Respuesta del modelo a un movimiento del rat�n.
//
void CGModel::mouse_move(double xpos, double ypos)
{
}
