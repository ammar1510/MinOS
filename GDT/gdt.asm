;Global descriptor table for 32 bit protected mode


gdt_start:

gdt_null:
        dd 0x0  
        dd 0x0

gdt_code:
        dw  0xffff
        dw 0x0
        db 0x0
        db 10011010b
        db 11001111b
        db 0x0

gdt_data:
        dw 0xffff
        dw 0x0
        db 0x0
        db 10010010b
        db 11001111b
        db 0x0
gdt_end:


gdt_descriptor:
        dw gdt_end - gdt_start - 1
        dd gdt_start

; DS to 0x10 in protected mode means 16th byte in gdt, so the data entry, values in ds are indices in gdt

CODE_SEG equ gdt_code - gdt_start
DATA_SEG equ gdt_data - gdt_start
