ASSUME CS:CODE, DS:DATA     ; Tell the assembler where the Code and Data segments are

DATA SEGMENT
    ORG 1000H               ; Set the starting address of the data segment to 1000H
    NUM DB " "              ; Reserve a byte for the number to be checked
    DISPLAY1 DB "POSITIVE NUMBER $"  ; String to display for positive numbers
    DISPLAY2 DB "NEGATIVE NUMBER $"  ; String to display for negative numbers
DATA ENDS

CODE SEGMENT
    ORG 2000H               ; Set the starting address of the code segment to 2000H
START:
    MOV AX, DATA            ; Move the address of the DATA segment into AX
    MOV DS, AX              ; Set DS to point to our data segment

    MOV AL, NUM             ; Move the byte at NUM directly into AL
    SHL AL, 1               ; Shift AL left by 1 bit. This moves the sign bit into the Carry Flag (CF)
    MOV DX, OFFSET DISPLAY1 ; Assume positive, load address of DISPLAY1
    JNC DISPLAY             ; If Carry Flag is not set (number was positive or zero), jump to DISPLAY
    MOV DX, OFFSET DISPLAY2 ; If we're here, number is negative. Load address of DISPLAY2

DISPLAY:
    MOV AH, 09H             ; Prepare to call DOS function to print string
    INT 21H                 ; Call DOS interrupt to print the string

    MOV AH, 4CH             ; Prepare to call DOS function to end program
    INT 21H                 ; Call DOS interrupt to end program

CODE ENDS
END START                   ; End of code, specify the entry point