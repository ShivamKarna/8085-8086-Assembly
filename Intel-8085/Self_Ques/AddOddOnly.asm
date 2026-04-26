; Program to count Odd numbers only from a list of memory address given 


LXI H , 8500H 
MVI B, 02H
MVI C, 00H ; INITIAL SUM = 0

NEXT: MOV A, M 
          ANI 01H 
          JNZ DO_SUM 
          JZ SKIP


DO_SUM: MOV A, M 
              ADD C
              MOV C, A

SKIP: INX H 
          DCR B 
          JNZ NEXT

MOV A, C
STA 9005H 
HLT

