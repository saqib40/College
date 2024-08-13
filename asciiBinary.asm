; Didn't understood it much but koi nahi
DATA SEGMENT
A DB 41H
DATA ENDS
CODE SEGMENT
MAIN:
    ASSUME CS:CODE, DS:DATA
    MOV AX, DATA    ; Load the address of the data segment into AX
    MOV DS, AX      ; Set DS to point to the data segment

    MOV AL, A       ; Load the value of A into AL
    MOV CL, 08H     ; Set counter CL to 8 (number of bits in a byte)
    MOV AH, 00H     ; Clear AH, as it's not needed for now

UP:
    SHL AL, 01H     ; Shift AL left by 1 bit (i.e., perform a bitwise left shift)
    MOV BL, AL      ; Copy AL to BL (BL will be used to get the bit shifted out)
    MOV AL, 00H     ; Clear AL (AL is prepared for the ADC operation)
    ADC AL, 30H     ; Add with carry the ASCII code for '0' (48 decimal) to AL
    MOV DL, AL      ; Move the result to DL (for printing)
    MOV AH, 02H     ; DOS function 2 - Print character in DL
    INT 21H         ; Call DOS interrupt to print the character

    MOV AL, BL      ; Restore the shifted value from BL to AL
    DEC CL          ; Decrement CL (counter for the number of bits processed)
    JNZ UP          ; If CL is not zero, jump to UP (loop until all bits are processed)

    MOV AH, 4CH     ; DOS function 4Ch - Terminate the program
    INT 21H         ; Call DOS interrupt to exit
CODE ENDS
END MAIN
