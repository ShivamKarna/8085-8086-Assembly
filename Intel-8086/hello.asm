.model small
.stack 100h
.data
    msg db 'Hello Shivam! Welcome to 8086 code on Arch.', 0Dh, 0Ah, '$'

.code
main proc
    mov ax, @data        ; Initialize data segment
    mov ds, ax

    lea dx, msg          ; Load address of message
    mov ah, 09h          ; DOS function to display string
    int 21h

    mov ah, 4Ch          ; DOS function to exit
    int 21h
main endp
end main
