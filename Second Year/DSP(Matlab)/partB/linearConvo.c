#include <stdio.h>
#include <math.h>

int y[20];  // Output sequence

int main()
{
    int m = 6;  // Length of first sequence
    int n = 6;  // Length of second sequence
    
    // Input sequences
    int x[15] = {1,2,3,4,5,6,0,0,0,0,0};
    int h[15] = {1,2,3,4,5,6,0,0,0,0,0};

    // Perform convolution
    for (int i = 0; i < (m+n-1); i++)
    {
        y[i] = 0;
        for (int j = 0; j <= i; j++)
        {
            if (j < m && (i-j) < n)
                y[i] += x[j] * h[i-j];
        }
    }

    // Print the result
    printf("The output sequence = \n");
    for (int i = 0; i < (m+n-1); i++)
        printf("%d\n", y[i]);

    return 0;
}