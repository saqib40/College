; Assembly Level Program (ALP) involving instructions for
; transferring data within the processor. 

        AREA PROG, CODE, READONLY   ; Define a code section named 'PROG'
        ENTRY                       ; Mark the entry point of the program
        EXPORT START                ; Make 'START' accessible to the linker

START
        MOV     R1, #0              ; Move immediate value 0 into R1
        MOV     R2, #5              ; Move immediate value 5 into R2
        MOV     R3, #4              ; Move immediate value 4 into R3

        MOVS    R0, R1              ; Move R1 to R0 and update flags
        MOVEQ   R0, R2              ; If zero flag is set, move R2 to R0
        MOVS    R3, #0              ; Set R3 to 0 and update flags
        MOVEQ   R0, R3              ; If zero flag is set again, move R3 to R0

        MVN     R2, R2              ; Bitwise NOT of R2, store result in R2

STOP    
        B       STOP               ; Infinite loop to end program

        END                         ; Mark the end of the file
