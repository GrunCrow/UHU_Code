#include <iostream>
#include <iomanip>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <conio.h>

using namespace std;

#define NUMCARS 29

static const char* mesesValidos[];

const char *mesesValidos[]={"ene"};

char letras[NUMCARS]    = {' ',',','.','a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z'};
carmorse morse[NUMCARS] = {" ","--..--",".-.-.-",".-","-...","-.-.","-..",".","..-.","--.","....","..",".---","-.-",".-..","--","-.","---",".--.","--.-",".-.","...","-","..-","...-",".--","-..-","-.--","--.."};
