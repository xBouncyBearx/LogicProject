`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:49:49 12/20/2024 
// Design Name: 
// Module Name:    StateToCapacity 
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
module StateToCapacity(
    input [3:0] state,
    output reg [3:0] Capacity,
    output reg isFull
);

    always @(*) begin
        Capacity[3] = 1'b0;
        Capacity[2] = ~state[0] & ~state[1] & ~state[2] & ~state[3];
        Capacity[1] = (~state[3] & state[2] & ~state[1]) | (~state[2] & ~state[1] & ~state[0]) | (state[3] & ~state[2] & ~state[1]) | (~state[3] & ~state[2] & state[0]) | (~state[3] & state[1] & ~state[0]) | (state[3] & ~state[2] & ~state[0]);
        Capacity[0] = state[0] ^ state[1] ^ state[2] ^ state[3];

        if (Capacity == 4'b0000) begin
            isFull = 1;
        end else begin
            isFull = 0;
        end
    end

endmodule
