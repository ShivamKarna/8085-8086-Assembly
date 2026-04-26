;write a program to transfer 20 bytes of 8-bit data from one table to another:

;If the byte is less than 80H, set bit D5 before storing.

;If the byte is 80H or greater, reset bit D6 before storing.

;Source table starts at some address (say 9000H) and destination table at another (say 9100H).

LXI H, 9000H ; Source
LXI D, 9100H ; DEST

MVI B, 14H  ; COUNTER 

LOOP: MOV A,M 
          CPI 80H 
          JC SET_D5 
          ANI BFH  ; Reset D6
          JMP STORE

SET_D5: ORI 20H 

STORE : STAX D 
            INX H 
            INX D
            DCR B 
            JNZ LOOP 

HLT
            


