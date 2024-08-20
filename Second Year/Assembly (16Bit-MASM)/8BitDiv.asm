; for unsigned 8 bit division
data segment
    n1 db 0ffh   ; First 8-bit number (255 in decimal, maximum value for an 8-bit unsigned number)
    n2 db 0fh    ; Second 8-bit number (15 in decimal)
    result dw ?  ; Variable to store the 16-bit result (word)
data ends
code segment
    assume cs:code, ds:data
main:
    mov ax, data
    mov ds, ax 
    mov al, n1
    xor ah, ah     ; Cleardata AH to ensure it is 0 for unsigned division, for signed cbw
    mov bl, n2
    div bl ; for signed idiv
    mov result, ax ; AX contains quotient and AL remainder
    mov ah,4ch
    int 21h
code ends
end main