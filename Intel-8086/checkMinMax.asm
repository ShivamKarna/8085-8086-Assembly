.MODEL SMALL
.STACK 100H
.DATA
    ARR   DB 5, 2, 8, 1, 9, 4
    LEN   DW 6
    M_HIGH  DB 'Largest: ', '$'
    M_LOW  DB 0DH, 0AH, 'Smallest: ', '$'

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    LEA SI, ARR
    MOV CX, LEN
    
    MOV AL, [SI]    ; AL = Current Max
    MOV AH, [SI]    ; AH = Current Min

SCAN:
    MOV BL, [SI]
    
    ; Check for Max
    CMP BL, AL
    JNA NOT_MAX     ; JNA: Jump if Not Above
    MOV AL, BL
    JMP DONE_ITER   ; If we found a new Max, it can't be a Min

NOT_MAX:
    ; Check for Min
    CMP BL, AH
    JNB DONE_ITER   ; JNB: Jump if Not Below
    MOV AH, BL

DONE_ITER:
    INC SI
    LOOP SCAN

    ; --- Display ---
    MOV BL, AL      ; Keep Max in BL
    MOV BH, AH      ; Keep Min in BH

    ; Print Max
    MOV DX, OFFSET M_HIGH
    MOV AH, 09H
    INT 21H
    MOV DL, BL
    ADD DL, '0'
    MOV AH, 02H
    INT 21H

    ; Print Min
    MOV DX, OFFSET M_LOW
    MOV AH, 09H
    INT 21H
    MOV DL, BH
    ADD DL, '0'
    MOV AH, 02H
    INT 21H

    MOV AX, 4C00H
    INT 21H
MAIN ENDP
END MAIN