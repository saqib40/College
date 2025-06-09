        AREA PROG5, CODE, READONLY   ; Define a code section
        ENTRY                        ; Entry point
        EXPORT START                 ; Make 'START' visible to linker

START
        MOV     R6, #10              ; R6 = 10 (n)
        MOV     R7, #1               ; R7 = 1 (result accumulator)

LOOP    
        CMP     R6, #0               ; Compare R6 with 0
        MULGT   R7, R6, R7           ; If R6 > 0: R7 = R6 * R7
        SUBGT   R6, R6, #1           ; If R6 > 0: R6 = R6 - 1
        BGT     LOOP                 ; If R6 > 0: go back to LOOP

STOP    
        B       STOP                 ; Infinite loop to stop execution

        END                          ; End of file
