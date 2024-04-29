module fullstate(
    input buttonStart,
    input buttonHit,
    input buttonReset,
    input twobitCounterin,
    input registerDataP,
    input registerDataQ,
	 
	 
    output runcounterEnable, //could of red chart wrong
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
	//a,b,c
	wire s2,s1,s0;
	wire regPlus = registerLoadData[0] + 1;
	 

	assign ledGreen = ~s2 & s1 & ~s0;
	assign RedLed = ~s2 & ~s1 & s0;
	assign scoreCounterClear = (~s1 & ~s0) | (s1 & s0) | s2;
	assign registerLoad = (s2 & ~s1 & s0 & buttonHit) | (~s2 & s1 & ~s0 & buttonStart); //check
	assign delayCounterEnable = ~s2 & ~s1 & s0;
	assign registerClear = 1;
	assign scoreCounterEnable = ~s2&s1&~s0;
	assign twoBitCounterClear = s2 & ~s1 & s0;
	
	
	assign registerLoadData = (s2 ? (regPlus) : registerDataQ); // if s2 = 1 Register LoadData. else s2 = 0 Reg[0]+1



endmodule