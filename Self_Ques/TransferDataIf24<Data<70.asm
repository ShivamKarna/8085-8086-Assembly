;Ten numbers of 8-bit data is started in memory at A000H.;
; Write a program for 8085 microprocessor to copy the data to next table at A030H, if the data is less than 70H and greater than 24H. (8) 	[2068 POUSH] 
 
 
LXI H, A000H 
LXI D, A030H 
MVI C, 0AH 

LOOP : MOV A,M 
          CPI 70H 
          JNC SKIP 
          CPI 25H 
          JC SKIP 
          STAX D 
          INX D 
SKIP : INX H 
          DCR C 
          JNZ LOOP 
          HLT