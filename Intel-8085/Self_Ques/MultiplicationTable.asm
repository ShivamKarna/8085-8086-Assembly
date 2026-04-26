; Write a program for 8085 to generate multiplication table of number stored at 8230h and store the generated table starting at 8231H.
 ; For example if location 8230H is 05H, store 0AH in 8231H and so on.(8) [2072 Magh] : 

LXI H, 2000H 
MVI C, 0AH 
MOV A , M 
MOV E , M 

LOOP  : INX H 
            ADD E 
            MOV M , A 

            DCR C 
            JNZ LOOP 
  
HLT