; LXI H, 4000H
; MOV B, M   
; INX H
; MOV A, M
; DCR B
; NEXT: INX H
; CMP M
; JNC LOOP
; MOV A, M
; LOOP: DCR B
; JNZ NEXT 
; STA 5000H
; HLT
;
;
; LXI H, 4000H
; MOV B, M
; INX H
; MOV A, M

LXI H, 4000H   ; HL points to start of array
MOV A, M       ; load first number into A
INX H          ; point to next number
MOV B, 03H     ; let's say we have total 4 numbers, 1 already in A, 3 remaining

NEXT: 
    CMP M       ; compare A with memory
    JC SKIP     ; if A < M, skip
    MOV A, M    ; else A = M (keep max)
SKIP:
    INX H
    DCR B
    JNZ NEXT

STA 5000H      ; store max at 5000H
HLT

