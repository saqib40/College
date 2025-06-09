        AREA PROG, CODE, READONLY
        ENTRY
        EXPORT START

START
        ; ---- Case 1: Too large negative number ----
        LDR     R1, =0xFFFF8000         ; Very large (signed negative) number
        USAT    R2, #16, R1             ; Saturate to 16 bits max (0xFFFF)
        MRS     R0, APSR                ; Copy flags
        BIC     R0, R0, #(1 << 27)      ; Clear Q flag (bit 27)
        MSR     APSR_nzcvq, R0          ; Write back cleared flags

        ; ---- Case 2: Number larger than 16-bit max ----
        LDR     R1, =0x00030000         ; Larger than 0xFFFF
        USAT    R3, #16, R1             ; Saturate to 0xFFFF
        MRS     R0, APSR
        BIC     R0, R0, #(1 << 27)
        MSR     APSR_nzcvq, R0

        ; ---- Case 3: Within 16-bit range ----
        LDR     R1, =0x00001234         ; Small value
        USAT    R4, #16, R1             ; No saturation needed
        MRS     R0, APSR
        BIC     R0, R0, #(1 << 27)
        MSR     APSR_nzcvq, R0

STOP    
        B       STOP                    ; Infinite loop to stop

        END
