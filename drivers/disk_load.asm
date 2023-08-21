;load DH sectors from disk to ES:BX
disk_load:
pusha
push dx     ;save number of sectors to be compared later

; al-> no. of sectors, dl->drive number, dh-> 0/1 side of floppy, ch-> cylinder number, cl->sector number, 

mov ah, 0x02            ;BIOS read sector function INT 0x13/0x02
mov al, dh              ;read dh sectors
mov ch, 0x00
mov cl, 0x02               ; sector after bootloader
mov dh, 0x00
int 0x13

jc disk_error

pop dx          
cmp al, dh
jne disk_error

popa
ret




disk_error:
            mov bx, DISK_ERROR_MSG
            call print_str
            jmp $


DISK_ERROR_MSG:
            db "Disk read error!!!",0xa,0

