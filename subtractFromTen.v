`include "full_add_subtract13bit.v"
module subtractFromTen(X, Out, Overflow);
  input [12:0] X;
  output [12:0] Out;
  output Overflow;


