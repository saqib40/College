DATA SEGMENT
    MSGS DB "WELCOME$"   ; The original string to be reversed, ending with '$'
    LEN EQU ($-MSGS)     ; Calculate the length of the string (excluding the '$')
    MSGR DB 25 DUP(?)    ; Reserve 25 bytes for the reversed string
DATA ENDS
CODE SEGMENT
   ASSUME CS:CODE, DS:DATA
MAIN:
    MOV AX, DATA       ; Load the address of the data segment into AX
    MOV DS, AX         ; Set DS to point to the data segment
    MOV ES, AX         ; Set ES to point to the data segment (for string manipulation)
    MOV SI, OFFSET MSGS  ; Load the offset of the source string (MSGS) into SI
    MOV DI, OFFSET MSGR  ; Load the offset of the destination string (MSGR) into DI
    MOV CX, LEN-1      ; Set CX to the length of the string minus 1 (excluding the '$')
    ADD DI, LEN-2      ; Move DI to the last character position in MSGR (right before the terminator)
    CLD                ; Clear the direction flag (ensure forward string operation)
REVERSE: 
    MOVSB                 ; Move a byte from [SI] to [DI], then increment SI and DI
    DEC DI                ; Move DI back by 1 (to overwrite the previous character position)
    DEC DI                ; Move DI back by another 1 (to reverse the string)
    LOOP REVERSE          ; Decrement CX and repeat the loop if CX is not zero
    
    MOV BYTE PTR[DI+LEN],'$'  ; Add the '$' terminator at the end of the reversed string
    MOV DX, OFFSET MSGR       ; Load the offset of MSGR (reversed string) into DX

    MOV AH, 09H               ; Set AH to 09H (DOS function to display a string)
    INT 21H                   ; Call DOS interrupt to display the reversed string

    MOV AH, 4CH               ; DOS function 4Ch - Terminate the program
    INT 21H                   ; Call DOS interrupt to exit the program
CODE ENDS
END MAIN
