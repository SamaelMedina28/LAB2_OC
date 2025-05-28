#include <stdio.h>
#include <stdint.h>
extern uint32_t NotBit32b(uint32_t num, uint32_t num2);
extern uint32_t str_cnt_chr(char *string, char letra);
int main() {

    uint32_t num1 = 0x123456;
    char palabra[]={"Hola mundo"};
    printf("Numero original: %x\n", num1);
    printf("Numero modificado: %x\n", NotBit32b(num1, 1));

    int len = str_cnt_chr(palabra, 'o');
    printf("\nLa palabra '%s' tiene %d 'o'\n", palabra, len);

    return 0;
}
