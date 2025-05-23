#include<stdio.h>

int num1 = 10;

// apt-get install gcc-multilib
// apt-get install libc6-dev-i386 -y
extern void pbin8b( int num);
extern void pbin16b( int num);
extern void pbin32b(long int num);

int main() {
    // int num = 5;
    // int num2 = 256;
    long int num3 = 125;
    // pbin8b(num);
    // pbin16b(num2);
    pbin32b(num3);


    return 0;

}