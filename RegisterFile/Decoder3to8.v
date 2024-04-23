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
// CREATED		"Tue Apr 23 00:25:01 2024"

module Decoder3to8(
	X,
	Y,
	Z,
	Enable,
	OUT
);


input wire	X;
input wire	Y;
input wire	Z;
input wire	Enable;
output wire	[0:7] OUT;

wire	[0:7] OUT_ALTERA_SYNTHESIZED;
wire	SYNTHESIZED_WIRE_13;
wire	SYNTHESIZED_WIRE_14;
wire	SYNTHESIZED_WIRE_15;




assign	SYNTHESIZED_WIRE_13 =  ~Y;

assign	OUT_ALTERA_SYNTHESIZED[6] = SYNTHESIZED_WIRE_13 & Y & SYNTHESIZED_WIRE_14 & Enable;

assign	OUT_ALTERA_SYNTHESIZED[5] = SYNTHESIZED_WIRE_13 & X & Z & Enable;

assign	OUT_ALTERA_SYNTHESIZED[4] = X & SYNTHESIZED_WIRE_13 & SYNTHESIZED_WIRE_14 & Enable;

assign	OUT_ALTERA_SYNTHESIZED[3] = Enable & SYNTHESIZED_WIRE_15 & Y & Z;

assign	OUT_ALTERA_SYNTHESIZED[1] = SYNTHESIZED_WIRE_15 & SYNTHESIZED_WIRE_13 & Z & Enable;

assign	OUT_ALTERA_SYNTHESIZED[0] = Enable & SYNTHESIZED_WIRE_15 & SYNTHESIZED_WIRE_14 & SYNTHESIZED_WIRE_13;

assign	OUT_ALTERA_SYNTHESIZED[2] = SYNTHESIZED_WIRE_15 & Y & Enable & SYNTHESIZED_WIRE_14;

assign	SYNTHESIZED_WIRE_14 =  ~Z;

assign	SYNTHESIZED_WIRE_15 =  ~X;

assign	OUT_ALTERA_SYNTHESIZED[7] = X & Y & Z & Enable;

assign	OUT = OUT_ALTERA_SYNTHESIZED;

endmodule
