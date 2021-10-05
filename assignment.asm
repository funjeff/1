//code for main
	
	


//code for insertion sort 

	sort: ADDI X10 XZR #1
	ADDI X12 X0 #0
	SUBI X11 X1 #1
	ADDI X1 X10 #0
	ADDI X2 X11 #0
	ADDI X15 X30 #0
	sortLoop:
	B.insert
	ADDI X0 X12 #0
	ADDI X10 X10 #1
	ADDI X1 X10 #0
	ADDI X3 X11 #0
	CMP X10 X11
	BLT.sortLoop
	ADD X30 X15 #0
	BR



// code for insert sorted pos
	 
	 insert: ADD X3 X0 X1
	 ADDI X15 X30 #0
	 ADDI X9 X2 #0
	 ADDI X10 X0 #0
	 LDUR X1 [X3 #0]
	 ADDI X12 [X1 #0]
	 B.find
	 ADDI X11 X0 #0
	 ADDI X1 X0 #0
	 ADDI X0 X10 #0
	 ADDI X2 X9 #0
	 B.shift
	 ADDI X0 X10 X11
	 STUR X12 [X0 #0]
	 ADDI X30 X15 #0
	 BR

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
	