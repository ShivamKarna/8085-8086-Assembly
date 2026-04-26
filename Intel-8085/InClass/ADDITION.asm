MVI C, 00H    
LXI H, 5000H  
MOV A, M      
INX H         
MOV B, M      
ADD B         
JNC AA        
INR C         
AA: INX H     
MOV M, A      
INX H         
MOV M, C      
HLT           
