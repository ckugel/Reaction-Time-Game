`ifndef scoreCounterWithDone
  `define scoreCounterWithDone

`include "equals13bit.v"
`include "scoreCounter.v"
module scoreCounterWithDone(Enable, ClockIn, Done);
  input Enable;
  input ClockIn;
  output Done;

  wire [10:0] Y;

  delayCounter upper (.Enable(Enable), .Clock(ClockIn), .out(Y), .Reset(~Enable));
  
  equals8bit eq (.X(10'b111111111), .Y({1'b1, 1'b1, Y[10], Y[9], Y[8], Y[7], Y[6], Y[5], Y[4], Y[3], Y[2], Y[1], Y[0]}), .S(Done));


endmodule

`endif
