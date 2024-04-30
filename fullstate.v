`ifndef fullstate
`define fullstate

`include "full_add_subtract13bit.v"
`include "mux3_8.v"
`include "equals13bit.v"
// `include "RegisterFile/dffCustom.v"

module fullstate(
    input buttonStart,
    input buttonHit,
    input buttonReset,
    input delayCounterDone,
    input [12:0] scoreCounter,
    input [12:0] registerDataP,
    input [12:0] registerDataQ,
    input Clock,
	 input [2:0] twoBitCounterCurrent,
	 
    output ledGreen, //done
    output twoBitCounterClear, //done
    output RedLed, //done
    output registerLoad, //check
    output [12:0] registerLoadData,//done
    output scoreCounterEnable, //done
    output delayCounterEnable,
    output [2:0] ReadQ,
    output [2:0] WriteAddress,
    output [2:0] State
	 
);
      wire N2Pre;
      wire N1Pre;
      wire N0Pre;
		
		wire s2,s1,s0; // represents the current state -> output. aka these are the second half or "right half" of the state machine	

      wire same;

      equals13bit counterIsSame (.X(registerDataP), .Y(13'b000000000011), .S(same));
      
      mux3_8 ma2 (.S2(s2), .S1(s1), .S0(s0), .X7(1'b0), .X6(1'b0), .X5(1'b1), .X4(1'b1), .X3(1'b1), .X2(1'b0), .X1(1'b0), .X0(1'b0), .F(N2Pre));
      mux3_8 ma1 (.S2(s2), .S1(s1), .S0(s0), .X7(1'b0), .X6(1'b0), .X5(1'b0), .X4(1'b0), .X3(1'b0), .X2(1'b1), .X1(delayCounterDone), .X0(1'b0), .F(N1Pre));
      mux3_8 ma0 (.S2(s2), .S1(s1), .S0(s0), .X7(1'b0), .X6(1'b0), .X5(1'b1), .X4(same), .X3(1'b0), .X2(buttonHit), .X1(~delayCounterDone), .X0(buttonStart), .F(N0Pre));

		wire N2;
		wire N1;
		wire N0;
		
      assign N2 = ~buttonReset & N2Pre;
      assign N1 = ~buttonReset & N1Pre; 
      assign N0 = ~buttonReset & N0Pre;

      // Next state and go to's here
  

      // TODO: Next we need to give s2, s1, and s0 values. They should go through the Flip flops below
      //a,b,c
      
      dff/*Custom*/ df0 (.Clk(Clock), .D(N0), .CLRN(1'b1), .Q(s0)/*, .QN(ignore)*/);
      dff/*Custom*/ df1 (.Clk(Clock), .D(N1), .CLRN(1'b1), .Q(s1)/*, .QN(_ignore1)*/);
      dff/*Custom*/ df2 (.Clk(Clock), .D(N2), .CLRN(1'b1), .Q(s2)/*, .QN(_ignore2)*/);
		
		assign State = {s2, s1, s0};

      wire [12:0] regPlus; // reg[0] plus one.

      full_add_subtract13bit FA1 (.X(registerDataP), .Y(13'b0000000000001), .AddSub(1'b0), .Overflow(_ignore), .S(regPlus));

      assign ledGreen = ~s2 & s1 & ~s0;
      assign RedLed = ~s2 & ~s1 & s0;
      assign registerLoad = (s2 & ~s1 & s0 & buttonHit) | (s1 & s0) | (s2 & ~s1);
      assign delayCounterEnable = ~s2 & ~s1 & s0 & ~delayCounterDone;
      assign scoreCounterEnable = ~s2& s1& ~s0;
      assign twoBitCounterClear = s2 & ~s1 & s0;

      assign registerLoadData = (s2 ? (regPlus) : scoreCounter); // if s2 = 1 Register LoadData. else s2 = 0 Reg[0]+1
      assign ReadQ = (twoBitCounterClear) ? (twoBitCounterCurrent) : ({registerDataP[2], registerDataP[1], registerDataP[0]}); // should be the place where screen five and associated is modified from

      assign WriteAddress = (s2) ? ({1'b0, 1'b0, 1'b0}) : (ReadQ);



endmodule

`endif
