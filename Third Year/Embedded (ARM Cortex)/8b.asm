        AREA PROG, CODE, READONLY
        ENTRY
        EXPORT START

START
        ; ------ Case 1: Very large negative number ------
        LDR     R1, =0xFFFF7FFF         ; A very large negative number
        SSAT    R2, #16, R1             ; Saturate it to signed 16-bit range
        MRS     R0, APSR                ; Move flags to R0
        BIC     R0, R0, #(1 << 27)      ; Clear Q flag (bit 27)
        MSR     APSR_nzcvq, R0          ; Restore flags with Q cleared

        ; ------ Case 2: Number > signed 16-bit max ------
        LDR     R1, =0x00030000         ; Too big for 16-bit signed
        SSAT    R3, #16, R1             ; Saturate to 32767
        MRS     R0, APSR
        BIC     R0, R0, #(1 << 27)
        MSR     APSR_nzcvq, R0

        ; ------ Case 3: Value within signed 16-bit range ------
        LDR     R1, =0x00001234         ; Value within range
        SSAT    R4, #16, R1             ; No saturation needed
        MRS     R0, APSR
        BIC     R0, R0, #(1 << 27)
        MSR     APSR_nzcvq, R0

STOP    
        B       STOP                    ; Infinite loop

        END
