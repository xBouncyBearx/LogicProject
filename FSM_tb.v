`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   00:40:19 12/27/2024
// Design Name:   FSM
// Module Name:   C:/Users/hosse/Desktop/Logic/Parking/FSM_tb.v
// Project Name:  Parking
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: FSM
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module FSM_tb;

    reg clk;
    reg reset;
    reg enter;
    reg exit;
    reg [1:0] exitLocation;
    wire doorOpen;
    wire isFull;
    wire [6:0] Capacity;
    wire [6:0] nextParking;
    wire [3:0] state;
	 wire [3:0] CapacityBCD;
	 wire [3:0] nextParkingBCD;

    // ?????????? ?? ????? FSM
    FSM uut (
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
		  .nextParkingBCD(nextParkingBCD)
    );
	 
	 initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize inputs
        reset = 0;
        enter = 0;
        exit = 0;
        exitLocation = 2'b00;

        // Apply reset
        reset = 1;
        #10;
        reset = 0;

        // Check initial state
        #10;
        $display("Initial state: state=%b, doorOpen=%b, isFull=%b, CapacityBCD=%d, nextParkingBCD=%d",
                 state, doorOpen, isFull, CapacityBCD, nextParkingBCD);

        // Test enter sequence
       enter = 1;
      exit=0;
      exitLocation = 2'b00;
        #10;
       
        $display("After 1st enter: state=%b, doorOpen=%b, isFull=%b, CapacityBCD=%d, nextParkingBCD=%d",
                 state, doorOpen, isFull, CapacityBCD, nextParkingBCD);

        enter = 1;
      exit=0;
      exitLocation = 2'b01;
        #10;
       
        $display("After 2nd enter: state=%b, doorOpen=%b, isFull=%b, CapacityBCD=%d, nextParkingBCD=%d",
                 state, doorOpen, isFull, CapacityBCD, nextParkingBCD);

        enter = 0;
      exit=0;
      exitLocation = 2'b01;
        #10;
      
        $display("After 3rd enter: state=%b, doorOpen=%b, isFull=%b, CapacityBCD=%d, nextParkingBCD=%d",
                 state, doorOpen, isFull, CapacityBCD, nextParkingBCD);

        enter = 1;
      exit=0;
      exitLocation = 2'b11;
        #10;
       
        $display("After 4th enter: state=%b, doorOpen=%b, isFull=%b, CapacityBCD=%d, nextParkingBCD=%d",
                 state, doorOpen, isFull, CapacityBCD, nextParkingBCD);

        enter = 0;
      exit=1;
      exitLocation = 2'b01;
        #10;
       
        $display("After 1st exit (location 0): state=%b, doorOpen=%b, isFull=%b, CapacityBCD=%d, nextParkingBCD=%d",
                 state, doorOpen, isFull, CapacityBCD, nextParkingBCD);

        enter = 1;
      exit=0;
      exitLocation = 2'b00;
        #10;
      
        $display("After 2nd exit (location 1): state=%b, doorOpen=%b, isFull=%b, CapacityBCD=%d, nextParkingBCD=%d",
                 state, doorOpen, isFull, CapacityBCD, nextParkingBCD);
        
      enter = 0;
      exit=1;
      exitLocation = 2'b00;
        #10;
      
        $display("After 2nd exit (location 1): state=%b, doorOpen=%b, isFull=%b, CapacityBCD=%d, nextParkingBCD=%d",
                 state, doorOpen, isFull, CapacityBCD, nextParkingBCD);

      enter = 0;
      exit=1;
      exitLocation = 2'b00;
        #10;
      
        $display("After 2nd exit (location 1): state=%b, doorOpen=%b, isFull=%b, CapacityBCD=%d, nextParkingBCD=%d",
                 state, doorOpen, isFull, CapacityBCD, nextParkingBCD);


      enter = 1;
      exit=0;
      exitLocation = 2'b01;
        #10;
      
        $display("After 2nd exit (location 1): state=%b, doorOpen=%b, isFull=%b, CapacityBCD=%d, nextParkingBCD=%d",
                 state, doorOpen, isFull, CapacityBCD, nextParkingBCD);




      enter = 1;
      exit=0;
      exitLocation = 2'b00;
        #10;
      
        $display("After 2nd exit (location 1): state=%b, doorOpen=%b, isFull=%b, CapacityBCD=%d, nextParkingBCD=%d",
                 state, doorOpen, isFull, CapacityBCD, nextParkingBCD);


      enter = 1;
      exit=0;
      exitLocation = 2'b11;
        #10;
      
        $display("After 2nd exit (location 1): state=%b, doorOpen=%b, isFull=%b, CapacityBCD=%d, nextParkingBCD=%d",
                 state, doorOpen, isFull, CapacityBCD, nextParkingBCD);


      enter = 1;
      exit=0;
      exitLocation = 2'b00;
        #10;
      
        $display("After 2nd exit (location 1): state=%b, doorOpen=%b, isFull=%b, CapacityBCD=%d, nextParkingBCD=%d",
                 state, doorOpen, isFull, CapacityBCD, nextParkingBCD);

    enter = 0;
      exit=0;
      exitLocation = 2'b00;
        #10;
      
        $display("After 2nd exit (location 1): state=%b, doorOpen=%b, isFull=%b, CapacityBCD=%d, nextParkingBCD=%d",
                 state, doorOpen, isFull, CapacityBCD, nextParkingBCD);


      enter = 0;
      exit=1;
      exitLocation = 2'b00;
        #10;
      
        $display("After 2nd exit (location 1): state=%b, doorOpen=%b, isFull=%b, CapacityBCD=%d, nextParkingBCD=%d",
                 state, doorOpen, isFull, CapacityBCD, nextParkingBCD);

      enter = 0;
      exit=0;
      exitLocation = 2'b11;
        #10;
      
        $display("After 2nd exit (location 1): state=%b, doorOpen=%b, isFull=%b, CapacityBCD=%d, nextParkingBCD=%d",
                 state, doorOpen, isFull, CapacityBCD, nextParkingBCD);

      enter = 0;
      exit=1;
      exitLocation = 2'b10;
        #10;
      
        $display("After 2nd exit (location 1): state=%b, doorOpen=%b, isFull=%b, CapacityBCD=%d, nextParkingBCD=%d",
                 state, doorOpen, isFull, CapacityBCD, nextParkingBCD);

      enter = 0;
      exit=1;
      exitLocation = 2'b11;
        #10;
      
        $display("After 2nd exit (location 1): state=%b, doorOpen=%b, isFull=%b, CapacityBCD=%d, nextParkingBCD=%d",
                 state, doorOpen, isFull, CapacityBCD, nextParkingBCD);

      enter = 0;
      exit=1;
      exitLocation = 2'b01;
        #10;
      
        $display("After 2nd exit (location 1): state=%b, doorOpen=%b, isFull=%b, CapacityBCD=%d, nextParkingBCD=%d",
                 state, doorOpen, isFull, CapacityBCD, nextParkingBCD);

      enter = 0;
      exit=0;
      exitLocation = 2'b00;
        #10;
      
        $display("After 2nd exit (location 1): state=%b, doorOpen=%b, isFull=%b, CapacityBCD=%d, nextParkingBCD=%d",
                 state, doorOpen, isFull, CapacityBCD, nextParkingBCD);

        // Test reset during operation
        reset = 1;
        #10;
        reset = 0;
        #10;
        $display("After reset: state=%b, doorOpen=%b, isFull=%b, CapacityBCD=%d, nextParkingBCD=%d",
                 state, doorOpen, isFull, CapacityBCD, nextParkingBCD);

        $stop;
    end

endmodule
