 ;Write an ALP for 8085 to find the square of ten 8-bit numbers which are <=0FH, stored from memory location C090H.;
;  Store the result from the end of the source table. 

LXI H , C090H  ; source table
LXI D, C09AH; store table
MVI B , 0AH 

LOOP : MOV A,M 
          MOV C, A 
          MOV E, C 
          MVI A, 00H 

MULT: ADD C 
        DCR E 
        JNZ MULT 
        
        STAX D 
        INX H 
        INX D 

        DCR B 
        JNZ LOOP 

HLT