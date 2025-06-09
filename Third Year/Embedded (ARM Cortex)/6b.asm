        AREA PROG2, CODE, READONLY
        ENTRY
        EXPORT START

START
        LDR     R0, =-11            ; Load the number into R0

        TST     R0, #0x80000000     ; Test if the sign bit (bit 31) is set
        BEQ     POSITIVE            ; If not set, number is positive
        B       NEGATIVE            ; Else, number is negative

POSITIVE
        MOV     R3, #0x00           ; R3 = 0x00 means positive
        B       STOP

NEGATIVE
        MOV     R3, #0xFF           ; R3 = 0xFF means negative

STOP
        B       STOP                ; Infinite loop to end program

        END
