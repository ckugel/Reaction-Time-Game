module fullstate(
    input buttonStart,
    input buttonHit,
    input buttonReset,
    input twobitCounterin,
    input registerDataP,
	 input registerDataQ,
	 
	 
	 
    output runcounterEnable,
    output [1:0] runcounter,
    output scoreCounterEnable,
    output delayCounterEnable,
    output ledGreen,
    output registerClear,
    output twoBitCounterClear,
    output [1:0] DisplayScoreControl,
    output RedLed,
    output [12:0] DisplayScore,
    output registerLoad,
    output [12:0] registerLoadData,
	 output scoreCounterClear
);

endmodule
