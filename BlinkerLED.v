`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:17:56 12/26/2024 
// Design Name: 
// Module Name:    BlinkerLED 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
//module BlinkerLED(
//    input clk,
//    output reg doorOpen
//);
//
//    parameter COUNT_MAX = 50000000;
//    reg [25:0] counter;
//    reg [1:0] BlinkCounter;
//    reg [1:0] State;
//
//    initial begin
//        counter = 0;
//        BlinkCounter = 0;
//        doorOpen = 1'b1;
//        State = 0;
//    end
//
//    always @(posedge clk) begin
//        if (State == 0) begin
//            counter <= 0;
//            BlinkCounter <= 0;
//            doorOpen <= 1'b1;
//            State <= 1;
//        end else if (State == 1 && BlinkCounter < 3) begin
//            if (counter < COUNT_MAX) begin
//                counter <= counter + 1'b1;
//            end else begin
//                counter <= 0;
//                doorOpen <= ~doorOpen;
//                if (doorOpen == 1'b0) begin
//                    BlinkCounter <= BlinkCounter + 1;
//                end
//            end
//        end
//    end
//endmodule


module BlinkerLED(
    input clk,
    output reg doorOpen
);

    parameter COUNT_MAX = 50000000;
    reg [25:0] counter;
    reg [1:0] BlinkCounter;

    always @(posedge clk) begin
        if (BlinkCounter < 3) begin
            if (counter < COUNT_MAX) begin
                counter <= counter + 1'b1;
            end else begin
                counter <= 26'd0;
                doorOpen <= ~doorOpen;
                if (doorOpen == 1'b0) begin
                    BlinkCounter <= BlinkCounter + 1;
                end
            end
        end
    end
endmodule
