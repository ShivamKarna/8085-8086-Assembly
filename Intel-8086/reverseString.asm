.MODEL SMALL
.STACK 100H
.DATA
    PROMPT  DB 'Enter a string: ', '$'
    MSG     DB 0DH, 0AH, 'Reversed string: ', '$'
    
    ; 1. Using the Buffer technique
    ; [Max Size, Actual Size, Data Area]
    BUFFER  DB 100, ?, 100 DUP('$')

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; --- Step 1: Get User Input ---
    MOV DX, OFFSET PROMPT
    MOV AH, 09H
    INT 21H

    MOV DX, OFFSET BUFFER
    MOV AH, 0AH
    INT 21H

    ; --- Step 2: Setup Pointers ---
    LEA SI, BUFFER + 2     ; SI points to start of input text
    
    MOV CL, [BUFFER + 1]   ; Get actual number of characters typed
    MOV CH, 0
    JCXZ EXIT              ; If length is 0, just exit

    ; To reverse "in-place" or into a new area, we need to find the END
    MOV DI, SI             ; DI also points to start
    ADD DI, CX             ; DI points to byte after last character
    DEC DI                 ; DI now points to the very last character

    ; --- Step 3: Reverse the String ---
    ; Logic: Swap the character at SI with the character at DI
    ; Stop when the pointers meet in the middle (CX / 2)
    SHR CX, 1              ; Divide length by 2 (Right shift)
    JZ  DISPLAY            ; If length was 1, no swap needed

REVERSE_LOOP:
    MOV AL, [SI]           ; Get char from front
    MOV BL, [DI]           ; Get char from back
    MOV [SI], BL           ; Put back char in front
    MOV [DI], AL           ; Put front char in back
    
    INC SI                 ; Move front pointer forward
    DEC DI                 ; Move back pointer backward
    LOOP REVERSE_LOOP

DISPLAY:
    ; --- Step 4: Display Result ---
    MOV DX, OFFSET MSG
    MOV AH, 09H
    INT 21H

    MOV DX, OFFSET BUFFER + 2
    MOV AH, 09H
    INT 21H

EXIT:
    MOV AX, 4C00H
    INT 21H
MAIN ENDP
END MAIN