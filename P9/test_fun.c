#include<stdio.h>

int num1 = 10;
int num2 = 20;

int num3 = 10;

char cadena[20] = "Hola Mundo";
char letra = 'a';

extern int suma(int a, int b);
extern int strlen(char *str);
extern char *strchr(char *str, char c);
extern int getBit(int num, int bit);


// apt-get install gcc-multilib
// apt-get install libc6-dev-i386 -y

int main() {
    int resultado = suma(num1, num2);
    int posicion = strchr(cadena, letra) - cadena;
    printf("La suma de %d y %d es: %d\n", num1, num2, resultado);
    printf("La longitud de la cadena '%s' es: %d\n", cadena, strlen(cadena));
    printf("La letra %c esta en la posicion %d de la cadena %s\n", letra, posicion, cadena);   
    printf("El bit %d de %d es: %d\n", 2, num3, getBit(num3, 0));
    printf("El bit %d de %d es: %d\n", 2, num3, getBit(num3, 1));
    printf("El bit %d de %d es: %d\n", 2, num3, getBit(num3, 2));
    printf("El bit %d de %d es: %d\n", 2, num3, getBit(num3, 3));
    return 0;
}