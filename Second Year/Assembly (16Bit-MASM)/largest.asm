DATA SEGMENT
    ORG 1000H
    LIST DB 05H, 06H, 03H, 02H, 09H ; The array containing the numbers
DATA ENDS
CODE SEGMENT
    ASSUME CS: CODE, DS: DATA
START:
    ORG 2000H
    MOV AX, DATA           ; Load the address of the data segment into AX
    MOV DS, AX             ; Set DS to point to the data segment

    MOV CL, 04H            ; Set counter CL to 4 (number of comparisons to be made)
    MOV SI, OFFSET LIST    ; Load the address of the LIST array into SI
    MOV AL, [SI]           ; Load the first element of the array into AL

L1: CMP AL, [SI+1]         ; Compare AL (current largest) with the next element
    JNC L                  ; If AL is larger or equal, jump to label L
    XCHG AL, [SI+1]        ; Else, exchange AL with the next element (new largest)

L:  INC SI                 ; Move to the next element in the array
    DEC CL                 ; Decrement the counter
    JNZ L1                 ; If counter is not zero, repeat the loop

    MOV SI, 3000H          ; Move to the location where the result will be stored
    MOV [SI], AL           ; Store the largest number in memory at 3000H
    INT 03H                ; Trigger a software interrupt to stop the program

CODE ENDS
END START
