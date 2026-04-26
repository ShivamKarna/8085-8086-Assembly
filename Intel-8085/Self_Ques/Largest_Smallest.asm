; Program to find largest and smallest from 20 bytes of data 

LXI H, 9000H 
MOV A,M 

MOV B, A ; MAX
MOV C, A ; MIN 

INX H 
MVI D, 13H 


LOOP : MOV A,M 
            CMP B 
            JC CHECK_MIN 
            MOV B,A 

CHECK_MIN: CMP C 
                      JC UPDATE_MIN
                      JMP NEXT

UPDATE_MIN: MOV C, A 

NEXT : INX H 
          DCR D 
          JNZ LOOP 

MOV A, B 
STA 9500H 
MOV A, C 
STA 9501H 
HLT
              