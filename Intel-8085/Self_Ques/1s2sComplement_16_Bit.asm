; Program to find 1s and 2s complement of 
; 16 Bit Number



; 1s Complement
LXI H, 2050H
MOV A, M 
CMA 
STA 2052H

INX H

MOV A, M 
CMA 
STA 2054H 
HLT


; 2s Complement
LXI H, 2050H 

; LSB 
MOV A, M 
CMA 
ADI 01H 
STA 2052H 

; MSB 
INX H 
MOV A, M 
CMA 

JNC NO_CARRY 
ADI 01H

NO_CARRY:
      STA 2053H 
      HLT


; Either we can do 2s complement like above or we can do like below
LXI H , 2050H 
MVI B, 00H 
MOV A, M 
CMA 
ADI 01H 
STA 2050H
JNC HeHe
INR B

HeHe:
LXI H, 2051H  ; OR WE CAN JUST DO INX H 
MOV A, M 
CMA 
ADD B 
STA 2051H 
HLT


