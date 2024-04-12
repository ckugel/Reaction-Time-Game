`include "ShiftByNBits.v"

module divideByTen(dividend, quotient, remainder);
  input [12:0] dividend;
  output [12:0] quotient;
  output [3:0] remainder;

  q = (dividend >> 1) + (dividend >> 2);
  q = q + (q >> 4);
  q = q + (q >> 8);
  q = q + (q >> 16);
  assign quotient = q >> 3;
  
  endmodule

