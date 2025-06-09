#include "stm32F4xx_hal.h"   // HAL driver header for STM32F4
#include "Board_LED.h"       // Board support for LED control

int main(void)
{
    const unsigned int num = 0;    // LED number (e.g., LED0)
    unsigned int i;

    HAL_Init();                    // Initialize the Hardware Abstraction Layer
    LED_Initialize();              // Initialize GPIO for LEDs

    while (1)                      // Infinite loop
    {
        LED_On(num);              // Turn ON the LED

        // Simple software delay
        for (i = 0; i < 50000; i++);

        LED_Off(num);             // Turn OFF the LED

        // Another software delay
        for (i = 0; i < 50000; i++);
    }
}
