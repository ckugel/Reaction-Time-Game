`include "half_adder.v" 

module full_adder_13bit(X, Y, Cin, Sout, Cout, Overflow);
  input [12:0] X;
  input [12:0] Y;
  input Cin;

  output Overflow;
  output [12:0] Sout;
  output Cout;

  half_adder adder1 (X[0], Y[0], Cin, Cnext, Sout[0]);
  half_adder adder2 (X[1], Y[1], Cnext, Cnext, Sout[1]);
  half_adder adder3 (X[2], Y[2], Cnext, Cnext, Sout[2]);
  half_adder adder4 (X[3], Y[3], Cnext, Cnext, Sout[3]);
  half_adder adder5 (X[4], Y[4], Cnext, Cnext, Sout[4]);
  half_adder adder6 (X[5], Y[5], Cnext, Cnext, Sout[5]);
  half_adder adder7 (X[6], Y[6], Cnext, Cnext, Sout[6]);
  half_adder adder8 (X[7], Y[7], Cnext, Cnext, Sout[7]);
  half_adder adder9 (X[8], Y[8], Cin, Cnext, Sout[8]);
  half_adder adder10 (X[9], Y[9], Cin, Cnext, Sout[9]);
  half_adder adder11 (X[10], Y[10], Cnext, Cnext, Sout[10]);
  half_adder adder12 (X[11], Y[11], Cnext, Cnext1, Sout[11]);
  half_adder adder13 (X[12], Y[12], Cnext1, Cnext, Sout[12]);

  assign Overflow = Cnext1 ^ Cnext;
  assign Cout = Cnext1;

  endmodule
  

