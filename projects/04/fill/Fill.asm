// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.


(LOOP)      
      @24576  // keyboard
      D=M
      @PRESSED
      D; JNE  // if key pressed, goto PRESSED (set color = -1), else set color = 0
      @color
      M=0
      @ENDKEY
      0; JMP
(PRESSED)
      @color
      M=-1
(ENDKEY)
      @8192
      D=A
      @N
      M=D // N = 256 * 512 / 16 = 8192
      
      @i
      M=0 // i = 0
(PAINT)
      @i
      D=M
      @16384  // screen
      D=A+D   // d = screen + i
      @dest
      M=D     // dest = screen + i
      @color
      D=M
      @dest
      A=M
      M=D
      
      @i
      M=M+1
      @i
      D=M
      
      @N
      D=M-D   // D = N - i
      @PAINT
      D; JGT // if N > i, goto PAINT
      @LOOP
      0; JMP
      