; PYQ
; wap to copy 10 bytes from memory location C050H to C090H. If the byte is greater than 50H, then set d5 else reset d6
LXI H, C050H ; SRC
LXI D, C090H ; DEST 

SUB A ; MAKE A ZERO 
MVI C, 0AH ; COUNT 

BACK : MOV A, M 
           MOV B, A  ; SAVE FOR LATER USE
           CPI 50H 
           JNC GREATER_50
           ORI 20H 
           JMP STORE

GREATER_50: MOV A, B 
                      ANI BFH 

STORE : STAX D
            INX D 
            INX H 
            DCR C 
            JNZ BACK
HLT
                       