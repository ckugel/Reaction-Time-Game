`ifndef scoreCounterWithDone
  `define scoreCounterWithDone

`include "counter/ThirteenBitUpCounter.v"
module scoreCounterWithDone(Enable, ClockIn, Y);
  input Enable;
  input ClockIn;

  output [12:0] Y;

  delayCounter upper (.Enable(Enable), .Clock(ClockIn), .out(Y), .Reset(~Enable));
endmodule

`endif
