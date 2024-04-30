`ifndef RegisterRow
  `define RegisterRow

`include "RegisterFile/Register.v"

module RegisterRow(In, Load, Clock, CLRN, Q);
  input [12:0] In;
  input Load;
  input Clock;
  input CLRN;
  output [12:0] Q;

  Register register1 (In[0], Load, Clock, CLRN, Q[0]);
  Register register2 (In[1], Load, Clock, CLRN, Q[1]);
  Register register3 (In[2], Load, Clock, CLRN, Q[2]);
  Register register4 (In[3], Load, Clock, CLRN, Q[3]);
  Register register5 (In[4], Load, Clock, CLRN, Q[4]);
  Register register6 (In[5], Load, Clock, CLRN, Q[5]);
  Register register7 (In[6], Load, Clock, CLRN, Q[6]);
  Register register8 (In[7], Load, Clock, CLRN, Q[7]);
  Register register9 (In[8], Load, Clock, CLRN, Q[8]);
  Register register10 (In[9], Load, Clock, CLRN, Q[9]);
  Register register11 (In[10], Load, Clock, CLRN, Q[10]);
  Register register12 (In[11], Load, Clock, CLRN, Q[11]);
  Register register13 (In[12], Load, Clock, CLRN, Q[12]);


  endmodule
`endif
