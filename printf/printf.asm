;header file to print in teletype mode
; prints character at al
printf:
    pusha
    mov ah, 0x0e
    int 0x10
    popa
    ret

