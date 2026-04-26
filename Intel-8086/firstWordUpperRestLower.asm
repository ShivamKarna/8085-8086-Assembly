;This program takes a string and converts it to Title Case ( "hello world" becomes "Hello World"). 
.MODEL SMALL
.STACK 100H
.DATA
    PROMPT  DB 'Enter a string: ', '$'
    RESULT  DB 0DH, 0AH, 'Formatted String: ', '$'
    BUFFER  DB 100, ?, 100 DUP('$')

 .CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    MOV DX, OFFSET PROMPT
    MOV AH, 09H
    INT 21H

    MOV DX, OFFSET BUFFER 
    MOV AH, 0AH 
    INT 21H 

    ; PREPARE
     MOV SI,OFFSET BUFFER+2
     MOV CL, [BUFFER+1]
     MOV CH, 0 
     JCXZ EXIT

     MOV BH,1  
CONVERT: MOV AL, [SI]
                 CMP AL, ' '
                 JE IS_SPACE 

                 CMP BH, 1 
                 JE MAKE_UPPER 

MAKE_LOWER : CMP AL, 'A'
                          JB DONE_CHAR
                          CMP AL, 'Z'
                          JA DONE_CHAR 
                          OR AL, 20H 
                          JMP DONE_CHAR 

MAKE_UPPER: CMP AL, 'a'
                        JB SET_FLAG_OFF 
                        CMP AL, 'z'
                        JA SET_FLAG_OFF 
                        AND AL, 0DFH 
                        
SET_FLAG_OFF : MOV BH, 0 
                            JMP DONE_CHAR

IS_SPACE : MOV BH, 1 

DONE_CHAR : MOV [SI], AL  
                       INC SI 
                       LOOP CONVERT 

                       MOV DX, OFFSET RESULT 
                       MOV AH, 09H 
                       INT 21H 

                       MOV DX, OFFSET BUFFER+2 
                       MOV AH, 09H 
                       INT 21H 

EXIT : MOV AH, 4CH 
          INT 21H 
          MAIN ENDP 
END MAIN
              

                    