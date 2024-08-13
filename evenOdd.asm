DATA SEGMENT
    ARRAY DB 10H, 21H, 30H, 41H, 50H, 61H, 70H, 81H, 90H, 0AH  ; Input array of 10 numbers
    ARR_ODD DB 10 DUP (?)  ; Array to store odd numbers, initialized with 10 undefined bytes
    ARR_EVEN DB 10 DUP (?) ; Array to store even numbers, initialized with 10 undefined bytes
DATA ENDS

CODE SEGMENT
    ASSUME CS:CODE, DS:DATA
MAIN:
    MOV AX, DATA    ; Load the address of the DATA segment into AX
    MOV DS, AX      ; Set DS to point to our data segment

    MOV CL, 0AH     ; Initialize counter to 10 (number of elements in ARRAY)
    LEA SI, ARR_ODD ; Load effective address of ARR_ODD into SI (source index)
    LEA DI, ARR_EVEN; Load effective address of ARR_EVEN into DI (destination index)
    LEA BP, ARRAY   ; Load effective address of ARRAY into BP (base pointer)

BACK:
    MOV AL, DS:[BP] ; Get the current number from ARRAY
    TEST AL, 01H    ; Test if the number is odd (LSB = 1) or even (LSB = 0)
    JZ NEXT         ; If zero flag is set (number is even), jump to NEXT

    MOV [SI], AL    ; If odd, store the number in ARR_ODD
    INC SI          ; Increment the ARR_ODD pointer
    JMP SKIP        ; Jump to SKIP (next iteration)

NEXT:
    MOV [DI], AL    ; If even, store the number in ARR_EVEN
    INC DI          ; Increment the ARR_EVEN pointer

SKIP:
    INC BP          ; Increment ARRAY pointer to next element
    LOOP BACK       ; Decrement CX and jump to BACK if CX != 0

    MOV AH, 4CH     ; DOS function: Exit program
    INT 21H         ; Call DOS interrupt to exit program

CODE ENDS
END MAIN