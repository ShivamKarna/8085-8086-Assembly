; Write a program 8085 to add all the numbers from a table of 8-bit numbers whose higher nibble value is 
; greater than 7 and store the 16 bit result just after the table.
;assuming 10 data

LXI H , 6767H
MVI B, 03H ; COUNTER
LXI D, 0000H

LOOP: MOV A,M 
        ANI F0H 
        RRC 
        RRC 
        RRC
        RRC
        CPI 07H 
        JC SKIP 
        JZ SKIP 
        MOV A, M 
        ADD E 
        MOV E, A 
        JNC SKIP 
        INR D 

SKIP : INX H 
        DCR B 
        JNZ LOOP 

MOV M,E 
INX H 
MOV M, D 
HLT
