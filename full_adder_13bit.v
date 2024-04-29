`ifndef full_adder_13bit
	`define full_adder_13bit

`include "FA.v" 

module full_adder_13bit(X, Y, Cin, Sout, Cout, Overflow);
  input [12:0] X;
  input [12:0] Y;
  input Cin;

  output Overflow;
  output [12:0] Sout;
  output Cout;

  FA adder1 (X[0], Y[0], Cin, Cnext, Sout[0]);
  FA adder2 (X[1], Y[1], Cnext, Cnext1, Sout[1]);
  FA adder3 (X[2], Y[2], Cnext1, Cnext2, Sout[2]);
  FA adder4 (X[3], Y[3], Cnext2, Cnext3, Sout[3]);
  FA adder5 (X[4], Y[4], Cnext3, Cnext4, Sout[4]);
  FA adder6 (X[5], Y[5], Cnext4, Cnext5, Sout[5]);
  FA adder7 (X[6], Y[6], Cnext5, Cnext6, Sout[6]);
  FA adder8 (X[7], Y[7], Cnext6, Cnext7, Sout[7]);
  FA adder9 (X[8], Y[8], Cnext7, Cnext8, Sout[8]);
  FA adder10 (X[9], Y[9], Cnext8, Cnext9, Sout[9]);
  FA adder11 (X[10], Y[10], Cnext9, Cnext10, Sout[10]);
  FA adder12 (X[11], Y[11], Cnext10, Cnext11, Sout[11]);
  FA adder13 (X[12], Y[12], Cnext11, CnextOut, Sout[12]);

  assign Overflow = Cnext11 ^ CnextOut;
  assign Cout = CnextOut;

  endmodule
  

`endif