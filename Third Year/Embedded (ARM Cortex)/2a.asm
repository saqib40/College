;Transfer data from one memory location to another using various addressing modes.
;

        AREA DATATRANSFER, CODE, READONLY
        ENTRY
        EXPORT START

START
        LDR     R0, =0x20000000      ; R0 points to source address
        LDR     R1, =0x20000020      ; R1 points to destination address
        MOV     R2, #5               ; R2 is the loop counter (copy 5 bytes)

LOOP
        LDRB    R3, [R0], #1         ; Load byte from [R0], then increment R0 (Post-indexed)
        STRB    R3, [R1, #0]!        ; Store byte at [R1], using pre-indexed mode
        ADD     R1, R1, #1           ; Move R1 to next destination byte
        SUBS    R2, R2, #1           ; Decrease loop counter
        BNE     LOOP                 ; Repeat if not zero

STOP
        B       STOP                 ; Infinite loop (end of program)

        END
