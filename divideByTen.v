`ifndef divideByTen
	`define divideByTen

`include "full_add_subtract13bit.v"

module divideByTen(dividend, quotient);
  input [12:0] dividend;
  output [12:0] quotient;
  
  wire [12:0] result1;

  full_add_subtract13bit FA1 (.X({1'b0, 1'b0, 1'b0, dividend[12], dividend[11], dividend[10], dividend[9], dividend[8], dividend[7], dividend[6], dividend[5], dividend[4], dividend[3]}), .Y({1'b0, 1'b0, 1'b0, 1'b0, dividend[12], dividend[11], dividend[10], dividend[9], dividend[8], dividend[7], dividend[6], dividend[5], dividend[4]}), .AddSub(1'b1), .Overflow(_ignore), .S(result1));
  full_add_subtract13bit FA2 (.X({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, dividend[12], dividend[11], dividend[10], dividend[9], dividend[8], dividend[7], dividend[6], dividend[5]}), .Y(result1), .AddSub(1'b0), .Overflow(_ignore), .S(quotient));
  

  endmodule

`endif
