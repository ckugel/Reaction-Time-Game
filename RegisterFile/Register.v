`ifndef Register
	`define Register

module Register(In, Load, Clock, CLRN, Q);
  input In;
  input Load;
  input Clock;
  input CLRN;
  output Q;
  
  
  assign D = Load ? In : Q;
  dff regDFF (.D(D), .Clk(Clock), .CLRN(CLRN), .Q(Q));
  
endmodule

`endif