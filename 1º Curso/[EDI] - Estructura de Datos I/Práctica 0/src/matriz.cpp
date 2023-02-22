#include "matriz.h"
#include <iostream> //cin, cout
#include <conio.h> // getch
#include <fstream>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAXIMO 20
#define M 5

using namespace std;

typedef quebrado tipoelemento ;


void matriz::cargar(char cad[])
{
    int x, y;
    FILE *fin=NULL;
    do
    {
        cout << "Filas: ";
        cin >> fila;
        cout << "Columnas: ";
        cin >> col;
    }
    while (fila>M || fila<1 || col>M || col<1);
    cout << "Carga de una matriz " << fila << " x " << col << ":\n";
    fin = fopen(cad, "rb");
    if (fin != NULL)
    {
        for (int i=0; i<fila; i++)
            for (int j=0; j<col; j++)
            {
                int n= rand()%80+1;
                fseek(fin,sizeof(int)*n,SEEK_SET);
                fread(&x,sizeof(int),1,fin);
                fread(&y,sizeof(int),1,fin);
                tipoelemento A(x,y);
                celda[i][j]=A;
                cout << "[" << i+1 << "," << j+1 << "]: ";
                A.mostrar();
                cout<<'\n';
            }
        fclose(fin);
        fin = NULL;
    }
    else
    {
        cout << "Error al abrir el fichero de numeros\n";
    }
}
void matriz::cargar()
{
    int x, y;
    do
    {
        cout << "Filas: ";
        cin >> fila;
        cout << "Columnas: ";
        cin >> col;
    }
    while (fila>M || fila<1 || col>M || col<1);
    cout << "Carga de una matriz " << fila << " x " << col << ":\n";
    for (int i=0; i<fila; i++)
    {
        for (int j=0; j<col; j++)
        {
            cout << "[" << i+1 << "," << j+1 << "]: ";
            cin>>x>>y;
            tipoelemento A(x,y);
            celda[i][j]=A;
            //A.mostrar();
        }
    }
}

matriz::matriz(int f, int c)
{
    fila=f;
    col=c;
    for (int i=0; i<fila; i++)
        for (int j=0; j<col; j++)
            celda[i][j]=0;
}

bool matriz::operator==(matriz m)
{
    bool iguales=true;
    if (fila==m.fila && col==m.col)
    {
        int i=0;
        while(i<fila && iguales)
        {
            int j=0;
            while(j<col && iguales)
            {
                if (!(celda[i][j]==m.celda[i][j]))
                    iguales=false;
                else
                    j++;
            }
            i++;
        }
    }
    else
        iguales=false;
    return iguales;
}

matriz matriz::operator*(matriz m)
{
    int i,j,k;
    tipoelemento prod;
    matriz p(fila,m.col);
    for (i=0; i< fila; i++)
        for (j=0; j< m.col; j++)
        {
            prod=0;
            for (k=0; k< col; k++)
                prod=prod+(celda[i][k]*m.celda[k][j]);
            p.celda[i][j]=prod;
        }
    return(p);
}

matriz matriz::operator+(matriz m)
{
    int i,j;
    matriz p(fila,col);
    for (i=0; i< fila; i++)
    {
        for (j=0; j< col; j++)
        {
            p.celda[i][j]=celda[i][j]+m.celda[i][j];
        }
    }
    return(p);
}

matriz matriz::operator-(matriz m)
{
    matriz p(fila,col);
    for (int i=0; i< fila; i++)
    {
        for (int j=0; j< col; j++)
        {
            p.celda[i][j]=celda[i][j]-m.celda[i][j];
        }
    }
    return(p);
}

matriz matriz::operator-()
{
    int i,j;
    matriz p(fila,col);
    for (i=0; i< fila; i++)
    {
        for (j=0; j< col; j++)
        {
            p.celda[i][j]=-celda[i][j];
        }
    }
    return(p);
}

void matriz::mostrar()
{
    int i,j;
    for (i=0; i<fila; i++)
    {
        for (j=0; j< col; j++)
        {
            celda[i][j].mostrar();
            cout << "\t";
        }
        cout << "\n";
    }
}
