`include "Equals16bit.v"

module(X, R);
  input [15:0] X;
  output R;

  Equals16bit equator (
    X,
    `1100001101010000,
    out_e
  )

  assign R = out_e;

  endmodule
