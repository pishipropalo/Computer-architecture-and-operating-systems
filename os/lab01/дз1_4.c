#include <stdio.h>
#include <stdlib.h>

typedef struct Node {
    int num;
    struct Node* next;
} Node;

int main() {
    Node* head = NULL;
    Node* tmp;
    int inp;

    while (1) {
        scanf("%d", &inp);
        if (inp == 0) {
            break;
        }
        Node* Node2 = (Node*)malloc(sizeof(Node));
      Node2->num = inp;
      Node2->next = NULL;
        if (head == NULL) {
            head = Node2;
        } else {
          tmp = head;
            while (tmp->next != NULL) {
              tmp = tmp->next;
            }
          tmp->next = Node2;
        }
    }

    Node* prev = NULL;
    Node* curr = head;
    Node* next = NULL;
    while (curr != NULL) {
        next = curr->next;
      curr->next = prev;
        prev = curr;
      curr = next;
    }
    head = prev;

  tmp = head;
    while (tmp != NULL) {
        printf("%d ", tmp->num);
      tmp = tmp->next;
    }
    printf("\n");

    while (head != NULL) {
      tmp = head;
        head = head->next;
        free(tmp);
    }

    return 0;
}
