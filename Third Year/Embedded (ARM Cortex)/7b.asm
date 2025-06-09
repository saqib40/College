        AREA SRC, DATA, READONLY        ; Source data section
SRC     DCD 0x0000008F, 0x00000012, 0x00000024, 0x00000023, 0x00000011

        AREA DST, DATA, READWRITE       ; Destination section
DST     DCD 0                           ; Space to store result

        LEN     EQU 5                   ; Number of elements

        AREA PROGRAM, CODE, READONLY
        ENTRY
        EXPORT START

START
        LDR     R6, =LEN                ; R6 = total elements
        LDR     R0, =SRC                ; R0 points to source array
        SUB     R6, R6, #1              ; R6 = number of comparisons
        LDR     R7, [R0], #4            ; R7 = first element (initial max/min)

TOP
        LDR     R8, [R0], #4            ; R8 = next element
        CMP     R8, R7
        MOVGE   R7, R8                  ; For Largest
        ; MOVLE R7, R8                 ; Use this instead for Smallest

        SUB     R6, R6, #1
        CMP     R6, #0
        BNE     TOP

        LDR     R0, =DST
        STR     R7, [R0]                ; Store result at DST

STOP
        B       STOP                    ; Infinite loop

        END
