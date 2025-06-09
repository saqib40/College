        AREA ROTATESHIFT, CODE, READONLY ; Define the code section
        ENTRY                            ; Entry point for execution
        EXPORT START                     ; Make 'START' label visible to linker

START
        LDR     R0, =0xF0000001          ; Load test value into R0
                                        ; Binary: 1111 0000 .... 0000 0001

        LSLS    R1, R0, #1               ; Logical shift left by 1 → shifts bits left, fills with 0
        ASRS    R2, R0, #1               ; Arithmetic shift right by 1 → retains sign bit
        RORS    R3, R0, #1               ; Rotate right by 1 bit → MSB wraps to LSB
        MOV     R4, R0                   ; Copy original to R4
        RRX     R5, R4                   ; Rotate right with carry → shifts right, fills MSB with carry

STOP
        B       STOP                     ; Infinite loop to stop program

        END                              ; Mark end of the file
