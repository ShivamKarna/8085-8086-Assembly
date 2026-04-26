; Program to reverse string
.model small 
.stack 100h 
.data 
msg db 'Here is your reversed string : $'
str1 db 'hello world'
len dw 11
str2 db 100 dup('$')

.code 
main proc 
mov ax , @data 
mov ds, ax 

lea si, str1 
lea di, str2 
add di, len
dec di

mov cx, len

back : mov al, [si]
          mov [di], al
          inc si   
          dec di 
          
          loop back
          ; Display the string after reversed
          lea dx, msg 
          mov ah , 09h 
          int 21h
          lea dx, str2
          mov ah, 09h 
          int 21h

          mov ah, 4ch
          int 21h
          main endp 
          end main