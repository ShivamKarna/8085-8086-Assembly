; Two tables T1 and T2, if T1[i] > T2[i], then T3[i] = T1[i] + T2[i], else T3[i] = t1[i] - T2[i]
LXI H, 2050H 
LXI D, 2060H 
LXI B, 2070H 

MVI A, 0AH ; COUNTER 
STA 3000H ; USING MEMORY TO STORE COUNT VALUE  , SKIPPING TO USE STACK 

BACK : LDAX D   
            MOV E, A ;
            MOV A, M ; LOAD FIRST TABLE FIRST NUMBER , TO COMPARE 
            CMP E
            JNC ADD 
            SUB E
            JMP STORE  

ADD : ADD E

STORE: STAX B   
            INX H 
            INX D 
            INX B
            LDA 3000H ; LOAD THE COUNT VALUE
            DCR A 
            STA 3000H 
            JNZ BACK 

HLT