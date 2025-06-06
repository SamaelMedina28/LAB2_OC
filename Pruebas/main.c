#include<stdio.h>
#include <stdint.h>

extern int inc(int);
extern uint64_t inc64b(uint64_t*);
extern uint8_t getNibble(uint32_t, int);
extern int mayor( int*, int);
extern int esPrimo(int);

extern int sumar(int, int);
extern int sumar1(int, int, int);

extern int primoGemelo(int);

int main(){
    // Incrementar numero de 32 bits
    printf("Se incremento el numero 5 y ahora es: %d\n", inc(5));

    uint64_t num64 = 5554967296;

    // Incrementar numero de 64 bits
    inc64b(&num64);
    printf("Se incremento el numero 5554967296 y ahora es: %lld\n", num64);

    // GetNibble
    uint32_t num = 0x12445673;
    int posicion = 2;
    printf("El nibble #%d de izquierda a derecha de 0x%X es: %X\n", posicion, num, getNibble(num, posicion));

    // Mayor
    int arr[] = {10, 20, 8, 4, 50};
    int posicionMayor = mayor(arr, 5);
    printf("El numero mas grande del array [10, 20, 8, 4, 50] es: %d y esta la posicion %d\n", arr[posicionMayor],posicionMayor);

    // Es primo
    int numero = 127;
    if (esPrimo(numero)) {
        printf("El numero %d es primo\n", numero);
    } else {
        printf("El numero %d no es primo\n", numero);
    }

    // Incrementar y sumar 5
    int res = sumar1(1,4,10);

    printf("El resultado de sumar1(1, 4, 10) es: %d\n", res);

    // Primos gemelos
    int primo = 17;
    if (primoGemelo(primo)) {
        printf("El numero %d y %d son primos gemelos\n", primo, primo + 2);
    } else {
        printf("No hay primo gemelo para: %d\n", primo);
    }

    return 0;
}
