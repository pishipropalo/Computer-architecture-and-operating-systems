#include <stdio.h>
#include <stdlib.h>

int main() {
    int n;

    scanf("%d", &n);

    int *l = malloc(sizeof(int[n]));
    for (int i = 0; i < n; i++) {
        scanf("%d", &l[i]);
    }
    for (int i = n - 1; i >= 0; i--) {
        printf("%d ", l[i]);
    }
    free(l);
    return 0;
}