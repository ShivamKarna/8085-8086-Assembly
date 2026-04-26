; Program to find largest and smallest from a memory of 20 bytes address starting from C050H and store them at C070H and C071H respectively.

LXI H , C050H 
MOV A, M 
MOV B, A 
MOV C ,A 
MVI D , 13H  ;  LOOP RUNS FOR 20 BYTES DATA

LOOP : INX H 
    MOV A, M 
    CMP B ; COMPARE WITH MAX
    JNC MIN_CHECK
    MOV B,A 

MIN_CHECK: CMP C 
     JNC NEXT 
    MOV C, A 

NEXT : DCR D 
    JNZ LOOP 


MOV A, B 
STA C070H
MOV A, C 
STA C071H 
HLT
