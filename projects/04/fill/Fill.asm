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

(LISTEN_FOR_KEYBOARD_INPUT)
  @KBD
  D=M
  @INIT_COLOR_WHITE
  D;JEQ

(INIT_COLOR_BLACK)
  @8193
  D=A
  @i
  M=D
  @SCREEN
  D=A
  @CURRENT_INC
  M=-1
(COLOR_BLACK)
  @i
  MD=M-1
  @LISTEN_FOR_KEYBOARD_INPUT
  D;JEQ
  @1
  D=A
  @CURRENT_INC
  MD=M+D
  @SCREEN
  A=A+D
  M=-1
  @COLOR_BLACK
  0;JMP 

(INIT_COLOR_WHITE)
  @8193
  D=A
  @i
  M=D
  @SCREEN
  D=A
  @CURRENT_INC
  M=-1
(COLOR_WHITE)
  @i
  MD=M-1
  @LISTEN_FOR_KEYBOARD_INPUT
  D;JEQ
  @1
  D=A
  @CURRENT_INC
  MD=M+D
  @SCREEN
  A=A+D
  M=0
  @COLOR_WHITE
  0;JMP 
