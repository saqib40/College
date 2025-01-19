void mergeSort(int A[], int n) {
    if(n<2) {
        return;
    }
    int mid = n/2;
    int *L = (int*) malloc(mid*sizeof(int));
    int *R = (int*) malloc((n-mid)*sizeof(int));
    for(int i=0; i<mid; i++) {
        L[i] = A[i];
    }
    for(int i=mid; i<n; i++) {
        R[i] = A[i];
    }
    mergeSort(L,mid);
    mergeSort(R,mid);
    merge(L,R,A,mid,n-mid);
}
void merge(int L[], int R[], int A[], int nL, int nR) {
    int i=0;
    int j=0;
    int k=0;
    while(i<nL && j<nR) {
        if(L[i]<=R[j]) {
            A[k] = L[i];
            i++;
        } else {
            A[k] = R[j];
            j++;
        }
        k++;
    }
    while(i<nL) {
        A[k] = L[i];
        k++;
        i++;
    }
    while(j<nR) {
        A[k] = R[j];
        k++;
        j++;
    }
}