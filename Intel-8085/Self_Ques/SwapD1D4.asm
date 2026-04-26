; Write a ALP in 8085 to transfer 20 bytes of data in a table to another table by interchanging D1 and D4 bits of each byte

LXI H, 8050H ; SRC
LXI D, 8070H ; DEST

MVI C, 14H ; COUNTER

LOOP: MOV A, M 
  ANI 12H 
  JZ SKIP 
  CPI 12H 
  JZ SKIP 
  MOV A, M 
  XRI 12H 
  JMP LOWER  

SKIP :MOV A,  M 

LOWER : STAX D 
  INX H 
  INX D 

DCR C 
JNZ LOOP 
HLT



