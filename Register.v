// Copyright (C) 2023  Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions 
// and other software and tools, and any partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License 
// Subscription Agreement, the Intel Quartus Prime License Agreement,
// the Intel FPGA IP License Agreement, or other applicable license
// agreement, including, without limitation, that your use is for
// the sole purpose of programming logic devices manufactured by
// Intel and sold by Intel or its authorized distributors.  Please
// refer to the applicable agreement for further details, at
// https://fpgasoftware.intel.com/eula.

// PROGRAM		"Quartus Prime"
// VERSION		"Version 22.1std.1 Build 917 02/14/2023 SC Standard Edition"
// CREATED		"Thu Apr 18 13:07:47 2024"

module Register(
	CLK,
	CLRN,
	In,
	Load,
	Q,
	Qnot
);


input wire	CLK;
input wire	CLRN;
input wire	In;
input wire	Load;
output wire	Q;
output wire	Qnot;

wire	[0:0] SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
reg	SYNTHESIZED_WIRE_2;

assign	Q = SYNTHESIZED_WIRE_2;
assign	SYNTHESIZED_WIRE_1 = 1;




always@(posedge CLK or negedge CLRN or negedge SYNTHESIZED_WIRE_1)
begin
if (!CLRN)
	begin
	SYNTHESIZED_WIRE_2 <= 0;
	end
else
if (!SYNTHESIZED_WIRE_1)
	begin
	SYNTHESIZED_WIRE_2 <= 1;
	end
else
	begin
	SYNTHESIZED_WIRE_2 <= SYNTHESIZED_WIRE_0[0];
	end
end


busmux_0	b2v_inst1(
	.sel(Load),
	.dataa(SYNTHESIZED_WIRE_2),
	.datab(In),
	.result(SYNTHESIZED_WIRE_0));


assign	Qnot =  ~SYNTHESIZED_WIRE_2;


endmodule

module busmux_0(sel,dataa,datab,result);
/* synthesis black_box */

input sel;
input [0:0] dataa;
input [0:0] datab;
output [0:0] result;

endmodule
