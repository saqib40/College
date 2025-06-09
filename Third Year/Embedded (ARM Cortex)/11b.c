// Aim: Display a message on the USART0 (Serial Terminal)

#include <stdio.h>           // For printf()
#include "stm32f10x.h"       // Device-specific header (STM32F10x series)

// Declare the USART initialization function (assumed to be defined in Serial.c)
extern void SER_Init(void);

int main(void)
{
    SER_Init();  // Initialize USART0 (serial port)

    // Display message on USART terminal (Keil's serial window)
    printf("This is Akhil\n");

    // Infinite loop to keep the program running
    while (1) {
        // Do nothing - wait here forever
    }
}
