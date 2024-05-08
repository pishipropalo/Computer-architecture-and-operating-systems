#include <stdio.h>
#include <stdlib.h>

int main() {
    int n, m;
    scanf("%d %d", &n, &m);

    int **l = malloc(sizeof(int[n]));
    for (int i = 0; i < n; i++) {
        l[i] = malloc(sizeof(int[m]));
        for (int j = 0; j < m; j++) {
          scanf("%d", &l[i][j]);
      }        
    }
    
    for (int j = 0; j < m; j++) {
        for (int i = 0; i < n; i++) {
            printf("%d ", l[i][j]);
        }
        printf("\n");
    }
    for (int i = 0; i < n; i++) {
      free(l[i]);
    }
    free(l);

    return 0;
}
