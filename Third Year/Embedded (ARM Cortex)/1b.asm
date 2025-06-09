        AREA PROGI, CODE, READONLY   ; Define a code section named PROGI
        ENTRY                        ; Mark the program's entry point
        EXPORT START                 ; Make START label visible to the linker

START
        LDR     R0, =10              ; Load immediate value 10 into R0
        LDR     R1, =20              ; Load immediate value 20 into R1
        ADD     R2, R0, R1           ; Add R0 and R1, store result in R2

STOP    
        B       STOP                 ; Infinite loop to end the program

        END                          ; Mark the end of file for assembler
