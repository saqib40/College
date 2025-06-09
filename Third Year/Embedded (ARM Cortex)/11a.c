#include <stdio.h>
#include "Serial.h"  // Include your serial/USART initialization header

// Macros to access low and high 32 bits of a 64-bit integer
#define lo64(a) (((unsigned int *)&a)[0])
#define hi64(a) (((int *)&a)[1])

// Inline assembly for signed multiply-accumulate: sum += a * b
__inline __int64 mlal(__int64 sum, int a, int b) {
    __asm {
        SMLAL lo64(sum), hi64(sum), a, b
    }
    return sum;
}

// Input arrays
int a[10] = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 };
int b[10] = {10, 9, 8, 7, 6, 5, 4, 3, 2, 1 };

int main(void)
{
    __int64 sum = 0;
    int i;

    SER_Init();  // Initialize USART for printf output

    for (i = 0; i < 10; i++) {
        sum = mlal(sum, a[i], b[i]);  // Perform MAC
    }

    printf("MAC Result = %lld\n", sum);  // Output result to USART

    while (1);  // Loop forever
}
