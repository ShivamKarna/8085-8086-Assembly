; Write a program to print count of vowel in a string input by user and display the string and it's vowels count IN A CLEAR SCREEN.

.MODEL SMALL 
.STACK 100H 
.DATA 
PROMPT DB  'ENTER A STRING : ', '$'
MSG DB 'YOU ENTERED : ', '$'
V_MSG DB 0DH, 0AH, 'VOWELS ARE : ' , '$'
V_COUNT DB 0
BUFFER DB 100, ? , 100 DUP('$')

.CODE  
MAIN PROC  
  MOV AX, @DATA 
  MOV DS , AX  

  ; PRINT 1ST MESSAGE
  MOV DX, OFFSET PROMPT 
  MOV AH, 09H 
  INT 21H 

   ; TAKE INPUT 
   MOV DX, OFFSET BUFFER 
   MOV AH, 0AH 
   INT 21H 

  ; PREPARE 
  LEA SI , BUFFER+2
  MOV CL , [BUFFER + 1]
  MOV CH, 0 ; UPPER BYTE OF CH 0 FOR COUNTER 
  
  JCXZ DISPLAY  

  ANALYZE : MOV AL, [SI]
                  CMP AL, 'a'
                   JL CHECK_VOWEL 
                   CMP AL, 'z'
                   JG CHECK_VOWEL 
                   AND AL, 0DFH 

CHECK_VOWEL : CMP  AL, 'A'
                            JL NEXT_CHAR 
                            CMP AL , 'Z'
                            JG NEXT_CHAR 

                            CMP AL, 'A'
                            JE IS_VOWEL 
                            CMP AL, 'E'
                            JE IS_VOWEL 
                            CMP AL, 'I'
                            JE IS_VOWEL
                            CMP AL, 'O'
                            JE IS_VOWEL
                            CMP AL, 'U'
                            JE IS_VOWEL
                            JMP NEXT_CHAR
                
IS_VOWEL:  INC V_COUNT 

NEXT_CHAR : INC SI  
                      LOOP ANALYZE 

DISPLAY: 
              ; THIS THREE COMMANDS BELOW HELP TO CLEAR SCREEN
              MOV AH, 00H  ; VIDEO MODE OF BIOS
               MOV AL, 03H  ; 03h is the standard 80x25 Color Text Mode.
               INT 10H

               MOV DX, OFFSET MSG 
               MOV AH, 09H 
               INT 21H 

               LEA DX, BUFFER+2
               MOV AH, 09H 
               INT 21H 

               MOV DX, OFFSET V_MSG 
               MOV AH, 09H 
               INT 21H 

               MOV AL, V_COUNT 
               ADD AL, '0'
               MOV DL, AL  
               MOV AH, 02H 
               INT 21H 

               MOV AX, 4C00H 
               INT 21H 

               MAIN ENDP 
        
END MAIN
