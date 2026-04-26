; Program to find 1's and 2's complement of a
; 8 bit number


; 1's complement
LDA 2050H
CMA 
STA 2053H
HLT

; 2's complement
LDA 2050H
CMA 
INR A 
STA 2053H
HLT
