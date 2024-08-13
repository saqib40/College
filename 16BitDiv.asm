; below code for signed
data segment
    n1 dw 0FAEBh    ; First 16-bit signed number (-1349 in decimal)
    n2 dw 1234h     ; Second 16-bit signed number (4660 in decimal)
    result dw ?     ; Variable to store the result
data ends
code segment
assume cs:code,ds:data
main:
    mov ax, data
    mov ds, ax
Quo:
    mov ax, n1      ; Load the first number into AX
    cwd            ; Convert word to double word, This instruction extends the sign of AX into DX. If AX is positive, DX will be set to 0. If AX is negative, DX will be set to FFFFh. This is necessary for signed division because idiv operates on the 32-bit value in DX:AX.
    mov bx, n2      ; Load the second number into BX
    idiv bx         ; Signed division of AX by BX
    mov result, ax  ; Store the quotient in the result
    mov ah, 4ch    ; DOS function to terminate the program
    int 21h        ; Call DOS interrupt to terminate the program
code ends
end main
