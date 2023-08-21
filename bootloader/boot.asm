org 0x7c00

KERNEL_OFFSET equ 0x1000                ; kernel loaded at this address

mov [BOOT_DRIVE], dl

mov bp, 0x9000
mov sp, bp

mov bx, MSG_REAL_MODE
call print_str

call load_kernel

call pm_switch

jmp $

%include "print_hex.asm"
%include "disk_load.asm"
%include "pm_switch.asm"
%include "gdt.asm"
%include "print_str_pm.asm"

[bits 16]

load_kernel:
        mov bx, MSG_LOAD_KERNEL
        call print_str

        mov bx, KERNEL_OFFSET
        mov dh, 1
        mov dl, [BOOT_DRIVE]
        call disk_load
        ret
[bits 32]

BOOT_DRIVE: db 0
MSG_REAL_MODE: db "Booting in real mode. ",0
MSG_LOAD_KERNEL: db "Loading kernel into memory ",0

times 510 - ($ - $$) db 0
dw 0xaa55