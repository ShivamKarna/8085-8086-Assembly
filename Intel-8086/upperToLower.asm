; Program to convert UPPERCASE to lowercase
.model small 
.stack 100h 
.data    
str db 'I AM SHIVAM$'

.code 
main proc      
mov ax, @data 
mov ds, ax 


lea si, str
; it is better to write mov  si , offset str, this takes lower memory and also has faster execution, lea are better for stack not for .data
mov cl, 11 


back : mov al , [si]
            cmp al, 20h ; 32 in decimal
            je skip 
            add al ,20h ; 32 in decimal
            mov [si], al
skip  : mov dl , [si]
          mov ah , 02h 
          int 21h 

          inc si    
          loop back 


          mov ah , 4ch 
          int 21h
          main endp 
          end main 

