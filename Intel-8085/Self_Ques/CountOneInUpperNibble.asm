; Write a program for 8085 to calculate the numbers of ones in the upper nibble of ten 8-bit numbers stored in table. 
 ;Store the count in memory location just after the table. 	(8) 	 	 	[2072  Ashwin] 

 LXI H, 2000H 
 MVI C, 0AH 
 MVI D, 00H 

 LOOP : MOV A,M 
          ANI F0H 

          MVI B, 04H 

CHECK_BIT : RLC 
                    JNC SKIP_INC
                    INR D 
            
SKIP_INC : DCR B 
                  JNZ CHECK_BIT 


                  INX H 
                  DCR C 
                  JNZ LOOP 

                  MOV M , D 
HLT