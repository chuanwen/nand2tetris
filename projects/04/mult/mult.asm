// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
// High level code:
// set R2 = 0
// set i = 1
// set x = R1
// while (true) {
//   if (R0 & i = 1) then R2 = R2 + x
//   i = i + i
//   x = x + x
//   if (i > R0) then break
// } 
      @2
      M=0 // R2 = 0
      
      @i
      M=1 // i = 1
      
      @1
      D=M
      @x
      M=D // x = R1
      
(LOOP)      
      @0
      D=M
      @i
      A=M
      D=D&A // D = R0 & i
      
      @NEXT
      D; JEQ // if R0 & i == 0 goto NEXT
      @x
      D=M
      @2
      M=D+M  // R2 = R2 + x
(NEXT)      
      @i
      D=M
      M=D+M // i = i + i
      
      @x
      D=M
      M=D+M // x = x + x
      
      @i
      D=M
      @0
      D=D-M
      @LOOP
      D; JLE // if i <= R0 goto LOOP
(END)
      @END
      0; JMP