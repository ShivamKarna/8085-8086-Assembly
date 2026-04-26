; Program to find length of string using 8086

.model small 
.stack 100h 
.data 
str1 db 100 dup(?)

.code 
main proc 
mov ax, @data 
mov ds, ax 

mov cl , 00h 
lea si , str1

here : mov ah, 01h 
          int 21h
          cmp al , 13 
          je done 

          mov [si], al
          inc si   
          inc cl
          jmp here

done : mov al, cl
          aam 
          mov bx, ax

          cmp bh, 0h
          je skip_tens

          add bh, 30h 
          mov dl , bh
          mov ah, 02h
          int 21h

skip_tens : add bl, 30h 
                  mov dl, bl 
                 mov ah, 02h
                 int 21h


          mov ah, 4ch
          int 21h
          main endp 
          end main


