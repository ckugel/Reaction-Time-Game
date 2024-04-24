`include "divideByTen.v"
`include "full_add_subtract13bit.v"
`include "multiplyByTen.v"

module quotientAndRemainder(Input, Quotient, Remainder);
  input [12:0] Input;
  output [12:0] Quotient;
  output [3:0] Remainder;

  wire [12:0] inbetween;

  divideByTen db10 (Input, Quotient);
  multiplyByTen mb10 (.X(Quotient), .Product(inbetween));
  full_add_subtract13bit FA13 (.X(inbetween),.Y(13`b0000000000001), .AddSub(1'b1), .S(Remainder));

endmodule
