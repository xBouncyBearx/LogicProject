`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:38:39 01/11/2025
// Design Name:   fsm2
// Module Name:   C:/Users/hosse/Desktop/Logic/Parking/blinkerTB.v
// Project Name:  Parking
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: fsm2
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module blinkerTB;

	// Inputs
	reg clk;
	reg reset;
	reg enter;
	reg exit;
	reg [1:0] exitLocation;

	// Outputs
	wire doorOpen;
	wire isFull;
	wire [6:0] Capacity;
	wire [6:0] nextParking;
	wire [3:0] state;
	wire [3:0] CapacityBCD;
	wire [3:0] nextParkingBCD;
	wire blinkLED;

	// Instantiate the Unit Under Test (UUT)
	fsm2 uut (
		.clk(clk), 
		.reset(reset), 
		.enter(enter), 
		.exit(exit), 
		.exitLocation(exitLocation), 
		.doorOpen(doorOpen), 
		.isFull(isFull), 
		.Capacity(Capacity), 
		.nextParking(nextParking), 
		.state(state), 
		.CapacityBCD(CapacityBCD), 
		.nextParkingBCD(nextParkingBCD), 
		.blinkLED(blinkLED)
	);
	
	initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
   end

	initial begin
		// Initialize Inputs
		reset = 0;
		enter = 0;
		exit = 0;
		exitLocation = 0;

		// Wait 100 ns for global reset to finish
		#100;
		
		enter = 1;
		#10;
		
		enter = 0;
		
		
		
        
		// Add stimulus here

	end
      
endmodule

