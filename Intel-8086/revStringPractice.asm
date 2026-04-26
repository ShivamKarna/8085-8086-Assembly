.model small
.stack 100h
.data
str1 db 'hello world$'
str2 db 12 dup('$')
len dw 11

.code 
main proc
mov ax, @data
mov ds, ax

mov si, offset str1
mov di, offset str2
add di , len
dec di
mov cx, len

L1 : mov bl,[si]
      mov [di], bl
      inc si
      dec di
      loop l1

      lea dx,  str2
      mov ah, 09h
      int 21h


      mov ah,4ch
      int 21h
      main endp
      end main
