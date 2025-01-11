`timescale 1ns / 1ps

module FSM(
    input clk,
    input reset,
    input enter,
    input exit,
    input [1:0] exitLocation,
    output reg doorOpen,
    output reg isFull,
    output reg [6:0] Capacity,
    output reg [6:0] nextParking,
    output reg [3:0] state,
	 output reg [3:0] CapacityBCD,
	 output reg [3:0] nextParkingBCD
);

    initial begin
        isFull = 1'b0;
        state = 4'b0000;
        doorOpen = 1'b0;
		  CapacityBCD = 4'b0100;
		  nextParkingBCD = 4'b0001;
    end

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            state <= 4'b0000;
            doorOpen <= 1'b0;
        end else if (enter && ~exit) begin
            if (isFull == 1'b0) begin
					 doorOpen <= 1'b1;
                case(state)
                    4'b0000 : state <= 4'b0001;
                    4'b0001 : state <= 4'b0011;
                    4'b0010 : state <= 4'b0011;
                    4'b0011 : state <= 4'b0111;
                    4'b0100 : state <= 4'b0101;
                    4'b0101 : state <= 4'b0111;
                    4'b0110 : state <= 4'b0111;
                    4'b0111 : state <= 4'b1111;
                    4'b1000 : state <= 4'b1001;
                    4'b1001 : state <= 4'b1011;
                    4'b1010 : state <= 4'b1011;
                    4'b1011 : state <= 4'b1111;
                    4'b1100 : state <= 4'b1101;
                    4'b1101 : state <= 4'b1111;
                    4'b1110 : state <= 4'b1111;
                endcase
                //BlinkerLED (clk, doorOpen);
            end else begin /*BlinkerLED (clk, isFull);*/ end
        end else if (exit && ~enter) begin
				case(exitLocation)
						2'b00 : if(state[0] == 1) begin state[0] = 1'b0; doorOpen <= 1'b1; /*BlinkerLED (clk, doorOpen);*/ end
						2'b01 : if(state[1] == 1) begin state[1] = 1'b0; doorOpen <= 1'b1; /*BlinkerLED (clk, doorOpen);*/ end
						2'b10 : if(state[2] == 1) begin state[2] = 1'b0; doorOpen <= 1'b1; /*BlinkerLED (clk, doorOpen);*/ end
						2'b11 : if(state[3] == 1) begin state[3] = 1'b0; doorOpen <= 1'b1; /*BlinkerLED (clk, doorOpen);*/ end
				endcase
				
				
		  end
	 
	 end
	 
	 always @(negedge clk) begin
			StateToCapacity (state, CapacityBCD);
			StateToNextParking (state, nextParkingBCD);
			if(state == 4'b1111) isFull <= 1'b1;
			else isFull <= 1'b0;
			doorOpen <= 1'b0;
			//BCDto7Segment np7s(nextParkingBCD, nextParking);
			//BCDto7Segment c7s(CapacityBCD, Capacity);
	 end
	 
	 task StateToCapacity(
        input [3:0] state,
        output reg [3:0] Capacity
    );

        begin
            Capacity[3] = 1'b0;
            Capacity[2] = ~state[0] & ~state[1] & ~state[2] & ~state[3];
            Capacity[1] = (state[2] & ~state[1] & ~state[0]) | (~state[3] & ~state[1] & state[0]) | (~state[3] & ~state[2] & state[1]) | (~state[3] & state[1] & ~state[0]) | (state[3] & ~state[2] & ~state[1]) | (state[3] & ~state[2] & ~state[0]);
            Capacity[0] = state[0] ^ state[1] ^ state[2] ^ state[3];
        end

    endtask
	 
    task StateToNextParking(
        input [3:0] state,
        output reg [3:0] NextParking
    );

        begin
            NextParking[3] = 1'b0;
            NextParking[2] = state[0] & state[1] & state[2] & ~state[3];
            NextParking[1] = state[0] & (~state[1] | ~state[2]);
            NextParking[0] = ~state[0] | (~state[2] & state[1]);
        end

    endtask
	 
	 task BCDto7Segment(
        input [3:0] BCD,
        output reg [6:0] Segments
    );

        begin
            case (BCD)
                4'b0000: Segments <= 7'b0111111;
                4'b0001: Segments <= 7'b0000110;
                4'b0010: Segments <= 7'b1011011;
                4'b0011: Segments <= 7'b1001111;
                4'b0100: Segments <= 7'b1100110;

                default: Segments <= 7'b1001111;
            endcase
        end

    endtask
	 
//	 task BlinkerLED(
//        input clk,
//        output reg doorOpen
//    );
//
//        parameter COUNT_MAX = 50000000;
//        reg [25:0] counter;
//        reg [1:0] BlinkCounter;
//
//        begin
//            if (BlinkCounter < 3) begin
//                if (counter < COUNT_MAX) begin
//                    counter <= counter + 1'b1;
//                end else begin
//                    counter <= 26'd0;
//                    doorOpen <= ~doorOpen;
//                    if (doorOpen == 1'b0) begin
//                        BlinkCounter <= BlinkCounter + 1;
//                    end
//                end
//            end
//        end
//    endtask


	 always @(posedge clk or posedge reset) begin
        if (reset) begin
            blinkLED <= 1'b0;
            blinkCounter <= 0;
            blinkState <= 0;
        end else if (doorOpen) begin
            if (blinkState < 3) begin // Blink 3 times
                if (blinkCounter < 2) begin // Adjust for your FPGA clock speed
                    blinkCounter <= blinkCounter + 1;
                end else begin
                    blinkCounter <= 0;
                    blinkLED <= ~blinkLED; // Toggle LED
                    if (blinkLED) blinkState <= blinkState + 1; // Increment blinkState on LED off
                end
            end else begin
                blinkLED <= 1'b0; // Ensure LED is off after blinking
                blinkState <= 0;
                doorOpen <= 1'b0; // Close door after blinking
            end
        end else begin
            blinkLED <= 1'b0;
            blinkCounter <= 0;
            blinkState <= 0;
        end
    end

	 
endmodule






