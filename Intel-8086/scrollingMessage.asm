.MODEL SMALL
.STACK 100H
.DATA
    MSG DB "I AM SCROLLING... AND ITS FUN$"
    COL DB 79                   ; Start at the far right column

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; --- Set Video Mode 03h (80x25 Text) ---
    MOV AX, 0003H
    INT 10H

AGAIN:
    ; 1. CLEAR THE PREVIOUS FRAME
    ; If we don't clear, the text leaves a "trail" across the screen.
    MOV AX, 0600H               ; AH=06 (Scroll), AL=00 (Clear Window)
    MOV BH, 07H                 ; Attribute: Light Gray on Black
    MOV CX, 0000H               ; Top Left (0,0)
    MOV DX, 184FH               ; Bottom Right (24,79)
    INT 10H

    ; 2. SET CURSOR POSITION
    MOV AH, 02H                 ; Function to set cursor
    MOV BH, 00H                 ; Page 0
    MOV DH, 12                  ; Row 12 (Middle of screen)
    MOV DL, COL                 ; Current Column
    INT 10H

    ; 3. DISPLAY THE MESSAGE
    MOV AH, 09H
    LEA DX, MSG
    INT 21H

    ; 4. THE DELAY (Crucial for visibility)
    ; Without this, it moves too fast for the human eye.
    MOV CX, 0A00H               ; Outer loop counter
D1:
    MOV BX, 01FFH               ; Inner loop counter
D2:
    DEC BX
    JNZ D2
    LOOP D1

    ; 5. UPDATE POSITION
    DEC COL                     ; Move one column to the left
    JS RESET_COL                ; If Column becomes negative, reset it
    JMP AGAIN                   ; Otherwise, draw the next frame

RESET_COL:
    MOV COL, 79                 ; Wrap back to the right side
    JMP AGAIN

    ; 6. EXIT (Press Ctrl+C to stop, or add a key-check)
    MOV AX, 4C00H
    INT 21H
MAIN ENDP
END MAIN