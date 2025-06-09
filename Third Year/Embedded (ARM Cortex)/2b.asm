        AREA SWAP, CODE, READONLY     ; Define program section named SWAP
        EXPORT START
        ENTRY

NUM     EQU 8                         ; Number of bytes to exchange (2 words)

START
        LDR     R0, =0x20000000       ; R0: Address of Memory Block A
        LDR     R1, =0x2000002C       ; R1: Address of Memory Block B
        MOV     R2, #NUM              ; R2: Byte counter (8 bytes)
        MOV     R3, #0                ; R3: Offset (starts at 0)

SWAP_LOOP
        LDR     R4, [R0, R3]          ; Load word from Block A → R4
        LDR     R5, [R1, R3]          ; Load word from Block B → R5

        STR     R4, [R1, R3]          ; Store A's word to Block B
        STR     R5, [R0, R3]          ; Store B's word to Block A

        SUBS    R2, R2, #4            ; Decrease byte count by 4
        ADD     R3, R3, #4            ; Move to next word (offset += 4)

        BNE     SWAP_LOOP             ; Repeat until R2 == 0

STOP
        B       STOP                  ; End of program (infinite loop)

        END
