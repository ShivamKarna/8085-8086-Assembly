.model small
.stack 100h
.data
    msg1   db "Enter the word: $"
    msg2   db 0dh, 0ah, "Modified string: $"
    buffer db 100, ?, 100 dup('$')

.code
main proc
    ; Initialize Data Segment
    mov ax, @data
    mov ds, ax

    ; 1. Display Prompt (msg1)
    mov dx, offset msg1
    mov ah, 09h
    int 21h

    ; 2. Buffered Input
    mov dx, offset buffer
    mov ah, 0ah
    int 21h

    ; 3. Prepare for conversion
    lea si, buffer + 2    ; SI points to start of actual string
    mov cl, [buffer + 1]  ; Get number of characters entered
    mov ch, 0             ; Clear high byte of CX for loop
    jcxz done             ; If string is empty, skip to end

    ; 4. Transformation Loop
    ; We will use BX as a toggle: 0 for Lower, 1 for Upper
    xor bx, bx            

convert:
    mov al, [si]          ; Load current character
    
    ; Check if it's a letter (A-Z or a-z)
    ; (Simple version assumes user enters letters; 
    ;  otherwise it affects punctuation too)
    
    test bl, 1            ; Check if our toggle is odd/even
    jnz make_upper

; make_lower:                    ; we can skip this label
    or al, 20h            ; Set bit 5 (Force lowercase)
    jmp store

make_upper:
    and al, 0dfh          ; Clear bit 5 (Force uppercase)

store:
    mov [si], al          ; Save modified char back to memory
    inc si                ; Point to next char
    inc bl                ; Flip the toggle (even to odd, odd to even)
    loop convert          ; Decrement CX and repeat

    ; 5. Display Result
done:
    mov dx, offset msg2
    mov ah, 09h
    int 21h

    lea dx, buffer + 2    ; Print the modified string
    mov ah, 09h
    int 21h

    ; Exit Program
    mov ax, 4c00h
    int 21h
main endp
end main