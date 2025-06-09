        AREA MYCODE, CODE, READONLY  ; Define a code section
        ENTRY                        ; Define program entry point
        EXPORT START                 ; Make 'START' visible to linker

START
        LDR     R1, =0x11111111      ; Load R1 with 0x11111111 (hex)
        LDR     R2, =0x22222222      ; Load R2 with 0x22222222 (hex)

        RSB     R0, R1, R2           ; R0 = R2 - R1 (Reverse Subtract)

STOP
        B       STOP                 ; Infinite loop to stop program

        END                          ; Mark the end of file
