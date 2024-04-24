module FA(Cin,X,Y,S, Cout);
input Cin,X,Y;
output Cout,S;
assign S = Cin ^ X ^ Y;
assign Cout = (X & Y) | (Cin & Y ) | (Cin & X);

endmodule
