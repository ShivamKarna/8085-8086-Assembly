; Program to display given text with red fg and blue fg
; To remember ; 

; Number           Color
; 0                       Black
; 1                        Blue
; 2                        Green
; 4                        Red
; Shortcut to remember : 0124 - B B G R

.model small
.stack 100h
.data
msg db 'I Love Programming$'
.code 
main proc
mov ax, @data
mov ds, ax

mov si, offset msg
mov dl, 10h

back : mov al, [si]
          cmp al , '$'
          je last
          ; first set cursor
          mov ah, 02h
          mov bh, 00h
          mov dh, 10h
          int 10h

          ; then write in screen
          mov ah, 09h
          mov bh, 00h
          mov bl, 14h ; this is red text with blue bg
          ; mov bl, 02h ; this is green text with black bg
          mov cx, 01h
          int 10h

          inc si
          inc dl
          jmp back




last : mov ah, 4ch 
         int 21h
         main endp
         end main