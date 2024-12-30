#include <stdio.h>
#include <stdbool.h>
#include <stdlib.h> 

struct BstNode {
    int data;
    struct BstNode* left;
    struct BstNode* right;
};

struct BstNode* GetNewNode(int data) {
    struct BstNode* newNode = (struct BstNode*)malloc(sizeof(struct BstNode));
    newNode->data = data;
    newNode->left = newNode->right = NULL;
    return newNode;
}

struct BstNode* Insert(struct BstNode* root, int data) {
    if(root == NULL) {
        root = GetNewNode(data);
    }
    else if(data <= root->data) {
        root->left = Insert(root->left,data);
    }
    else {
        root->right = Insert(root->right,data);
    }
    return root;
}

bool Search(struct BstNode* root, int data) {
    if(root == NULL) {
        return false;
    }
    else if(root->data == data) {
        return true;
    }
    else if(data <= root->data) {
        return Search(root->left,data);
    }
    else {
        return Search(root->right,data);
    }
}

int minValue(struct BstNode *root) {
    // your code here
    if(root == NULL) {
        return NULL;
    }
    else if(root->left == NULL) {
        return root->data;
    }
    else {
        return minValue(root->left);
    }
} // similarly find max value by replacing left with right

int main() {
    struct BstNode* rootPtr;
    rootPtr = NULL;
    rootPtr = Insert(rootPtr,15);
    rootPtr = Insert(rootPtr,10);
    rootPtr = Insert(rootPtr,20);
    printf("%d",Search(rootPtr,1));
    return 0;
}