#include "CGModel.h"
#include <GLFW\glfw3.h>
#include <iostream>

//
// FUNCIÓN: CGModel::initialize(int, int)
//
// PROPÓSITO: Initializa el modelo 3D
//
void CGModel::initialize(int w, int h)
{
    glClearColor(1.0f, 1.0f, 1.0f, 1.0f);

    resize(w, h);
}

//
// FUNCIÓN: CGModel::finalize()
//
// PROPÓSITO: Libera los recursos del modelo 3D
//
void CGModel::finalize()
{
}

//
// FUNCIÓN: CGModel::resize(int w, int h)
//
// PROPÓSITO: Asigna el viewport y el clipping volume
//
void CGModel::resize(int w, int h)
{
    glViewport(0, 0, w, h);
}

//
// FUNCIÓN: CGModel::render()
//
// PROPÓSITO: Genera la imagen
//
void CGModel::render()
{
    glClear(GL_COLOR_BUFFER_BIT);
}

//
// FUNCIÓN: CGModel::update()
//
// PROPÓSITO: Anima la escena
//
void CGModel::update()
{
}

//
// FUNCIÓN: CGModel::key_pressed(int)
//
// PROPÓSITO: Respuesta a acciones de teclado
//
void CGModel::key_pressed(int key)
{
    switch (key)
    {
    case GLFW_KEY_R:
        glClearColor(1.0f, 0.0f, 0.0f, 1.0f);
        break;
    case GLFW_KEY_G:
        glClearColor(0.0f, 1.0f, 0.0f, 1.0f);
        break;
    case GLFW_KEY_B:
        glClearColor(0.0f, 0.0f, 1.0f, 1.0f);
        break;
    case GLFW_KEY_W:
        glClearColor(1.0f, 1.0f, 1.0f, 1.0f);
        break;
    }
}

//
//  FUNCIÓN: CGModel:::mouse_button(int button, int action)
//
//  PROPÓSITO: Respuesta del modelo a un click del ratón.
//
void CGModel::mouse_button(int button, int action)
{
}

//
//  FUNCIÓN: CGModel::mouse_move(double xpos, double ypos)
//
//  PROPÓSITO: Respuesta del modelo a un movimiento del ratón.
//
void CGModel::mouse_move(double xpos, double ypos)
{
}
