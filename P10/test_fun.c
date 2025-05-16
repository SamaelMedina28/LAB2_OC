#include<stdio.h>

int num1 = 10;

// apt-get install gcc-multilib
// apt-get install libc6-dev-i386 -y
extern void pbin8b( int num);

int main() {
    int num = 5;
    pbin8b(num);
    return 0;
}