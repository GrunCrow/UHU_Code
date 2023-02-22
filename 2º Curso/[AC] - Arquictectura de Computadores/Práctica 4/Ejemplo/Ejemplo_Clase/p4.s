.data 
	A: .word 10
	X: .word 1,2,3,4,5
	Xtop: .word 6
	Xpointer: .word 4

	k: .word 1

.text

start: 
	LW R1,A
	LW R2, Xtop
	LW R3, Xpointer
	LW R4, k

	ADD R5,R0,R0
	ADD R6,R0,R0

loop:
	LW R6,X(R5)
	ADD R6,R1,R6
	SW X(R5),R6

	ADD R5,R5,R3
	SUB R2,R2,R4
	BNEZ R2,loop
	NOP
trap #0