        AREA PROG, CODE, READONLY     ; Code section
        ENTRY                         ; Entry point for program
        EXPORT START                  ; Make 'START' accessible

START
        LDR     R0, =0xF631024C       ; Load 32-bit value into R0
        ROR     R1, R0, #16           ; Rotate right by 16 bits to swap upper and lower 16 bits

        LDR     R2, =0x20000000       ; Point to memory location
        STR     R1, [R2]              ; Store the swapped value in memory

STOP
        B       STOP                  ; Endless loop to stop execution

        END                           ; End of program
