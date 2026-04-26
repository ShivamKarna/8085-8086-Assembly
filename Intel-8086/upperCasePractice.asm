.model small 
.stack 100h
.data
str1 db 'I LOVE TYPESCRIPT$'

.code 
main proc
mov ax, @data
mov ds, ax

mov cl, 11h ; 17 in decimal
mov si, offset str1

back : mov al, [si]
          cmp al, 20h ; 32 in decimal
          je skip
          add al, 20h ; 32 in decimal
          mov [si], al
skip : mov dl , al
          mov ah, 02h 
          int 21h
          inc si
          loop back

          mov ah, 4ch 
          int 21h
          main endp
          end main