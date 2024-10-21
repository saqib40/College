// Random 10k integers between 0 to 9999
// Seperated by delimiter comma

#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int generateData(int a, int b) {
    // create a file by opening in reading mode
    FILE *fptr;
    fptr = fopen("data.txt", "w");
    srand(time(NULL));
    // now we writing to the file
    for(int i=a; i<b; i++) {
        int num = rand() % 10000; // num between 0-9999
        if(i==b-1) {
            fprintf(fptr,"%d",num);
            break;
        }
        fprintf(fptr,"%d,",num);
    }
    fclose(fptr);
    return 0;
}
int main() {
    generateData(0,10000);
    return 0;
}