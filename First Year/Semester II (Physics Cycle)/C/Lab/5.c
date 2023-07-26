#include <stdio.h>

// finding index of element k in given sorted array arr
int binarySearch(int arr[], int low, int high, int k)
{
    if (low > high) { //exit condition
        return -1;
    }
    int mid = (low + high)/2;
    if (k == arr[mid]) {
        return mid;
    }
    else if (k < arr[mid]) {
        binarySearch(arr, low, mid-1, k);
    }
    else {
        binarySearch(arr, mid+1, high, k);
    }
}

void main() {
    int a[] = {3, 5, 9, 21, 31};
    int z = binarySearch(a, 0, 4, 9);
    printf("%d", z);
}

// output; 2