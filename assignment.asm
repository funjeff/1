// code for find sorted pos
	find: ADDI X4 XZR #0
	fillLoop: 
	LSL X6 X4 #3
	ADD X5 X0 X6
	LDUR X5 [X5 #0]
	CMP X5 X1
	BLT.endLoop
	ADDI X4 X4 #1
	
	CMP X4 X2
	BLT.fillLoop
	
	endLoop: ADDI X0 X4 #0
	BR

//code for shift right
	shift: ADD X3 X0 X1
	LDUR X3 [X3 #0]
	shiftLoop: ADDI X1 X1 #8
	
	ADDI X4 X3 #0
	ADD X3 X0 X1
	STUR X4 [X3 #0]
	LDUR X3 [X3 #0]
	
	CMP X1 X2
	BNE.shiftLoop
	BR


//code for "fill" function
	fill: ADDI X2 X0 #0
	ADD X1 X0 X1
	fillLoop: 
	//calculates length - i
	SUB X4 X1 X0
	SUB X5 X2 X0
	SUB X4 X4 X5
	
	STUR X4 [X2 #0]
	ADDI X2 #8
	
	CMP X2 X1
	BNE.fillLoop
	BR
	