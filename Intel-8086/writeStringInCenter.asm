.model small 
.stack 100h
.data 
haha db '...Writing String in Center...','$'
.code 
main proc 
mov ax, @data 
mov ds, ax
 
mov ah , 02h 
mov bh,00h
mov dh, 0ch 
mov dl, 32h
int 10h  ; bios interrupt

mov ah , 09h 
lea dx, haha
int 21h

mov ah ,4ch 
main endp
end main
