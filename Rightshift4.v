module Rightshift4(
	input [12:0] in,
	output [12:0] out
);

assign out = in >> 4;

endmodule