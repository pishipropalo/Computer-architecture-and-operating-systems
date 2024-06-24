#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include <time.h>

int s = 0;
pthread_mutex_t mutex;

void* summ(void *l1) {
  int *l2 = (int*)l1;
  int *l = (int*)l2[0];
  int beg = l2[1];
  int end = l2[2];
  int curr_s = 0;

  for (int i = beg; i < end; ++i) {
    curr_s += l[i];
  }

  pthread_mutex_lock(&mutex);
  s += curr_s;
  pthread_mutex_unlock(&mutex);

  pthread_exit(NULL);
}

int main() {
  int n;
  scanf("%d", &n);

  int *l = malloc(n * sizeof(int));
  srand(time(NULL));
  for (int i = 0; i < n; ++i) {
    l[i] = rand() % 100;
  }

  pthread_mutex_init(&mutex, NULL);

  pthread_t threads[4];
  int l1[4][3];
  int dev = n / 4;

  for (int i = 0; i < 4; ++i) {
    l1[i][0] = (int)l;
    l1[i][1] = i * dev;
    l1[i][2] = (i == 3) ? n : (i + 1) * dev;

    pthread_create(&threads[i], NULL, summ, (void *) l1[i]);
  }

  for (int i = 0; i < n; ++i) {
    printf("%d ", l[i]);
  }
  printf("\n");

  for (int i = 0; i < 4; ++i) {
    pthread_join(threads[i], NULL);
  }

  printf("%d", s);

  pthread_mutex_destroy(&mutex);
  free(l);

  return 0;
}
