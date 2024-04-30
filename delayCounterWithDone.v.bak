`ifndef delayCounterWithDone
  `define delayCounterWithDone

`include "equals13bit.v"
`include "counter/ElevenBitUpCounter.v"
module delayCounterWithDone(Enable, ClockIn, Done);
  input Enable;
  input ClockIn;
  output Done;

  wire [10:0] Y;

  ElevenBitUpCounter upper (.Enable(Enable), .Clock(ClockIn), .S(Y), .Reset(~Enable));
  
  equals13bit eq (.X(13'b1111111111111), .Y({Y[0], Y[1], Y[2], Y[3], Y[4], Y[5], Y[6], Y[7], Y[8], Y[9], Y[10], 1'b1, 1'b1}), .S(Done));


endmodule

`endif
