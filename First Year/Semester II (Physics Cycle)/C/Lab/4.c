#include <stdio.h>
#include <stdlib.h>

void merge(int L[], int R[], int A[], int nL, int nR)
{
    int i = 0, j = 0, k = 0;
    while(i < nL && j < nR)
    {
        if (L[i] <= R[j]) {
            A[k] = L[i];
            i++;
        }
        else {
            A[k] = R[j];
            j++;
        }
        k++;
    }
    while (i < nL)
    {
        A[k] = L[i];
        i++;
        k++;
    }
    while (j < nR)
    {
        A[k] = R[j];
        j++;
        k++;
    }
}

void mergeSort(int A[], int n)
{
    if (n < 2) {
        return;
    }
    int mid = n/2;
    int *L = (int*) malloc(mid * sizeof(int));
    int *R = (int*) malloc((n-mid) * sizeof(int));
    int i;
    for (i = 0; i < mid; i++) {
        L[i] = A[i];
    }
    for (i = mid; i < n; i++) {
        R[i-mid] = A[i];
    }
    mergeSort(L, mid);
    mergeSort(R, n-mid);
    merge(L, R, A, mid, n-mid);
}

int print(int A[], int n) {
    printf("A = [");
    for (int i = 0; i < n; i++) {
        printf("%d ", A[i]);
    }
    printf("]\n");
}

int main() {
    int A[] = {10, 2, 9, 7, 5, 4, 7};
    print(A, 7);
    mergeSort(A, 7);
    print(A, 7);
    return 0;
}