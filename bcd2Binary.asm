; Logic
; It processes each BCD digit pair (4 bits each) from right to left
; For each pair, it separates the upper and lower digits, 
; multiplies the upper digit by 10, adds both to the result, 
; and then multiplies the intermediate result by 100 for the next iteration
; The final result is stored in BIN_NUM.

DATA SEGMENT
    BCD_NUM DW 1234H  ; BCD number to convert (1234 in BCD)
    BIN_NUM DW ?      ; Variable to store the binary result
DATA ENDS

CODE SEGMENT
    ASSUME CS:CODE, DS:DATA
START:
    MOV AX, DATA
    MOV DS, AX        ; Initialize DS to point to the data segment

    MOV AX, BCD_NUM   ; Load the BCD number into AX
    MOV BX, 0         ; Initialize BX to 0 (will hold the binary result)
    MOV CX, 4         ; Set counter to 4 (number of BCD digits)

CONVERT_LOOP:
    PUSH AX           ; Save AX
    AND AL, 0FH       ; Mask to get the lower digit
    ADD BL, AL        ; Add the digit to the result
    POP AX            ; Restore AX
    
    PUSH AX           ; Save AX again
    AND AL, 0F0H      ; Mask to get the upper digit
    MOV DL, 10        ; Prepare to multiply by 10
    MUL DL            ; Multiply upper digit by 10
    ADD BL, AL        ; Add the result to BL
    ADC BH, 0         ; Add carry to BH if any
    POP AX            ; Restore AX

    MOV DL, 100       ; Prepare to multiply result by 100
    MOV AX, BX        ; Move current result to AX
    MUL DX            ; Multiply by 100
    MOV BX, AX        ; Store result back in BX

    MOV AX, BCD_NUM   ; Reload the original BCD number
    ROR AX, 4         ; Rotate right by 4 bits for next iteration

    LOOP CONVERT_LOOP ; Repeat for all 4 digits

    MOV BIN_NUM, BX   ; Store the final binary result

    MOV AH, 4CH       ; DOS function: Exit program
    INT 21H           ; Call DOS interrupt to exit program

CODE ENDS
END START