DATA SEGMENT
    NUM DB 41H  ; Variable to store the decimal number
    CO DB ?  ; Variable to store the hexadecimal result
DATA ENDS

CODE SEGMENT
    ASSUME CS:CODE,DS:DATA
START: 
    ORG 1000H
    MOV AX,DATA  ; Load the address of the DATA segment into AX
    MOV DS,AX    ; Set DS to point to the DATA segment

    MOV BL,NUM        ; Move the decimal number from NUM into BL
    ; Extract the lower 4 bits and upper 4 bits of the decimal number
    MOV AL,BL       ; Move the decimal number into AL
    AND BL,0FH      ; Mask the lower 4 bits and store them in BL
    AND AL,0F0H     ; Mask the upper 4 bits and store them in AL
    MOV CL,04H      ; Load 4 into CL (for shifting)
    SHR AL,CL       ; Shift the upper 4 bits of the decimal number to the right by 4 bits

    ; Multiply the upper 4 bits by 16 to get the hexadecimal digit
    MOV DL,10       ; Load 10 into DL (for multiplication)
    MUL DL          ; Multiply AL (upper 4 bits) by DL (10)
    ADD AL,BL       ; Add the lower 4 bits to the result

    ; Store the hexadecimal result in the CO variable
    MOV CO,AX       ; Store the hexadecimal result in CO

    INT 03H          ; Generate a software interrupt to pause the program
CODE ENDS
END START