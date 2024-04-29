`include "RegisterFile/dffCustom.v"
`include "full_add_subtract13bit.v"

module fullstate(
    input buttonStart,
    input buttonHit,
    input buttonReset,
    input twobitCounterin,
    input [12:0] registerDataP,
    input [12:0] registerDataQ,
    input Clock,
	 
	 
    output runcounterEnable, //could of read chart wrong
    output [1:0] runcounter,
    output scoreCounterEnable, //done
    output ledGreen, //done
    output registerClear,//done
    output twoBitCounterClear, //done
    output [1:0] DisplayScoreControl,
    output RedLed, //done
    output [12:0] DisplayScore,
    output registerLoad, //check
    output [12:0] registerLoadData,//done
    output scoreCounterClear //done
	 
);
      // TODO: LOGIC HERE FOR DETERMINING NEXT STATE 
      wire N2;
      wire N1;
      wire N0;

      // Next state and go to's here
  

      // TODO: Next we need to give s2, s1, and s0 values. They should go through the Flip flops below
      //a,b,c
      wire s2,s1,s0; // represents the current state -> output. aka these are the second half or "right half" of the state machine	
      dffCustom df0 (.Clk(Clock), .D(N0), .CLRN(1'b1), .Q(s0), .QN(_ignore0));
      dffCustom df1 (.CLk(Clock), .D(N1), .CLRN(1'b1), .Q(s1), .QN(_ignore1));
      dffCustom df2 (.Clk(Clock), .D(N2), .CLRN(1'b1), .Q(s2), .QN(_ignore2));

      wire [12:0] regPlus; // reg[0] plus one.

      full_add_subtract13bit FA1 (.X(registerDataP), .Y(13'b0000000000001), .AddSub(1'b0), .Overflow(_ignore), .S(regPlus));

      assign ledGreen = ~s2 & s1 & ~s0;
      assign RedLed = ~s2 & ~s1 & s0;
      assign scoreCounterClear = (~s1 & ~s0) | (s1 & s0) | s2;
      assign registerLoad = (s2 & ~s1 & s0 & buttonHit) | (~s2 & s1 & ~s0 & buttonStart); // TODO: fix, not correct
      assign delayCounterEnable = ~s2 & ~s1 & s0;
      assign registerClear = 1;
      assign scoreCounterEnable = ~s2&s1&~s0;
      assign twoBitCounterClear = s2 & ~s1 & s0;

      assign registerLoadData = (s2 ? (regPlus) : registerDataQ); // if s2 = 1 Register LoadData. else s2 = 0 Reg[0]+1



endmodule
