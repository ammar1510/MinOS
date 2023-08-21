[bits 16]
pm_switch:
        cli
        lgdt [gdt_descriptor]
        
        mov eax, cr0 
        or eax, 0x1            ;to switch to protected mode set the first bit of control flag
        mov cr0, eax

        jmp CODE_SEG:init_pm       ; far jump helps clear cpu buffer of real mode decoded instructions


[bits 32]

init_pm:
        mov ax, DATA_SEG
        mov ds, ax              ; in 32 bit protected mode our segment addresses are meaningless
        mov ss, ax              ; so we reset all segments to point to data selector defined in gdt
        mov es, ax
        mov gs, ax
        mov fs, ax

        mov ebp, 0x90000
        mov esp, ebp

        call BEGIN_PM    

BEGIN_PM:
        mov ebx, MSG_PM
        call print_str_pm
        call KERNEL_OFFSET
        jmp $      

MSG_PM: db "Successfully landed in 32 bit protected mode",0