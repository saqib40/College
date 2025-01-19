#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

typedef struct {
    int data;
    struct Node* npx;
} Node;

Node* XOR(Node* a, Node* b) {
    return (Node*)((uintptr_t)(a) ^ (uintptr_t)(b));
}

Node* insertAtBeginning(Node* head, int data) {
    Node* newNode = (Node*)malloc(sizeof(Node));
    newNode->data = data;

    newNode->npx = head;

    if (head != NULL) {
        head->npx = XOR(newNode, head->npx);
    }

    return newNode;
}

void printList(Node* head) {
    Node* curr = head;
    Node* prev = NULL;
    Node* next;
    while(curr!=NULL) {
        printf("%d", curr->data);
        next = XOR(prev,curr->npx);
        prev = curr;
        curr = next;
    }
}

int main() {
    Node* head = NULL; 

    head = insertAtBeginning(head, 10);
    head = insertAtBeginning(head, 20);
    head = insertAtBeginning(head, 30);
    head = insertAtBeginning(head, 40);

    printList(head);
    return 0;
}