        AREA PGM, CODE, READONLY
        ENTRY
        EXPORT START

START
        ; Enable access to the VFP
        LDR     R0, =0xE000ED88        ; CPACR register address
        LDR     R1, [R0]               ; Load current CPACR value
        ORR     R1, R1, #(0xF << 20)   ; Enable full access to CP10 and CP11
        STR     R1, [R0]               ; Store it back

        ; Dummy delay to let VFP enable (in real systems, a barrier instruction is used)

        ; Load some floating point constants (IEEE 754)
        ; 10.5 (0x41280000), 2.5 (0x40200000)
        VMOV.F32 S7, #10.5             ; S7 = 10.5
        VMOV.F32 S8, #2.5              ; S8 = 2.5
        VMOV.F32 S9, #2.5              ; S9 = 2.5

        ; Floating point operations
        VADD.F32 S10, S8, S9           ; S10 = S8 + S9 = 5.0
        VMUL.F32 S11, S8, S7           ; S11 = S8 * S7 = 2.5 * 10.5 = 26.25
        VSUB.F32 S12, S11, S10         ; S12 = S11 - S10 = 21.25
        VNEG.F32 S13, S12              ; S13 = -S12 = -21.25
        VABS.F32 S14, S13              ; S14 = |S13| = 21.25
        VDIV.F32 S15, S11, S10         ; S15 = S11 / S10 = 26.25 / 5 = 5.25
        VMLA.F32 S11, S8, S9           ; S11 = S11 + (S8 * S9) = 26.25 + (2.5*2.5) = 26.25 + 6.25 = 32.5

LOOP    
        B LOOP                         ; Infinite loop (program end)

        END
