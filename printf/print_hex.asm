; prints the hexadecimal value stored in dx
jmp print_hex
%include "print_str.asm"

print_hex:
    pusha
    mov cx, 4          ;we will print 4 chars

    char_loop:
        dec cx
        
        mov ax, dx
        shr dx, 4       ;removing last 4 bits for next iter
        and ax, 0xf     ;taking least 4 bits
        
        mov bx, HEX_OUT
        add bx, 2          ;skip 0x in string
        add bx, cx         ;offset to current char in string

        cmp ax, 0xa         ; compare value with min letter in hex
        jl set_letter       ; proceed to ASCII char formalities
        add al, 0x27        ;difference between 0 and a in ASCII table
        jl set_letter


    set_letter:
        add al, 0x30        ;move to ASCII values
        mov [bx], al        ; store value of al at address pointed by bx

        cmp cx, 0           ; if end of hex val
        jne char_loop

        mov bx, HEX_OUT     ;print hex string
        call print_str

        popa
        ret

    HEX_OUT:
        db "0x0000",0
    
