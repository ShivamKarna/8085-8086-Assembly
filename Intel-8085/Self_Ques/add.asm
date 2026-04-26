; This is of 10 Feb 10:29PM, 

; TO add a fixed set of two numbers
;MVI A, 07H
;MVI B, 07H
;ADD B
;STA 9005H
;HLT

; now we will write to add a user input type add two number program
;lxi h, 1000h
;mov a , m
;inx h
;add m
;sta 1002h
;hlt

; now add two numbers with carry case, like F1 and 15
lxi h,1000h
mov a, m
inx h
mvi b, 00h
add m
jnc haha
inr b
haha: sta 1002h
mov a, b
sta 1003h
hlt
