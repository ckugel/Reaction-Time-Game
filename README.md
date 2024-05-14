# Reaction-Time-Game
Final project for computer engineering 281. This project works on the Cyclone IV development boards.


# Project Implementation


## **General Structure and Overview**

The project aims to make a game that tests the user's reaction speed by hitting a button after an LED turns on. The general structure of our project will be split into two parts. The first part will be the “main screen,” like you would have in a video game. The “main screen” will display any stored high scores on the screen and all the runs. A button will control switching through the results. The “screen” that this will be displayed on is the seven-segment display. The second part of the project will be getting the reaction speed of the plater. When an LED on the daughter board lights up, after a small amount of time, the player is supposed to hit the button. The time it takes them to hit the button will be stored. After a few runs, we will plan on averaging the results. We did not get to all of the functionality that we wanted to in the time that we had allotted. However, we planned around some features we did not get to, so we will still mention them in this report.


# Full-State machine



* FSM Logic and Design** [FSM logic and design.xlsx](https://iowastate-my.sharepoint.com/:x:/g/personal/ckugel05_iastate_edu/EczjfHGtCblEtkki3H2GrowBWEBM8A6TPkDq4LF275Joog?e=pRC8ud)**
* Verilog file:


![alt_text](images/image1.png "image_tooltip")



![alt_text](images/image2.png "image_tooltip")


Fullstate.v module manages the state transitions based on user inputs and internal counters for a game that measures reaction time. The circuit ensures that the other components of the project have the data they need. 


## **Inputs to the state machine**


![alt_text](images/image3.png "image_tooltip")




* **Reset Button:** Reset the game, reverting back to the initial state.
* **Start Button: **Starts the FSM and, therefore, the game.
* **Delay Counter Done: **This represents when the Green LED will turn on, and the red LED will turn off. The beginning of the time counts for reaction time.
* **Hit Button: **Representing the player reaction input. Stop the counter, add one to the reg file for the run counter, and the index updating the score in the register file. 
* **ScoreCounter, RegisterDataP, RegisterDataQ: **Register data inputs representing different game states and scores.
* **Clock:** The system clock input. This should be the raw 50 MHz clock ideally from pin Y2.
* **TwoBitCounterCurrent:** Is the value of the two-bit counter used in managing the game's states.


## **Outputs of the state machine**

**_	<span style="text-decoration:underline;">Values: S2, S1, and S0 denote the state machine's current state.</span>_**



* **Led Red:** This visual indicator shows the user it is not time to press the “hit” button. 
    * F = ~S2 & ~S1 & S0;
* **LED Green:** This is a visual indicator that represents to the user when to press the “hit” button or the reaction button. For the FSM, it means the delay counter has finished and reached its proper value.
    * F = ~S2 & S1 & ~S0;
* **TwoBitCounterClear:** Singal to reset the two-bit counter and whether or not to enable the counter.
    * F = s2 & ~s1 & s0;
* **registerLoad:** Tells our register file whether or not to load whatever data is on the Load_data bus at a given time
    * F = (S2 & ~S1 & S0 & "Hit button") | (s1 & s0) | (s2 & ~s1);
* **RegisterLoadData:** Data that will be written to the register file at the write address, if the register load value is high.
    * F = (s2 ? regPlus : scoreCounter);
* **scoreCounterEnable and delayCounterEnable:** Enables for their respective counters.
    * FScore = ~s2 & s1 & ~s0;
    * FDelay= ~s2 & s1 & ~s0 & ~delayCounterDone;
* **ReadQ: **The address of the Register to put onto port Q from the register file.
* **WriteAddress:** Is the data signals that represent whether to read or write to the registers.
    * FRead = (twoBitCounterClear ? twoBitCounterCurrent : {registerDataP[2], registerDataP[1], registerDataP[0]});
    * FWrite = (s2 ? 3'b000 : ReadQ);


![drawing](https://docs.google.com/drawings/d/12345/export/png)The above diagram is very helpful for communicating the outline and intended structure of the project. It aided in us figuring out and keeping track of what components we needed precisely for the final project. It also allowed us to properly outline the inputs and outputs of our programs, which was very helpful to have in mind throughout the project.


## **Next state logic**

The following state logic is pretty straightforward. We simply move up each state (with reset to return to the leading state), and stay at the current state if there has not been some input change. Our state transitions are given by the following table (All go to 000 when reset is pressed and all, except Endpoint state #1, stay if the condition is false): 
![alt_text](images/image4.png "image_tooltip")


The derivation of our next state boolean logic is below, The value for s2 and s1 are simple enough that we could just use four variable K-maps to determine their next state. However S0 was very challenging as it changes every single new state. In order to think about a solution for this without making a 6 bit K-Map, we decided to write out the expressions when the :value goes from 1 -> 0 and 0 -> 1. It would have been smart to realize that what we derived were the inputs into a JK flip flop. In the moment however we derived an expression to turn this into a few gates whose output then goes into a standard D-Flip-Flop 
![alt_text](images/image5.png "image_tooltip")



![alt_text](images/image6.png "image_tooltip")



# ReactionGame.v


![alt_text](images/image7.png "image_tooltip")



![alt_text](images/image8.png "image_tooltip")



### **Functionality**



* The overall functionality of this file is the top level hierarchy over where everything is connected. Everything from every sub-module register to the Full-State Machine.


### **Referenced Files**



* **Regfile.v: **Manages the register-file states, with 5 values it can store. # of runs, and then each score of all four runs
* **Fullstate.v:** Is the state machine that controls every module.
* **Seven_seg_decoder_bus.v:** Takes a binary number and outputs it into a bus that it can be displayed using seven segments.
* **elevenButUpCount.v:** Counts to four seconds. That is the amount of time switching from red LED to green. Letting the player know when to press the button.
* **devideByFiftyThousandCounter.v:** Generate a slower clock that allows us to track time in milliseconds instead of default board clock speeds. 
* **twoBitUpCounterREAL.v: **This is a 2-bit up counter that simply tracks the sequence 1,2,3,4… We used this to keep track of what runs counter the user is on.


#### **Hierarchy tree**


    Reaction_Time_Game.v (Top-level module)


    |


    |-- Regfile.v


    |   |-- fullAddSubtract.v


    |   |-- mux3_8.v


    |   |-- equals13bit.v


    |


    |-- Fullstate.v


    |   |--


    |


    |-- Seven_seg_decoder_bus.v


    |   |-- seven_seg_decoder_enable.v


    |


    |-- ElevenBitUpCount.v


    |   |-- 


    |


    |-- DivideByFiftyThousandCounter.v


    |   |-- 


    |


    |-- TwoBitUpCounterREAL.v


        |-- fullAddSubtract.v


        |-- equals15bit.v


# Register-File

The next most significant component of our project is our register file. Our register file was initially planned to have six, thirteen-bit values in it in the following arrangement:


<table>
  <tr>
   <td>0x0
   </td>
   <td># of runs
   </td>
  </tr>
  <tr>
   <td>0x1
   </td>
   <td>First run score
   </td>
  </tr>
  <tr>
   <td>0x2
   </td>
   <td>Second run score
   </td>
  </tr>
  <tr>
   <td>0x3
   </td>
   <td>Third run score
   </td>
  </tr>
  <tr>
   <td>0x4
   </td>
   <td>Fourth run score
   </td>
  </tr>
  <tr>
   <td><del>0x5</del>
   </td>
   <td><del>Average run score</del>
   </td>
  </tr>
</table>


Due to our time constraints we decided not to have the average value in our project, as we could not implement it in time. We decided to have two read ports on our register file, the reason for that being so that we can output the run counter on one display and whatever score we want to show at the moment on the other 4 displays. We chose to do four runs because if we had time to implement the average functionality, we wouldn't have to deal with division and instead could just bitshift our sum over 2 bits to divide by four. One write port was primarily used to update the scores whenever a new run was completed. However, that same write port was also used to keep track of the iteration of the state machine that we were on. This was helpful as we wanted to stop running this loop after 4 runs, and we could check if the value in the register file at 0x0 was equal to four in our logic of what state to go to next. Below is the Verilog for the register file, which was mainly made following Lab 12 as a guide:


![alt_text](images/image9.png "image_tooltip")


In the Full State Machine, we increment 0x0, which stores the number of runs and every single loop to track which score to put where in the register file. We control when we write to the registers, waiting for the counter to be done before we write it to the file. We do this by controlling the Register load bit.


# Addition

To do the operation, increment the “run counter” (value in registry at 0x0). We used a full adder. We needed this component for the testing and attempted the implementation of a binary to base 10 converter. Because of that need, we implemented a full adder-subtractor circuit. The verilog for the full adder is shown below:


![alt_text](images/image10.png "image_tooltip")


The full adder is a component that is used in the 13-bit full adder, which is the following image:


![alt_text](images/image11.png "image_tooltip")


Then, our last image gets wrapped around our 13-bit full adder to convert it into an adder subtractor circuit.


![alt_text](images/image12.png "image_tooltip")



# Displaying scores

When we looked at how we could display our scores, we originally wanted to display our data in base 10. To do that we identified the necessary operations to do such a thing. We need to get the remainder of the value when it is divided by ten, then divide by ten and make that the new value. We would need to do that four times. The necessary operations to accomplish this task are essential addition and subtraction, multiplication by ten, and division by ten. Multiplication by ten is needed to get the remainder, as you can subtract the quotient * 10 from the original value to get the remainder. This all works great in theory, but we could not divide by ten to work on our project. Our approach to dividing by ten was to use bitshifts. The formula that we followed was: (X / x^3) - (X/2^4) + X/(2^5). We are pretty sure that using bit shifts and getting an approximation caused the overall expression to generate overflows that we weren’t expecting. As a result, the formula did not work as intended. We could not represent values in base ten. We theorized another solution to this problem: a state machine repeatedly subtracting ten until the value is less than 0. While we believe that the logic for this approach was sound, we did not have the time to implement such a solution as that would essentially be an entire project. The proposed solution would require three 13-bit registers, a state machine, and good knowledge of how timing plays a role in data analysis. Due to these reasons, we elected not to include it in the final version of our project. However, it is something that we would love to pursue more of in the future. 

Our FSM for division derivation and logic: 


## **Counting**


### Converting clocks to milliseconds

The DE2-115 board has a 50 megahertz clock. This means it will oscillate 50,000,000 times every second. Let's step it down to 1 kilohertz. We can use counters to divide by ten effectively. This will help us get the clock down via the circuit below. We “NAND-ed” each high bit in the binary representation of 50,000 together and took that output to the CLRN. This will restart the clock whenever we hit 50,000. This led to some challenges in this project as, while the board is said to have a 50mhz clock, we got some variability and unpredictable or undefined behavior to occur for us. Further, we had a hard time testing that this was working correctly, however, we think it is close enough for our needs. 


![drawing](https://docs.google.com/drawings/d/12345/export/png)


## **Managing the “wait” period**

When the user presses the button to start the next round, we wait for a select amount of time. The amount of time that we will stay is about 4 seconds as we count for 11 bits, and then when we hit all high, we pause counting. Then, in the full-state machine, we will reset the counter if we have all high values and move on to the next state. At the point we got to in the project, we decided to stick with a simple up counter. However, we were initially thinking about having the wait duration be sudo random and having different durations stored in the register file that we could select between and maybe modify based on the player’s past score. While that would have been a super exciting addition, it was out of the scope of our project.


## **Getting the reaction speed of the user**

We can take advantage of counters to get the user's reaction speed. When the button is pressed, we can start synchronous counters, which should count time in the number of clocks. Then, when the reaction button is pressed, we freeze the counter immediately. After that we will then move to the next state where it saves the information in two of the 5 of the register file storage. The first number being the reaction time, will go in 0x03. Whereas the second number updating the run counter will go to 0x04.


# Undefined behavior

There is a lot of undefined behavior that could arise in our circuit. Given a greater scope for the project we would handle addition/subtraction overflows, as well as button debouncing. Both of these things would make our project more consistent and enjoyable, and while we have the space and structure to add these things in the future, we have yet to add them. 
