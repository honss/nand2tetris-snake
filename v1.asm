//TODO NEED TO DELETE LAST SQUARE
//SETUP WALL COLLISION
@3
M=1
(MAINLOOP)
	//move forward code
	@12
	M=0 //reset 12
	@15
	M=0
	//setting up @10 and @11
	@20
	D=A
	@10
	M=D // set @10 to 22

	@21
	D=A
	@11
	M=D // set @11 to 23


			(SETLOOP)

			@12
			D=M
			@0
			D=D-M
			@MOVELOOP
			D;JEQ //skips if @12 == length

			//want to set @10 to 22+2n where n is length
			@2
			D=A
			@10
			M=M+D

			@2
			D=A
			@11
			M=M+D


			@12
			M=M+1 //increment @12

			@SETLOOP
			0;JMP

(MOVELOOP)


//PAST THE TESTED STUFF
@0
D=M
@15
D=D-M
@ENDMOVELOOP
D;JEQ //if temp 12 = length, finish moving

// move the x coords on



@10
D=M
D=D-1
D=D-1
A=D
D=M 
//D is source block x thing

@10
A=M //opening the receiving block
M=D

@11
D=M
D=D-1
D=D-1
A=D
D=M 
//D is source block y thing

@11
A=M //opening the receiving block
M=D


// we want to move value of @10-2 to @10
// set @10-2 to value into d
// set A to @22+2n
// @10 - 2 is 





@10
M=M-1
M=M-1

@11
M=M-1
M=M-1


@15
M=M+1 //increment @15
@MOVELOOP
0;JMP
(ENDMOVELOOP)

//READ INPUTS, @3 is rotation where 1 is right, go counterclockwise
//game plan:
//read input, decide if valid
//add new box i guess, needs to be the front
//68 right, 87 up, 65 left, 83 down
@24576
D=M

@NOTHING
D;JEQ

@68
D=D-A
@RIGHT
D;JEQ

@19
D=D-A
@UP
D;JEQ

@22
D=D+A
@LEFT
D;JEQ

@18
D=D-A
@DOWN
D;JEQ

(NOTHING)
@3
D=M
D=D-1
@RIGHT
D;JEQ
D=D-1
@UP
D;JEQ
D=D-1
@LEFT
D;JEQ
D=D-1
@DOWN
D;JEQ

@ENDROTATION
0;JMP

(RIGHT)
@3
D=M
@3
D=D-A
@NOTHING
D;JEQ

@20
M=M+1

@3
M=1

//
@ENDROTATION
0;JMP

(UP)
@3
D=M
@4
D=D-A
@NOTHING
D;JEQ

@21
M=M+1

@2
D=A
@3
M=D

@ENDROTATION
0;JMP

(LEFT)
@3
D=M
@1
D=D-A
@NOTHING
D;JEQ

@20
M=M-1

@3
D=A
@3
M=D

@ENDROTATION
0;JMP

(DOWN)
@3
D=M
@2
D=D-A
@NOTHING
D;JEQ

@21
M=M-1

@4
D=A
@3
M=D

(ENDROTATION)
@MAINLOOP
0;JMP









