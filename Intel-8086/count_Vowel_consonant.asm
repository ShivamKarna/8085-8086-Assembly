.model small
.stack 100h
.data
    prompt db "Enter a string: $"
    v_msg  db 0dh, 0ah, "Vowels: $"
    c_msg  db 0dh, 0ah, "Consonants: $"
    buffer db 100, ?, 100 dup('$')
    v_count dw 0
    c_count dw 0

.code
main proc
    mov ax, @data
    mov ds, ax

    ; 1. Print Prompt
    mov dx, offset prompt
    mov ah, 09h
    int 21h

    ; 2. Read String
    mov dx, offset buffer
    mov ah, 0ah
    int 21h

    ; 3. Count Vowels and Consonants
    lea si, buffer + 2
    mov cl, [buffer + 1]
    mov ch, 0
    jcxz display_results

analyze:
    mov al, [si]
    
    ; Convert to uppercase temporarily to simplify checks
    cmp al, 'a'
    jl check_vowel
    cmp al, 'z'
    jg next_char
    and al, 0dfh     ; Force uppercase

check_vowel:
    ; Check if it's actually a letter
    cmp al, 'A'
    jl next_char
    cmp al, 'Z'
    jg next_char

    ; Is it a Vowel?
    cmp al, 'A'
    je is_vowel
    cmp al, 'E'
    je is_vowel
    cmp al, 'I'
    je is_vowel
    cmp al, 'O'
    je is_vowel
    cmp al, 'U'
    je is_vowel

    inc c_count      ; It's a consonant
    jmp next_char

is_vowel:
    inc v_count

next_char:
    inc si
    loop analyze

    ; 4. Display Results with Colors
display_results:
    ; Print "Vowels: "
    mov dx, offset v_msg
    mov ah, 09h
    int 21h
    
    mov ax, v_count
    call print_colored_num

    ; Print "Consonants: "
    mov dx, offset c_msg
    mov ah, 09h
    int 21h
    
    mov ax, c_count
    call print_colored_num

    ; Exit
    mov ax, 4c00h
    int 21h
main endp

; --- Procedure to print AX in Blue on Green ---
print_colored_num proc
    add al, '0'      ; Convert single digit count to ASCII
    mov bl, 21h      ; Attribute: 2 (Green Back), 1 (Blue Text)
    mov ah, 09h      ; BIOS: Write character and attribute
    mov bh, 0        ; Page 0
    mov cx, 1        ; Repeat 1 time
    int 10h          ; Call BIOS video interrupt
    
    ; Advance cursor manually so next print doesn't overwrite
    mov ah, 03h      ; Get cursor position
    int 10h
    inc dl           ; Move column right
    mov ah, 02h      ; Set cursor position
    int 10h
    ret
print_colored_num endp

end main