// Given a large dataset that needs to be processed in chunks.
// Large Dataset = our text file (10k numbers)
// Chunks involve = 1k numbers (in arrays)
#include <stdio.h>
#include <stdlib.h>

int handleData(char *file, int n, int chunkSize) { // n say 0 => first 1k integers,...
    FILE *fptr;
    fptr = fopen("data.txt", "r");
    int *myArr = (int*)malloc(chunkSize*sizeof(int));
    // skip the proper numbers from the beginning
    int num;
    int skipCount = (n - 1) * chunkSize;
    int j=0;
    while(j<skipCount) {
        fscanf(fptr, "%d,", &num);
        j++;
    }
    int i=0;
    while(i < chunkSize && fscanf(fptr, "%d,", &num) == 1) {
        myArr[i] = num;
        i++;
    }
    // print myArr
    for(int k=0; k<chunkSize; k++) {
        if(k==0) {
            printf("[%d ", myArr[k]);
        }
        else if(k==chunkSize-1) {
            printf("%d]", myArr[k]);
        }
        else {
            printf("%d, ", myArr[k]);
        }
    }
    free(myArr);
    fclose(fptr);
    return 0;
}
int main() {
    char myFile[] = "data.txt";
    for(int i=1; i<11; i++) {
        printf("\n\nPrinting %d chunk\n\n", i);
        handleData(myFile, i, 1000);
    }
    return 0;
}