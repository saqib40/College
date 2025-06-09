        AREA MYCODE, CODE, READONLY       ; Define code section
        ENTRY
        EXPORT START                      ; Make START visible to linker

START
        LDR     R0, =0x00000000           ; Clear R0
        LDR     R1, =0x00000005           ; R1 = 0x05 → 0000 0101 (binary)
        LDR     R2, =0x0000000F           ; R2 = 0x0F → 0000 1111 (binary)

        AND     R0, R1, R2                ; R0 = R1 AND R2 → 0000 0101 & 0000 1111 = 0000 0101 (0x05)
        ORR     R3, R1, R2                ; R3 = R1 OR R2  → 0000 0101 | 0000 1111 = 0000 1111 (0x0F)
        EOR     R4, R1, R2                ; R4 = R1 XOR R2 → 0000 0101 ^ 0000 1111 = 0000 1010 (0x0A)

        ; BIC (Bit Clear) performs R2 AND NOT R1
        BIC     R5, R2, R1                ; R5 = R2 & (~R1) → 0000 1111 & ~(0000 0101) = 0000 1010 (0x0A)
        BIC     R7, R2, #0x0A             ; Example: R7 = R2 & ~(0x0A)

STOP
        B       STOP                      ; Infinite loop to end program

        END                               ; End of file
