; Gray to binary converter
LXI H, 8200H      
MOV A, M          
MOV B, A          

MVI C, 07H        

L1:
RLC               
MOV D, A          
MOV A, B
RRC             
MOV B, A
MOV A, D
DCR C
JNZ L1

STA 8201H
HLT

