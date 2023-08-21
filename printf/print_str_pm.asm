[bits 32]

VIDEO_MEMORY equ 0xb8000
WHITE_ON_BLACK equ 0x0f

print_str_pm:
        pusha
        mov edx, VIDEO_MEMORY

print_str_pm_loop:
        mov al, [ebx]                   ;store character in al
        mov ah, WHITE_ON_BLACK          ; store attribute in ah

        cmp al, 0
        je print_str_pm_done

        mov [edx], ax                   ; store char and attribute in current cell
        
        add ebx, 1                      ;move to next character in string
        add edx, 2                      ;move to next cell in vid memory

        jmp print_str_pm_loop

print_str_pm_done:
        popa
        ret