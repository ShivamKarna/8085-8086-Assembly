;Write a program for 8085 to add upper nibble and lower nibble of ten 8-bit words stored in a table that starts from location 8B20H.
;Store the separate results in location just after the table.

LXI H, 8B20H 
MVI C, 0AH 
MVI D, 00H  ; store upper nibble sum
MVI E, 00H ; store lower nibble sum

LOOP : MOV A, M 
            MOV B, A ; STORE ORIGINAL NUMBER, for future use
            ANI F0H 
            RRC 
            RRC 
            RRC 
            RRC 
            ADD D 
            MOV D, A 

            MOV A,B 
            ANI 0FH 
            ADD E 
            MOV E, A 

            INX H 
            DCR C 
            JNZ LOOP 

            MOV M , E 
            INX H 
            MOV M ,D 
            HLT