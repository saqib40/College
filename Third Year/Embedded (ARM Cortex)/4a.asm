        AREA DATA, DATA, READONLY
ASCII_INPUT  DCD 0x34       ; ASCII '4' = 0x34 → should give HEX 0x04
HEX_INPUT    DCD 0x0B       ; HEX 0x0B → should give ASCII 'B'

        AREA RESULTS, DATA, READWRITE
HEX_RESULT   DCD 0          ; Store result of ASCII to HEX
ASCII_RESULT DCD 0          ; Store result of HEX to ASCII

        AREA CODE, CODE, READONLY
        ENTRY
        EXPORT START

START
; ===============================
; ASCII TO HEX CONVERSION
; ===============================
        LDR     R0, =ASCII_INPUT   ; Load address of ASCII input
        LDR     R1, [R0]           ; Load actual ASCII character (e.g., '4')

        CMP     R1, #'A'           ; Check if it’s a letter
        BGE     ATOH_LETTER
        SUB     R2, R1, #'0'       ; '0' to '9': R2 = R1 - '0'
        B       STORE_HEX

ATOH_LETTER
        SUB     R2, R1, #0x37      ; 'A' to 'F': R2 = R1 - 0x37

STORE_HEX
        LDR     R3, =HEX_RESULT
        STR     R2, [R3]           ; Store the result of ASCII → HEX

; ===============================
; HEX TO ASCII CONVERSION
; ===============================
        LDR     R4, =HEX_INPUT     ; Load address of HEX input
        LDR     R5, [R4]           ; Load hex value (e.g., 0x0B)

        CMP     R5, #0x0A
        BLT     HTOA_DIGIT
        ADD     R6, R5, #0x37      ; 0x0A → 'A' = 0x41
        B       STORE_ASCII

HTOA_DIGIT
        ADD     R6, R5, #'0'       ; 0x00–0x09 → '0'–'9'

STORE_ASCII
        LDR     R7, =ASCII_RESULT
        STR     R6, [R7]           ; Store the result of HEX → ASCII

; ===============================
; END OF PROGRAM
; ===============================
STOP
        B       STOP

        END
