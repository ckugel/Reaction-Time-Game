module (X, S);
  input [12:0] X;
  output [12:0] S;

  assign S[0] = X[5];
  assign S[1] = X[6];
  assign S[2] = X[7];
  assign S[3] = X[8];
  assign S[4] = X[9];
  assign S[5] = X[10];
  assign S[6] = X[11];
  assign S[7] = X[12];
  assign S[8] = 1'b1;
  assign S[9] = 1'b1;
  assign S[10] = 1'b1;
  assign S[11] = 1'b1;
  assign S[12] = 1'b1;


endmodule
