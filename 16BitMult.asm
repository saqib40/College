; For unsigned IMUL => MUL
DATA SEGMENT
    n1 DW 1234h       ; First signed 16-bit number (4660 in decimal)
    n2 DW ff40h       ; Second signed 16-bit number (-192 in decimal, two's complement)
    result DW 2 DUP(?) ; 32-bit space to store the result
DATA ENDS

CODE SEGMENT
    ASSUME CS:CODE, DS:DATA
START:
    MOV AX, DATA
    MOV DS, AX        ; Set up data segment

    MOV AX, n1        ; Load first number into AX
    MOV BX, n2        ; Load second number into BX
    IMUL BX           ; Signed multiply AX by BX, result in DX:AX

    MOV result, AX    ; Store lower 16 bits of result
    MOV result+2, DX  ; Store upper 16 bits of result

    MOV AH, 4Ch       ; DOS exit function
    INT 21h           ; DOS interrupt
CODE ENDS
END START