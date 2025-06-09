        AREA DATA1, DATA, READONLY
ARRAY   DCD 0x08F, 0x012, 0x55, 0x03, 0x088   ; Array of 5 elements

        AREA DATA2, DATA, READONLY
KEY     DCD 0x088                             ; The key to search

        AREA PROGRAM, CODE, READONLY
        ENTRY
        EXPORT START

LEN     EQU 5                                 ; Number of elements

START
        LDR     R1, =ARRAY                    ; R1 points to the array
        LDR     R2, =KEY                      ; R2 points to the key
        LDR     R3, [R2]                      ; R3 = value of KEY
        MOV     R4, #LEN                      ; R4 = loop counter

LOOP
        LDR     R5, [R1]                      ; Load current array element
        CMP     R3, R5                        ; Compare with KEY
        BEQ     FOUND                         ; If match, go to FOUND
        ADD     R1, R1, #4                    ; Move to next element
        SUBS    R4, R4, #1                    ; Decrement counter
        BNE     LOOP                          ; Loop if not zero

        ; Not found
        MOV     R0, #0                        ; Set R0 = 0 if not found
        B       STOP

FOUND
        MVN     R0, #0                        ; Set R0 = 0xFFFFFFFF

STOP
        B       STOP                          ; Infinite loop

        END
