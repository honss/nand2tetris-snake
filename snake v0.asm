//0 is length
//2/3 are apple x/y

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
//also 17/18 for location
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

@16384
M=1

(MAINLOOP)

//skips next chunk if not on apple
@20
D=M
@2
D=D-M
@SKIPAPPLE
D;JNE
@21
D=M
@3
D=D-M
@SKIPAPPLE
D;JNE

//add new square
(SKIPAPPLE)

@6 
M=0 //reset 6

(TAILLOOP)
@6 //temp
D=M
@0 //length
D=D-M //temp-length
@6
M=M+1 //increment 6
@ENDTAILLOOP
D;JEQ //exit if done

//20/21 is the head etc

@0
D=M
D=D+M
@20
D=D+A //length*2 + 20

A=D
D=M //access above memory
@20
D=D-M
@DEATH
D;JEQ

@0
D=M
D=D+M
@21
D=D+A //length*2 + 21

A=D
D=M //access above memory
@21
D=D-M
@DEATH
D;JEQ

@TAILLOOP
0;JMP

(ENDTAILLOOP)


//take input
@24576
D=M
@8
M=D

//move forward code
@12
M=0 //reset 12

@22
D=A
@10
M=D // set @10 to 22

@23
D=A
@11
M=D // set @11 to 23

(MOVELOOP)
@0
D=M
@12
D=D-M
@ENDMOVELOOP
D;JEQ //if temp 12 = length, finish moving

//move the x coords on
@10
D=M
D=D-1
D=D-1
A=D
D=M 
@13
M=D //@13 is at destination x-coord of tail block, address in @10

@10
D=M
D=D-1
D=D-1
//D is value of address in @10 - 2, where we going



@11
D=M
A=D
D=M //@14 is at current block, address in @10
@14
M=D


@10
M=M+1
M=M+1 //10 + 2
@11
M=M+1
M=M+1 //10 + 2 //moving coords on
@12
M=M+1
(ENDMOVELOOP)

//slide over each pos, crazy loop
//change new one depending on input

//destroy apple
//generate apple, weird ass timer shit

@4
M=M+1

@MAINLOOP
0;JMP

(DEATH)
//do death