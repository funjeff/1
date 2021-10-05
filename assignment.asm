//code for main
	
	MOV X0 #100
	MOV X1 #25
	
	B.fill
	
	MOV X0 #100
	MOV X1 #25

	B.sort
	
	B.end

//code for insertion sort 

	sort: ADDI X10 XZR #1
	MOV X12 X0
	SUBI X11 X1 #1
	MOV X1 X10
	MOV X2 X11
	MOV X15 X30
	sortLoop:
	B.insert
	MOV X0 X12
	ADDI X10 X10 #1
	MOV X1 X10
	MOV X3 X11
	CMP X10 X11
	BLT.sortLoop
	MOV X30 X15
	BR



// code for insert sorted pos
	 
	 insert: ADD X3 X0 X1
	 MOV X15 X30 
	 MOV X9 X2
	 MOV X10 X0
	 LDUR X1 [X3 #0]
	 MOV X12 X1
	 B.find
	 MOV X11 X0
	 MOV X1 X0
	 MOV X0 X10
	 MOV X2 X9
	 B.shift
	 ADD X0 X10 X11
	 STUR X12 [X0 #0]
	 MOV X30 X15
	 BR

// code for find sorted pos
	find: MOV X4 XZR
	fillLoop: 
	LSL X6 X4 #3
	ADD X5 X0 X6
	LDUR X5 [X5 #0]
	CMP X5 X1
	BLT.endLoop
	ADDI X4 X4 #1
	
	CMP X4 X2
	BLT.fillLoop
	
	endLoop: MOV X0 X4
	BR

//code for shift right
	shift: ADD X3 X0 X1
	LDUR X3 [X3 #0]
	shiftLoop: ADDI X1 X1 #8
	
	MOV X4 X3
	ADD X3 X0 X1
	STUR X4 [X3 #0]
	LDUR X3 [X3 #0]
	
	CMP X1 X2
	BNE.shiftLoop
	BR


//code for "fill" function
	fill: MOV X2 X0
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
	
	end:
	