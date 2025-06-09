        AREA PROG2, CODE, READONLY
        ENTRY
        EXPORT START

START
        LDR     R0, =11         ; Load the number into R0
        TST     R0, #1          ; Test the LSB (bit 0)
        BEQ     EVEN            ; If bit 0 is 0 → number is even

        ; If not even, it's odd
        MOV     R3, #0xFF       ; R3 = 0xFF means odd
        B       STOP

EVEN
        MOV     R3, #0x00       ; R3 = 0x00 means even

STOP
        B       STOP            ; Infinite loop

        END
