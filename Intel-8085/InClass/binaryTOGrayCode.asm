 ; Binary to gray code converter

LDA 8000H
MOV B, A
RAR
XRA B
STA 8500H
HLT