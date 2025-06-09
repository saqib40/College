        AREA PROG2, CODE, READONLY    ; Define code section
        ENTRY                         ; Entry point of the program
        EXPORT START                  ; Make START visible to linker

START
        LDR     R0, =10               ; R0 holds the upper limit: 10
        MOV     R1, #0                ; R1 is the accumulator: stores sum
        MOV     R2, #1                ; R2 is the counter: starts at 1

LOOP
        ADD     R1, R1, R2            ; R1 = R1 + R2 (add current number to sum)
        ADD     R2, R2, #1            ; Increment R2 (counter = counter + 1)
        CMP     R2, R0                ; Compare counter with 10
        BLE     LOOP                  ; If counter <= 10, continue looping

STOP
        B       STOP                  ; Infinite loop (to stop the program)

        END                           ; End of the code
