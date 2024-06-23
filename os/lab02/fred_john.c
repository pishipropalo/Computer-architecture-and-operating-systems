#include <stdio.h>

void fred() {
    printf("fred is called\n");
}

void john() {
    printf("john is called\n");
}
//~/dz22$ gcc -c fred_john.c
//~/dz22$ ar crv libstatic.a fred_john.o