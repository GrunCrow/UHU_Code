#include "CGModel.h"
#include <glm/glm.hpp>
#include <glm/gtc/matrix_transform.hpp>
#include <GLFW/glfw3.h>
#include <iostream>
#include "CGCube.h"
#include "CGCone.h"
#include "CGPiramid.h"
#include "CGCylinder.h"
#include "CGSphere.h"
#include "CGDisk.h"
#include "CGTorus.h"
#include "CGIcosahedron.h"

//
// FUNCIÓN: CGModel::initialize(int, int)
//
// PROPÓSITO: Initializa el modelo 3D
//
void CGModel::initialize(int w, int h)
{
    // Crea el programa
    program = new CGShaderProgram();
    if (program->IsLinked() == GL_TRUE) program->Use();
    else std::cout << program->GetLog() << std::endl;

    // Inicializa la posición de las figuras
    figure = 0;
    xAngle = 0.0f;
    yAngle = 0.0f;

    // Crea las figuras
    fig0 = new CGCube(25.0f);
    fig1 = new CGPiramid(25.0f);
    fig2 = new CGCone(5, 20, 25.0f, 25.0f);
    fig3 = new CGCylinder(20, 20, 25.0f, 25.0f);
    fig4 = new CGSphere(20, 20, 25.0f);
    fig5 = new CGDisk(5, 20, 12.5f, 25.0f);
    fig6 = new CGTorus(10, 20, 10.0f, 25.0f);
    fig7 = new CGIcosahedron(15.0f);

    // Asigna el viewport y el clipping volume
    resize(w, h);

    // Opciones de dibujo
    glEnable(GL_DEPTH_TEST);
    glEnable(GL_CULL_FACE);
    glFrontFace(GL_CCW);
    glPolygonMode(GL_FRONT_AND_BACK, GL_LINE);
}

//
// FUNCIÓN: CGModel::finalize()
//
// PROPÓSITO: Libera los recursos del modelo 3D
//
void CGModel::finalize()
{
    delete fig0;
    delete fig1;
    delete fig2;
    delete fig3;
    delete fig4;
    delete fig5;
    delete fig6;
    delete fig7;
    delete program;
}

//
// FUNCIÓN: CGModel::resize(int w, int h)
//
// PROPÓSITO: Asigna el viewport y el clipping volume
//
void CGModel::resize(int w, int h)
{
    double fov = glm::radians(15.0);
    double sin_fov = sin(fov);
    double cos_fov = cos(fov);
    if (h == 0) h = 1;
    GLfloat aspectRatio = (GLfloat)w / (GLfloat)h;
    GLfloat wHeight = (GLfloat)(sin_fov * 0.2 / cos_fov);
    GLfloat wWidth = wHeight * aspectRatio;

    glViewport(0, 0, w, h);
    projection = glm::frustum(-wWidth, wWidth, -wHeight, wHeight, 0.2f, 400.0f);
}

//
// FUNCIÓN: CGModel::render()
//
// PROPÓSITO: Genera la imagen
//
void CGModel::render()
{
    // Limpia el framebuffer
    glClearColor(1.0f, 1.0f, 1.0f, 1.0f);
    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);

    // Matriz de transformación
    glm::mat4 location = glm::mat4(1.0f);
    location = glm::translate(location, glm::vec3(0.0f, 0.0f, -180.0f));
    location = glm::rotate(location, glm::radians(yAngle), glm::vec3(0.0f, 1.0f, 0.0f));
    location = glm::rotate(location, glm::radians(xAngle), glm::vec3(1.0f, 0.0f, 0.0f));

    glm::mat4 transform = projection * location;

    switch (figure) {
    case 0: fig0->Draw(program, transform); break;
    case 1: fig1->Draw(program, transform); break;
    case 2: fig2->Draw(program, transform); break;
    case 3: fig3->Draw(program, transform); break;
    case 4: fig4->Draw(program, transform); break;
    case 5: fig5->Draw(program, transform); break;
    case 6: fig6->Draw(program, transform); break;
    case 7: fig7->Draw(program, transform); break;
    }
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
    case GLFW_KEY_F:
        figure = (figure + 1) % 8;
        break;
    case GLFW_KEY_UP:
        xAngle += 5.0f;
        break;
    case GLFW_KEY_DOWN:
        xAngle -= 5.0f;
        break;
    case GLFW_KEY_LEFT:
        yAngle -= 5.0f;
        break;
    case GLFW_KEY_RIGHT:
        yAngle += 5.0f;
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
