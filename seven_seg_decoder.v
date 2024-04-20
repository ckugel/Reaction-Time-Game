module seven_seg_decoder
(
	input[3:0] hex_degit,
	output reg[0:6] display
);

always @(hex_degit) begin
	case(hex_degit)
		4'h0: display = 7'b0000001;//good
		4'h1: display = 7'b1001111;//good
		4'h2: display = 7'b0010010;//good
		4'h3: display = 7'b0000110;//good
		4'h4: display = 7'b1001100;//good
		4'h5: display = 7'b0100100;//good
		4'h6: display = 7'b0100000;//good
		4'h7: display = 7'b0001111;//good
		4'h8: display = 7'b0000000;//good
		4'h9: display = 7'b0000100;//good
		4'ha: display = 7'b0001000;//good
		4'hb: display = 7'b1100000;//good
		4'hc: display = 7'b0110001;//good
		4'hd: display = 7'b1000010;//good
		4'hE: display = 7'b0110000;//good
		4'hF: display = 7'b0111000;//good
		default: display = 7'b1111111;
	endcase
	end
endmodule