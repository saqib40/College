DATA SEGMENT
    num1 DW 1234h, 5678h      ; First 32-bit number: 56781234h
    num2 DW 0AB12h, 0CDEFh    ; Second 32-bit number: CDEFAB12h
    result DW 3 DUP(?)        ; Space for result (48 bits to handle potential overflow)
DATA ENDS

CODE SEGMENT
    ASSUME CS:CODE, DS:DATA
MAIN:
    MOV AX, DATA
    MOV DS, AX        ; Set up data segment

    MOV DX, 00h       ; Clear DX for potential overflow

    MOV AX, num1      ; Load lower 16 bits of num1
    MOV BX, num2      ; Load lower 16 bits of num2
    CLC               ; Clear carry flag
    ADD AX, BX        ; Add lower 16 bits, for subtraction ADD => SUB
    MOV result, AX    ; Store lower 16 bits of result

    MOV AX, num1+2    ; Load upper 16 bits of num1
    MOV BX, num2+2    ; Load upper 16 bits of num2
    ADC AX, BX        ; Add upper 16 bits with carry, for subtraction ADC => SBB
    MOV result+2, AX  ; Store upper 16 bits of result

    ADC DX, 00h       ; Add any final carry to DX
    MOV result+4, DX  ; Store potential overflow

    MOV AH, 4Ch       ; DOS exit function
    INT 21h           ; DOS interrupt
CODE ENDS
END MAIN