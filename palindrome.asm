DATA SEGMENT
    MSGS DB "MADAM$"    ; The string to be checked (change this to test other strings)
    LEN  EQU ($-MSGS)   ; Calculate the length of the string
    MSGR DB 25 DUP(?)   ; Buffer to store the reversed string
    PALINDROME_MSG DB "The string is a palindrome.$""
    NOT_PALINDROME_MSG DB "The string isn't a palindrome.$"
DATA ENDS
CODE SEGMENT
   ASSUME CS:CODE, DS:DATA
MAIN:
    MOV AX, DATA        ; Initialize the data segment
    MOV DS, AX
    MOV ES, AX

    MOV SI, OFFSET MSGS ; Load the address of the original string into SI
    MOV DI, OFFSET MSGR ; Load the address of the reversed string into DI
    MOV CX, LEN-1       ; Set CX to the length of the string minus 1 (excluding the $ terminator)
    ADD DI, LEN-2       ; Adjust DI to point to the end of the reversed string buffer
    CLD                 ; Clear direction flag (process strings from left to right)
REVERSE:
    MOVSB               ; Move byte from SI to DI (copy character from MSGS to MSGR)
    DEC DI              ; Move DI back by two positions (to reverse the string)
    DEC DI
    LOOP REVERSE        ; Repeat until the entire string is reversed

    MOV BYTE PTR [DI+LEN], '$'  ; Add the $ terminator at the end of the reversed string

    ; Now compare the original and reversed strings
    MOV SI, OFFSET MSGS ; Reload SI with the address of the original string
    MOV DI, OFFSET MSGR ; Reload DI with the address of the reversed string
    MOV CX, LEN-1       ; Set CX to the length of the string minus 1

COMPARE:
    REPE CMPSB          ; Compare bytes from SI and DI, repeat while equal
    JNE NOT_PALINDROME  ; If any mismatch is found, jump to NOT_PALINDROME

    ; If the loop completes without a mismatch, it's a palindrome
    MOV DX, OFFSET PALINDROME_MSG ; Load the address of the palindrome message
    JMP PRINT_MSG       ; Jump to the print message section

NOT_PALINDROME:
    MOV DX, OFFSET NOT_PALINDROME_MSG ; Load the address of the not palindrome message

PRINT_MSG:
    MOV AH, 09H         ; DOS function 09h - Print string
    INT 21H             ; Call DOS interrupt to print the message

    MOV AH, 4CH         ; DOS function 4Ch - Terminate program
    INT 21H             ; Call DOS interrupt to exit

CODE ENDS
END MAIN
