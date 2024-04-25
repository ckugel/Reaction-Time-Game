`include "RegisterRow.v"
`include "Mux8.v"
`include "Decoder3to8.v"

module regfile(DATAP, DATAQ, RP, RQ, WA, LD_DATA, WR, CLK, CLRN);
	output [12:0] DATAP;
	output [12:0] DATAQ;
	input [2:0] RP;
	input [2:0] RQ;
	input [2:0] WA;
	input [12:0] LD_DATA;
	input WR;
	input CLK;
	input CLRN;

	wire [7:0] decoded;
	wire [12:0] VALUE0;
	wire [12:0] VALUE1;
	wire [12:0] VALUE2;
	wire [12:0] VALUE3;
	wire [12:0] VALUE4;

	wire [12:0] DATAP;
	wire [12:0] DATAQ;
	
	// Decoder handles writes
	Decoder3to8 decoder (.X(WA[2]), .Y(WA[1]), .Z(WA[0]), .Enable(WR), .OUT(decoded));
	
	RegisterRow reg0 (.In(LD_DATA), .Load(decoded[0]), .Clock(CLK), .CLRN(CLRN), .Q(VALUE0));
	RegisterRow reg1 (.In(LD_DATA), .Load(decoded[1]), .Clock(CLK), .CLRN(CLRN), .Q(VALUE1));
	RegisterRow reg2 (.In(LD_DATA), .Load(decoded[2]), .Clock(CLK), .CLRN(CLRN), .Q(VALUE2));
	RegisterRow reg3 (.In(LD_DATA), .Load(decoded[3]), .Clock(CLK), .CLRN(CLRN), .Q(VALUE3));
	RegisterRow reg4 (.In(LD_DATA), .Load(decoded[4]), .Clock(CLK), .CLRN(CLRN), .Q(VALUE4));
	
	// muxes handle reads
	Mux8 outputMuxP (.S2(RP[2]), .S1(RP[1]), .S0(RP[0]), .W7(13'b0000000000000), .W6(13'b0000000000000), .W5(13'b0000000000000), .W4(VALUE4), .W3(VALUE3), .W2(VALUE2), .W1(VALUE1), .W0(VALUE0), .F(DATAP));

	Mux8 outputMuxQ (.S2(RQ[2]), .S1(RQ[1]), .S0(RQ[0]), .W7(13'b0000000000000), .W6(13'b0000000000000), .W5(13'b0000000000000), .W4(VALUE4), .W3(VALUE3), .W2(VALUE2), .W1(VALUE1), .W0(VALUE0), .F(DATAQ));


endmodule
