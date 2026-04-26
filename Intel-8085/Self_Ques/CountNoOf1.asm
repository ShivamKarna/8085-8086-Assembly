MVI A, 0FH  ; Number in which 1 is to be counted
MVI B, 08H ; COUNTER for iterations, i.e. 8 bits so 8
MVI C, 00H  ; Counter to count number of 1's

AA : RAR 
      JNC BB 
      INR C 
BB: DCR B 
      JNZ AA 
      STA 9000H
      RST 5
