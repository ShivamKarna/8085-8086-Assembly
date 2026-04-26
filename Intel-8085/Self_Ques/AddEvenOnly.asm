; Program to add only even numbers from a list given in memory

LXI H, 8500H 
MVI B, 03H ; No. of Items
MVI C, 00H ; Sum = 0 initially

NEXT: MOV A, M 
ANI 01H 
JNZ BACK 

MOV A, M 
ADD C 
MOV C, A



BACK : INX H 
DCR B 
JNZ NEXT

MOV C, A 
STA 9005H
HLT