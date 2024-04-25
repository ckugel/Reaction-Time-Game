`include "quotientAndRemainder.v"

module displayScore(X, Screen1, Screen2, Screen3, Screen4);
  input [12:0] X;
  output [3:0] Screen1;
  output [3:0] Screen2;
  output [3:0] Screen3;
  output [3:0] Screen4;

  wire [3:0] Screen1Pre;
  wire [3:0] Screen2Pre;
  wire [3:0] Screen3Pre;
  wire [3:0] Screen4Pre;

  wire [12:0] Inbetween1_2; // X / 10
  wire [12:0] Inbetween2_3; // Inbetween1_2 / 10
  wire [12:0] Inbetween3_4; // Inbetween2_3 / 10

  quotientAndRemainder db10_1 (.Input(X), .Quotient(Inbetween1_2), .Remainder(Screen1Pre));
  quotientAndRemainder db10_2 (.Input(Inbetween1_2), .Quotient(Inbetween1_2), .Remainder(Screen2Pre));
  quotientAndRemainder db10_3 (.Input(Inbetween2_3), .Quotient(Inbetween2_3), .Remainder(Screen3Pre));
  quotientAndRemainder db10_4 (.Input(Inbetween3_4), .Quotient(Screen4Pre), .Remainder(_ignore));

  //TODO: connect to Register rows
  
  //TODO: connect output of register rows to seven-seg displays
  

endmodule
