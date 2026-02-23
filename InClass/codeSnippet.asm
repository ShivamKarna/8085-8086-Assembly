; TO COUNT NO OF 1'S AND 0'S IN 20 BYTES OF DATA
; DATA STARTS AT 5000H, 0-COUNT AT 6000H, 1-COUNT AT 7000H

MVI C, 14H      ; Loop counter for 20 bytes (14 Hex = 20 Decimal)
LXI H, 5000H    ; Source data pointer
LXI B, 6000H    ; Pointer for Zeros count
LXI D, 7000H    ; Pointer for Ones count

REPEAT: MOV A, M        ; Get data byte into Accumulator
        PUSH B          ; Save Zeros pointer (6000 series)
        PUSH D          ; Save Ones pointer (7000 series)
        PUSH H          ; Save Data pointer (5000 series)
        
        MVI B, 08H      ; Bit counter (8 bits per byte)
        MVI D, 00H      ; Clear D - will store 0-count for this byte

BACK:   RRC             ; Rotate right, bit goes into Carry
        JC SKIP_INR     ; If Carry = 1, skip incrementing zero-counter
        INR D           ; If Carry = 0, increment zero-counter

SKIP_INR: DCR B         ; Decrease bit counter
        JNZ BACK        ; Repeat for all 8 bits

        ; --- Calculation and Storage ---
        MOV L, D        ; L = count of 0s
        MVI A, 08H
        SUB L           ; A = 8 - (count of 0s) = count of 1s
        MOV H, A        ; H = count of 1s

        POP A           ; Get Data pointer back from stack into HL
        MOV L, A        ; Note: We restore HL carefully
        POP D           ; Restore 1-count pointer
        POP B           ; Restore 0-count pointer

        MOV A, L        ; Move 0-count (stored in L earlier) to A
        STAX B          ; Store 0s at 6000H...
        MOV A, H        ; Move 1-count (stored in H earlier) to A
        STAX D          ; Store 1s at 7000H...

        ; --- Increment Pointers for Next Byte ---
        INX H           ; Point to next data byte
        INX B           ; Point to next 0-storage
        INX D           ; Point to next 1-storage
        
        DCR C           ; Decrement 20-byte loop counter
        JNZ REPEAT      ; If not zero, process next byte

HLT                     ; Stop program