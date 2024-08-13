data segment
    n1 db 82h        ; The number to be analyzed (82h = 10000010b)
    ones db ? ; Variable to store the count of 1s
    zeros db ? ; Variable to store the count of 0s
data ends

code segment
    assume cs:code, ds:data
main:
    mov ax, data     ; Load the address of the data segment
    mov ds, ax       ; Set DS to point to our data segment

    mov cx, 08h      ; Set counter to 8 (number of bits in a byte)
    mov al, n1       ; Load the number to be analyzed into AL
    mov bl, 00h      ; Initialize BL to 0 (will count zeros)
    mov dl, 00h      ; Initialize DL to 0 (will count ones)

back:
    shr al, 01       ; Shift right AL by 1 bit, lowest bit goes into Carry Flag
    jc l1            ; If Carry Flag is set (bit was 1), jump to l1
    inc bl           ; If we're here, bit was 0, so increment zero counter
    jmp next         ; Jump to next iteration
l1:
    inc dl           ; If we're here, bit was 1, so increment one counter
next:
    loop back        ; Decrement CX and jump to 'back' if CX is not zero

    mov ones, dl     ; Store the count of 1s
    mov zeros, bl    ; Store the count of 0s

    mov ah, 4ch      ; Prepare to exit program
    int 21h          ; Call DOS interrupt to exit
code ends
end main