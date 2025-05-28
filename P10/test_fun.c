#include <stdio.h>
#include <stdint.h>

extern void pbin8b(uint8_t dato);
extern void pbin16b(uint16_t dato);
extern void pbin32b(uint32_t dato);
extern void pbin64b(uint64_t dato);

int main() {
    // printf("Prueba 8 bits (5):\n");
    pbin8b(255);          // 11111111
    
    // printf("\nPrueba 16 bits (256):\n");
    pbin16b(256);       // 100000000
    
    // printf("\nPrueba 32 bits (65536):\n");
    pbin32b(70536);     // 10000000 00000000 00000000 00000000
    
    // printf("\nPrueba 64 bits (4294967296):\n");
    pbin64b(5554967296); // 10000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
    
    return 0;
}