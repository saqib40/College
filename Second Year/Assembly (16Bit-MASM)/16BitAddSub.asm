; Program to add two 16-bit numbers using explicit segment definitions

DATA SEGMENT
    NUM1 DW 1234H  ; First 16-bit number (1234 in hexadecimal)
    NUM2 DW 5678H  ; Second 16-bit number (5678 in hexadecimal)
    RESULT DW ?    ; Variable to store the result
DATA ENDS

CODE SEGMENT
    ASSUME CS:CODE, DS:DATA
START:
    ; Initialize data segment
    MOV AX, DATA
    MOV DS, AX

    ; Load first number into AX
    MOV AX, NUM1

    ; Add second number to AX
    ADD AX, NUM2 ; ADD becomes SUB for subtraction

    ; Store result in RESULT variable
    MOV RESULT, AX

    ; Exit program
    MOV AH, 4CH
    INT 21H
CODE ENDS

END START