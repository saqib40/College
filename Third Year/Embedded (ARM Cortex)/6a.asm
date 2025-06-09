        AREA MYDATA, DATA, READONLY
NUMBER  DCD 0x0000008F           ; The 32-bit number to check

        AREA RESULT, DATA, READWRITE
ONES    DCD 0                    ; Memory to store count of 1s
ZEROS   DCD 0                    ; Memory to store count of 0s

        AREA MYCODE, CODE, READONLY
        ENTRY
        EXPORT START

START
        LDR R0, =NUMBER          ; Load address of the number
        LDR R1, [R0]             ; Load the 32-bit number into R1

        MOV R2, #0               ; R2 = counter for 1s
        MOV R3, #0               ; R3 = counter for 0s
        MOV R4, #32              ; 32 bits to check

CHECK_BIT
        TST R1, #1               ; Test the last bit
        BEQ COUNT_ZERO
        ADD R2, R2, #1           ; If bit is 1, increment ones count
        B NEXT

COUNT_ZERO
        ADD R3, R3, #1           ; If bit is 0, increment zeros count

NEXT
        LSR R1, R1, #1           ; Shift right to check next bit
        SUBS R4, R4, #1          ; Decrease bit count
        BNE CHECK_BIT            ; Repeat until all bits are checked

        LDR R0, =ONES
        STR R2, [R0]             ; Store 1s count in memory

        LDR R0, =ZEROS
        STR R3, [R0]             ; Store 0s count in memory

STOP
        B STOP                   ; Infinite loop to stop

        END
