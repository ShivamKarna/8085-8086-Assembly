; sort data in ascending order 
MVI B , 04H

L3: MOV C  , B
LXI H, 8500H

L2: MOV A, M
INX H
MOV D, M
CMP D
JC L1
MOV M , A
DCX H
MOV M ,D 
INX H


L1: DCR C
JNZ L2
DCR B
JNZ L3
HLT