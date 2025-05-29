#include <stdio.h>
#include <stdint.h>
extern uint32_t NotBit32b(uint32_t num, uint32_t num2);
extern uint32_t str_cnt_chr(char *string, char letra);
extern int shr_s(int num);
extern int isPrime(int num);
extern uint32_t XchgBits( uint32_t dato, uint8_t numbit1, uint8_t  numbit2);
int main() {

    uint32_t numero_negado = 0x123456;
    char palabra[]={"Hola mundo"};
    int num2 = -126;
    int numero_primo = 1129;
    uint32_t num4 = 0x123456;
    // !Problema 1
    printf("Numero original: %x\n", numero_negado);
    printf("Numero modificado: %x\n", NotBit32b(numero_negado, 1));

    // !Problema 2
    printf("\nNumero original:   %x", num4);
    printf("\nNumero modificado: %x", XchgBits(num4, 1, 5));

    // !Problema 3
    printf("\n\nLa palabra '%s' tiene %d 'o'\n", palabra, str_cnt_chr(palabra, 'o'));

    // !Problema 4
    if( isPrime(numero_primo))
        printf("\nEl numero %d es primo\n", numero_primo);
    else
        printf("\nEl numero %d no es primo\n", numero_primo);

    // !Problema 5
    printf("\nNumero original: %d\n", num2);
    printf("Numero modificado: %d\n", shr_s(num2));
    return 0;
}
