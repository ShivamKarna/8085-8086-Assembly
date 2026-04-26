; Program to multiply two 8 bit Numbers

MVI A, 00H 
LDA 2050H 
MOV B, A 

LDA 2051H 
MOV C, A 

MVI D , 00H 

MUL_LOOP 
MOV A, D 
ADD B 
MOV D, A 
DCR C 
MOV A, C 
CPI 00H 
JNZ MUL_LOOP 


MOV A, D
STA 2052H 
HLT

