#include "stm32F4xx_hal.h"   // HAL driver for STM32F4
#include "Board_LED.h"       // LED control functions

int main(void)
{
    const unsigned int off_code = 0x0000;  // Binary pattern: all LEDs OFF
    const unsigned int on_code  = 0x00FF;  // Binary pattern: turn ON first 8 LEDs (or LED0 if only 1 is present)
    unsigned int i;

    HAL_Init();              // Optional: Initializes HAL system (good practice)
    LED_Initialize();        // Initialize GPIO for LEDs

    while (1)                // Infinite loop
    {
        // Turn ON LEDs with delay
        for (i = 0; i < 30000; i++) {
            LED_SetOut(on_code);   // Turns on LEDs based on 'on_code'
        }

        // Turn OFF LEDs with delay
        for (i = 0; i < 30000; i++) {
            LED_SetOut(off_code);  // Turns off LEDs based on 'off_code'
        }
    }
}
