`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:48:38 12/20/2024 
// Design Name: 
// Module Name:    StateToNextParking 
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
module StateToNextParking(
    input [3:0] state,
    output reg [3:0] NextParking
);

    always @(*) begin
        NextParking[3] = 1'b0;
        NextParking[2] = state[0] & state[1] & state[2] & ~state[3];
        NextParking[1] = state[0] & (~state[1] | ~state[2]);
        NextParking[0] = ~state[0] | (~state[2] & state[1]);
    end

endmodule

