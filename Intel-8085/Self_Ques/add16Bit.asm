; Program to add two 16 bit numbers

; First Method , (without using DAD D or XCFG )

LXI H, 2050 H
MOV A, M
INX H 
MOV H, M 
MOV L,A 

LXI D, 2052 H

MOV A, E
ADD L
MOV L, A

MOV A, D 
ADC H
MOV H, A

SHLD 2060H 
HLT

; Second method , ( A bit shortcut)

LHLD 2050H

XCHG 

LHLD 2052H 

DAD D 

SHLD 2060H

JNC NO_CARRY

MVI A, 01H
STA 2062H
JMP END

NO_CARRY: 
MVI A, 00H
STA 2062H

END:
HLT
