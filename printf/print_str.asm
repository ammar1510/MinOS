jmp print_str
%include "printf.asm"
; prints string pointed at by bx
print_str:
    pusha
process:
   mov al, [bx]
    cmp al, 0
    jne nxt
    
popa
ret

nxt:
    call printf
    inc bx
    jmp process