DATA SEGMENT
    ORG 1000H
    ASCII DB 48,49,50,51,52,53,54,55,56,57  ; ASCII codes for digits 0-9
    ORG 2000H
    BCD DB 10 DUP(?)  ; Array to store the converted decimal values
DATA ENDS

CODE SEGMENT
    ASSUME CS:CODE, DS:DATA
START:
    MOV AX, DATA      ; Load the address of the DATA segment into AX
    MOV DS, AX        ; Set DS to point to our data segment

    MOV SI, OFFSET ASCII  ; SI points to the start of ASCII array
    MOV DI, OFFSET BCD    ; DI points to the start of BCD array
    MOV CL, 0AH           ; Counter set to 10 (number of digits to convert)

L1: CALL ATOB             ; Call the ASCII to BCD conversion procedure
    DEC CL                ; Decrement counter
    JNZ L1                ; If counter is not zero, continue loop

    INT 03H               ; Breakpoint interrupt (for debugging)

ATOB PROC
    MOV AL, [SI]          ; Load ASCII character into AL
    SUB AL, 30H           ; Subtract 30H (48 decimal) to convert ASCII to decimal
    MOV [DI], AL          ; Store the result in BCD array
    INC SI                ; Move to next ASCII character
    INC DI                ; Move to next BCD array position
    RET                   ; Return from procedure
ATOB ENDP

CODE ENDS
END START