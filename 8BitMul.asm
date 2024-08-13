; for signed MUL => IMUL
data segment
    n1 db 0ffh   ; First 8-bit number (255 in decimal, maximum value for an 8-bit unsigned number)
    n2 db 0fh    ; Second 8-bit number (15 in decimal)
    result dw ?  ; Variable to store the 16-bit result (word)
data ends
code segment
    assume cs:code, ds:data
main:
    mov ax, data  ; Move the starting address of the data segment into AX
    mov ds, ax    ; Initialize DS with the address in AX
    mov al, n1    ; Load the first number into AL (low byte of AX)
    mov bl, n2    ; Load the second number into BL (low byte of BX)

    mul bl        ; Unsigned multiply AL by BL, result is in AX (AL * BL)

    mov result, ax ; Store the 16-bit result in the variable 'result'
    mov ah, 4ch   ; DOS function to terminate the program
    int 21h       ; Call DOS interrupt to terminate the program
code ends
end main
