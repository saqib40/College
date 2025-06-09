        AREA LIST, DATA, READONLY
LIST    DCD 0x8F, 0x12, 0x24, 0x23, 0x11   ; Array of 5 numbers

        AREA DST, DATA, READWRITE
DST     SPACE 20                          ; Space to store sorted numbers

        LEN     EQU 5                     ; Number of elements

        AREA CODE, CODE, READONLY
        ENTRY
        EXPORT START

START
        ; Copy values from LIST to DST
        LDR     R0, =LEN                 ; R0 = counter
        LDR     R1, =LIST                ; R1 = source
        LDR     R2, =DST                 ; R2 = destination

COPY
        LDR     R3, [R1]                 ; Load number from LIST
        STR     R3, [R2]                 ; Store to DST
        ADD     R1, R1, #4
        ADD     R2, R2, #4
        SUB     R0, R0, #1
        CMP     R0, #0
        BNE     COPY

; Start bubble sort on DST
        LDR     R0, =LEN                 ; Outer loop counter

OUTER
        SUB     R0, R0, #1
        CMP     R0, #0
        BEQ     DONE                     ; Finished sorting

        LDR     R1, =DST                 ; Pointer to beginning of DST
        MOV     R2, R0                   ; Inner loop count

INNER
        LDR     R3, [R1]                 ; R3 = current element
        LDR     R4, [R1, #4]             ; R4 = next element

        CMP     R3, R4
        BLE     SKIP                     ; If R3 <= R4, skip swap

        ; Swap R3 and R4
        STR     R4, [R1]
        STR     R3, [R1, #4]

SKIP
        ADD     R1, R1, #4
        SUB     R2, R2, #1
        CMP     R2, #0
        BNE     INNER

        B       OUTER

DONE
STOP    B       STOP                    ; Infinite loop to stop

        END
