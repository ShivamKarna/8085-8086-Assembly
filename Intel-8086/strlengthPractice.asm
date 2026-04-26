.model small   
.stack 100h 
.data
str db 100 dup('$')
.code 
main proc
mov ax, @data
mov ds, ax

mov cl, 00h
mov si, offset str

back : mov ah , 01h
          int 21h
          cmp al , 13
          je done
          mov [si], al
          inc si 
          inc cl
          jmp back
done : mov al , cl
           aam 

           add ah , 30h 
           add al ,30h

           mov dl, ah 
           mov ah, 02h 
           int 21h

           mov dl, al
           mov ah, 02h 
           int 21h
       

            mov ah, 4ch 
            int 21h
            main endp 
            end main
