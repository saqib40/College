; Logic
; It uses the "Double Dabble" algorithm, 
; which involves shifting the binary number left and adding 3 
; to any BCD digit that becomes 5 or greater
; The process is repeated for all 16 bits of the binary number

DATA SEGMENT
    BIN_NUM DW 010011010010B  ; Binary number to convert (1234 in decimal)
    BCD_NUM DW ?              ; Variable to store the BCD result
DATA ENDS
CODE SEGMENT
    ASSUME CS:CODE, DS:DATA
START:
    MOV AX, DATA
    MOV DS, AX        ; Initialize DS to point to the data segment

    MOV AX, BIN_NUM   ; Load the binary number into AX
    MOV BX, 0         ; Initialize BX to 0 (will hold the BCD result)
    MOV CX, 16        ; Set counter to 16 (number of bits to process)

CONVERT_LOOP:
    SHL AX, 1         ; Shift left binary number, MSB goes into CF
    MOV DI, 4         ; Set digit counter to 4 (4 BCD digits)

ADJUST_LOOP:
    MOV DL, BH        ; Get the high byte of BCD result
    SHR DL, 4         ; Shift right to get the upper digit
    CMP DL, 5         ; Compare with 5
    JB NEXT_DIGIT     ; If less than 5, move to next digit
    ADD BH, 30H       ; If 5 or more, add 3 to convert to BCD

NEXT_DIGIT:
    ROL BX, 4         ; Rotate BCD result left by 4 bits
    DEC DI            ; Decrement digit counter
    JNZ ADJUST_LOOP   ; If not zero, continue adjusting

    ADC BL, 0         ; Add carry to the least significant bit of BCD
    LOOP CONVERT_LOOP ; Repeat for all 16 bits

    MOV BCD_NUM, BX   ; Store the final BCD result

    MOV AH, 4CH       ; DOS function: Exit program
    INT 21H           ; Call DOS interrupt to exit program

CODE ENDS
END START