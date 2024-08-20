#include <stdio.h>
#include <math.h>

#define MAX_SIZE 20

int x[MAX_SIZE], y[MAX_SIZE], result[MAX_SIZE];

int main()
{
    int lx = 4, ly = 3, N, m, n, i;

    // Initialize arrays to zero
    for (i = 0; i < MAX_SIZE; i++)
    {
        x[i] = 0;
        y[i] = 0;
        result[i] = 0;
    }

    // Define default sequences
    int default_x[] = {1, 2, 3, 4};
    int default_y[] = {1, 2, 3};

    // Copy default sequences to x and y
    for (i = 0; i < lx; i++)
        x[i] = default_x[i];
    for (i = 0; i < ly; i++)
        y[i] = default_y[i];

    // Determine the length of circular convolution
    N = (lx > ly) ? lx : ly;

    // Perform circular convolution
    for (n = 0; n < N; n++)
    {
        for (m = 0; m < N; m++)
        {
            result[n] += (x[m] * y[(n - m + N) % N]);
        }
    }

    // Print the input sequences
    printf("First sequence x[n]: ");
    for (i = 0; i < lx; i++)
        printf("%d ", x[i]);
    printf("\n");

    printf("Second sequence y[n]: ");
    for (i = 0; i < ly; i++)
        printf("%d ", y[i]);
    printf("\n");

    // Print the result
    printf("The circular convolution is:\n");
    for (i = 0; i < N; i++)
        printf("%d ", result[i]);
    printf("\n");

    return 0;
}