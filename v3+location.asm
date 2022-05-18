
//0 is length
//1/2 are apple x/y

//3 is rotation, 0 is right go clockwise
//4 is timer/random
//5 is the final pos
//6 is temp for collision
//7 is other temp maybe
//8 is temp rotation
//9 is rotation
//10/11 are x and y temps for moving
//12 is iterative temp for moving
//13/14 are x and y temps pt 2
//15 is move temp
//16 is temp for adding block
//also 17/18 for location, find later
//20+ is pos of each block, 20/21 is the head x/y

//draw pixel @ 0,0
//big boi loop:
//check if on apple
//check if on tail
//check each input, check if is valid
//remove old box
//add new one
//generate new apple
//increment timer


//TODO NEED TO DELETE LAST SQUARE
//SETUP WALL COLLISION

(RESET) //resets first 200 memory addresses, hopefully thats enough

A=D
M=0


@200
D=D-A

@ENDRESET
D;JEQ

@200
D=D+A
D=D+1

@RESET
0;JMP
(ENDRESET)


@3
M=1

@0
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

@15
D=D-A
@UP
D;JEQ

@18
D=D+A
@LEFT
D;JEQ

@22
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

//(@21*32)+16384
@15
M=0

@16
M=0

@17
M=0

@21
D=M

(YLOOP)
@17
D=M    //adds @21 to @17
@21
D=D+M
@17
M=D


@16
M=M+1 //increments @16

D=M //if D is not 32, go to beginning
@32
D=D-A
@YLOOP
D;JNE

@17
D=M
@16384
D=A+D
@17
M=D //storing y value 16384+y in @17








// // x-coord/16 + above


@16 //line 27
M=0

@20
D=M



(XLOOP)

@16
D=D-A
@ENDXLOOP
D;JLT

@15
M=M+1

@XLOOP
0;JMP

(ENDXLOOP)



@16
M=D //REMAINDER IN @16

@15 //15 is probably x coord of dbyte, theres like 32 of those i think
D=M
@17
M=D+M //17 is value of screen dbyte, 16384+y*32+x-coord


A=D

//M=1 WHATEVER THE FUCK IT IS
//REMAINDER STORED IN @16
@16
D=M
//@15 //TEST REMOVE LATER
D=D+A //D is remainder, adjusted back +16

//0 is 1000, 1 is 0100, 15 is 0000000000000001

@REMAINDER0
D;JEQ
D=D-1
@REMAINDER1
D;JEQ
D=D-1
@REMAINDER2
D;JEQ
D=D-1
@REMAINDER3
D;JEQ
D=D-1
@REMAINDER4
D;JEQ
D=D-1
@REMAINDER5
D;JEQ
D=D-1
@REMAINDER6
D;JEQ
D=D-1
@REMAINDER7
D;JEQ
D=D-1
@REMAINDER8
D;JEQ
D=D-1
@REMAINDER9
D;JEQ
D=D-1
@REMAINDER10
D;JEQ
D=D-1
@REMAINDER11
D;JEQ
D=D-1
@REMAINDER12
D;JEQ
D=D-1
@REMAINDER13
D;JEQ
D=D-1
@REMAINDER14
D;JEQ
D=D-1
@REMAINDER15
D;JEQ


(REMAINDER0)
@1
D=A
@17
A=M
M=D|M

@ENDREMAINDER
0;JMP

(REMAINDER1)
@2
D=A
@17
A=M
M=D|M

@ENDREMAINDER
0;JMP

(REMAINDER2)
@4
D=A
@17
A=M
M=D|M

@ENDREMAINDER
0;JMP
(REMAINDER3)
@8
D=A
@17
A=M
M=D|M

@ENDREMAINDER
0;JMP
(REMAINDER4)
@16
D=A
@17
A=M
M=D|M

@ENDREMAINDER
0;JMP
(REMAINDER5)
@32
D=A
@17
A=M
M=D|M

@ENDREMAINDER
0;JMP
(REMAINDER6)
@64
D=A
@17
A=M
M=D|M

@ENDREMAINDER
0;JMP
(REMAINDER7)
@128
D=A
@17
A=M
M=D|M

@ENDREMAINDER
0;JMP
(REMAINDER8)
@256
D=A
@17
A=M
M=D|M

@ENDREMAINDER
0;JMP
(REMAINDER9)
@512
D=A
@17
A=M
M=D|M

@ENDREMAINDER
0;JMP
(REMAINDER10)
@1024
D=A
@17
A=M
M=D|M

@ENDREMAINDER
0;JMP
(REMAINDER11)
@2048
D=A
@17
A=M
M=D|M

@ENDREMAINDER
0;JMP
(REMAINDER12)
@4096
D=A
@17
A=M
M=D|M

@ENDREMAINDER
0;JMP
(REMAINDER13)
@8192
D=A
@17
A=M
M=D|M

@ENDREMAINDER
0;JMP
(REMAINDER14)
@16384
D=A
@17
A=M
M=D|M

@ENDREMAINDER
0;JMP
(REMAINDER15)
 //extraordinarily stupid shit to get 1000000000000000 because how else do i do this
@32767
D=A
D=D+1

@17
A=M
M=D|M

@ENDREMAINDER
0;JMP
(REMAINDER16)
@65536
D=A
@17
A=M
M=D|M

@ENDREMAINDER
0;JMP

(ENDREMAINDER)




//TIME FOR DELET LAST SQUARE
//@0 is length
//@20/21 is alternating x and y of squares
//511 max width 255 max height coord

(DELETE)
@0
D=M    //taking length to add to 20 to find mem address to delete
@20
A=A+D //move to 22 if length =1
	//now to remove that mini square

	
//(@21*32)+16384
@15
M=0

@16
M=0

@17
M=0

@21
D=M

(YLOOP2)
@17
D=M    //adds @21 to @17
@21
D=D+M
@17
M=D


@16
M=M+1 //increments @16

D=M //if D is not 32, go to beginning
@32
D=D-A
@YLOOP2
D;JNE

@17
D=M
@16384
D=A+D
@17
M=D //storing y value 16384+y in @17








// // x-coord/16 + above


@16 //line 27
M=0

@20
D=M



(XLOOP2)

@16
D=D-A
@ENDXLOOP2
D;JLT

@15
M=M+1

@XLOOP2
0;JMP

(ENDXLOOP2)



@16
M=D //REMAINDER IN @16

@15 //15 is probably x coord of dbyte, theres like 32 of those i think
D=M
@17
M=D+M //17 is value of screen dbyte, 16384+y*32+x-coord


A=D

//M=1 WHATEVER THE FUCK IT IS
//REMAINDER STORED IN @16
@16
D=M
//@15 //TEST REMOVE LATER
D=D+A //D is remainder, adjusted back +16

//0 is 1000, 1 is 0100, 15 is 0000000000000001

@REMAINDER02
D;JEQ
D=D-1
@REMAINDER12
D;JEQ
D=D-1
@REMAINDER22
D;JEQ
D=D-1
@REMAINDER32
D;JEQ
D=D-1
@REMAINDER42
D;JEQ
D=D-1
@REMAINDER52
D;JEQ
D=D-1
@REMAINDER62
D;JEQ
D=D-1
@REMAINDER72
D;JEQ
D=D-1
@REMAINDER82
D;JEQ
D=D-1
@REMAINDER92
D;JEQ
D=D-1
@REMAINDER102
D;JEQ
D=D-1
@REMAINDER112
D;JEQ
D=D-1
@REMAINDER122
D;JEQ
D=D-1
@REMAINDER132
D;JEQ
D=D-1
@REMAINDER142
D;JEQ
D=D-1
@REMAINDER152
D;JEQ


(REMAINDER02)
@1
D=A
@17
A=M
M=D|M

@ENDREMAINDER2
0;JMP

(REMAINDER12)
@2
D=A
@17
A=M
M=D|M

@ENDREMAINDER2
0;JMP

(REMAINDER22)
@4
D=A
@17
A=M
M=D|M

@ENDREMAINDER2
0;JMP
(REMAINDER32)
@8
D=A
@17
A=M
M=D|M

@ENDREMAINDER2
0;JMP
(REMAINDER42)
@16
D=A
@17
A=M
M=D|M

@ENDREMAINDER2
0;JMP
(REMAINDER52)
@32
D=A
@17
A=M
M=D|M

@ENDREMAINDER2
0;JMP
(REMAINDER62)
@64
D=A
@17
A=M
M=D|M

@ENDREMAINDER2
0;JMP
(REMAINDER72)
@128
D=A
@17
A=M
M=D|M

@ENDREMAINDER2
0;JMP
(REMAINDER82)
@256
D=A
@17
A=M
M=D|M

@ENDREMAINDER2
0;JMP
(REMAINDER92)
@512
D=A
@17
A=M
M=D|M

@ENDREMAINDER2
0;JMP
(REMAINDER10)
@1024
D=A
@17
A=M
M=D|M

@ENDREMAINDER
0;JMP
(REMAINDER11)
@2048
D=A
@17
A=M
M=D|M

@ENDREMAINDER
0;JMP
(REMAINDER12)
@4096
D=A
@17
A=M
M=D|M

@ENDREMAINDER
0;JMP
(REMAINDER13)
@8192
D=A
@17
A=M
M=D|M

@ENDREMAINDER
0;JMP
(REMAINDER14)
@16384
D=A
@17
A=M
M=D|M

@ENDREMAINDER
0;JMP
(REMAINDER15)
 //extraordinarily stupid shit to get 1000000000000000 because how else do i do this
@32767
D=A
D=D+1

@17
A=M
M=D|M

@ENDREMAINDER
0;JMP
(REMAINDER16)
@65536
D=A
@17
A=M
M=D|M

@ENDREMAINDER
0;JMP

(ENDREMAINDER)

















@MAINLOOP
0;JMP









