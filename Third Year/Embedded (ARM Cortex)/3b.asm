        AREA PROG4, CODE, READONLY     ; Define code section
        ENTRY
        EXPORT START                   ; Make START visible to the linker

START
        LDR     R0, =0xF631024C        ; Load value into R0
        LDR     R1, =0x17539ABD        ; Load value into R1

        ; XOR-based swap
        EOR     R0, R0, R1             ; Step 1: R0 = R0 ^ R1
        EOR     R1, R0, R1             ; Step 2: R1 = R0 ^ R1 → now R1 has original R0
        EOR     R0, R0, R1             ; Step 3: R0 = R0 ^ R1 → now R0 has original R1

STOP
        B       STOP                   ; Infinite loop to end program

        END                            ; End of code
