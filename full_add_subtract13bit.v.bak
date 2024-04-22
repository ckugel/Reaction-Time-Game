`include "13Adder.v"
module full_add_subtract13bit(X, Y, AddSub, Overflow, S);
  input [12:0] X;
  input [12:0] Y;
  input AddSub;
  output Overflow;
  output [12:0] S;

  wire [12:0] In;

  assign In[0] = AddSub ^ X[0];
  assign In[1] = AddSub ^ X[1];
  assign In[2] = AddSub ^ X[2];
  assign In[3] = AddSub ^ X[3];
  assign In[4] = AddSub ^ X[4];
  assign In[5] = AddSub ^ X[5];
  assign In[6] = AddSub ^ X[6];
  assign In[7] = AddSub ^ X[7];
  assign In[8] = AddSub ^ X[8];
  assign In[9] = AddSub ^ X[9];
  assign In[10] = AddSub ^ X[10];
  assign In[11] = AddSub ^ X[11];
  assign In[12] = AddSub ^ X[12];

  full_adder_13bit FA (AddSub, X, In, Overflow, S);

  endmodule
