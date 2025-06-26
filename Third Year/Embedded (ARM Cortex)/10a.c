// C Program for Blinking of an LED on and off without delay.

#include "stm32F4xx_hal.h"    // Include the main HAL (Hardware Abstraction Layer) header for STM32F4
#include "Board_LED.h"        // Include board-specific LED function definitions

int main(void)
{
    const unsigned int num = 0;  // 'num' is the LED number (usually LED0 on development boards)

    LED_Initialize();            // Initialize the LED GPIO pin (sets the pin mode, etc.)

    while (1)                    // Infinite loop
    {
        LED_On(num);            // Turn ON the LED
        LED_Off(num);           // Immediately turn OFF the LED (no delay in between)
    }
}
