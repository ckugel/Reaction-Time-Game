`include "Equals16bit.v"

module equals50k(X, R);
  input [15:0] X;
  output R;

  Equals16bit equator (
    X,
    50000,
    out_e
  );

  assign R = out_e;

  endmodule
