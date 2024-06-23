#include <stdio.h>

void bill() {
    printf("bill is called\n");
}

void sam() {
    printf("sam is called\n");
}
//~/dz22$ gcc -shared -o libshared bill_sam.o -fPIC