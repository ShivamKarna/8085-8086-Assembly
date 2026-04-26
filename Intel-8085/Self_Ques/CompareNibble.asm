; Write a program for 8085 to count the numbers for which upper nibble is higher than the lower nibble;
;  and store the count at the end of the table having 50 bytes data from C050H.

LXI H, C050H 
MVI D, 32H 
MVI C, 00H ; COUNTER


LOOP: MOV A, M 
      ANI 0FH 
      MOV E, A  ; LOWER NIBBLE STORE IN E 

      MOV A, M 
      ANI F0H 
      RRC 
      RRC 
      RRC 
      RRC        ; UPPER NIBBLE NOW IN A

      CMP E 
      JC SKIP     ; IF LOWER IS GREATER, I.E. UPPER IS SMALLER , SO WE DON'T COUNT IT 
      JZ SKIP     ; IF BOTH ARE EQUAL , DON'T COUNT
      INR C ; ELSE WE COUNT IT , SO INCREASE COUNTER 

SKIP : INX H
       DCR D 
       JNZ LOOP 

MOV A, C 
STA C082H
HLT
