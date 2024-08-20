#include <stdio.h>
#include <math.h>

// Global variable declarations
float pi = 3.1428, xk_mag[10], xk_phase[10], xk_real[10], xk_imag[10];

int main()
{
    // Input sequence
    int x[10] = {1,1,1,0,0,0,0,0,0,0};
    
    // Number of points in DFT
    int N = 10;

    // Compute DFT
    for (int k = 0; k < N; k++)
    {
        // Initialize real and imaginary parts for each k
        xk_real[k] = xk_imag[k] = 0;

        // Compute DFT for each k
        for (int n = 0; n < N; n++)
        {
            // Real part of X[k]
            xk_real[k] += x[n] * cos(2 * pi * n * k / N);
            
            // Imaginary part of X[k]
            xk_imag[k] -= x[n] * sin(2 * pi * n * k / N);
        }

        // Compute magnitude of X[k]
        xk_mag[k] = sqrt(xk_real[k] * xk_real[k] + xk_imag[k] * xk_imag[k]);

        // Compute phase of X[k]
        xk_phase[k] = atan2(xk_imag[k], xk_real[k]);
    }

    // Print results
    printf("x[k]=\n");
    for (int k = 0; k < N; k++)
        printf("%5.3f+j(%5.3f)\n", xk_real[k], xk_imag[k]);

    printf("magnitude=\n");
    for (int k = 0; k < N; k++)
        printf("%5.3f\n", xk_mag[k]);

    printf("phase=\n");
    for (int k = 0; k < N; k++)
        printf("%5.3f\n", xk_phase[k]);

    return 0;
}