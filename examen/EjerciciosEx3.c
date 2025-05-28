#include <stdio.h>
#include <stdint.h>
extern uint32_t NotBit32b(uint32_t num, uint32_t num2);
extern uint32_t str_cnt_chr(char *string, char letra);
extern int shr_s(int num);
int main() {

    uint32_t num1 = 0x123456;
    int num2 = -126;
    int len = str_cnt_chr(palabra, 'o');
    char palabra[]={"Hola mundo gatuno"};

    // !Problema 1
    printf("Numero original: %x\n", num1);
    printf("Numero modificado: %x\n", NotBit32b(num1, 1));

    // !Problema 3
    printf("\nLa palabra '%s' tiene %d 'o'\n", palabra, len);

    // !Problema 5
    printf("Numero original: %d\n", num2);
    printf("Numero modificado: %d\n", shr_s(num2));
    return 0;
}
