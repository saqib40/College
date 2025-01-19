int tSearch(int A[], int target, int n) {
    int low = 0;
    int high = n-1;
    while(low<=high) {
        int mid1 = low + (high-low)/3;
        int mid2 = high - (high-low)/3;
        if(A[mid1] == target) {
            return mid1;
        }
        if(A[mid2] == target) {
            return mid2;
        }
        
        if(target<A[mid1]) {
            high = mid1-1;
        }
        else if(target>A[mid2]) {
            low = mid2+1;
        }
        else {
            low = mid1+1;
            high = mid2-1;
        }
    }
    return -1;
}