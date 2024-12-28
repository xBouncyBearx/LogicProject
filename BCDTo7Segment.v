`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:36:25 12/27/2024 
// Design Name: 
// Module Name:    BCDTo7Segment 
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
module BCDto7Segment(
    input [3:0] BCD,
    output reg [6:0] Segments
);

    always @(*) begin
        case (BCD)
            4'b0000: Segments <= 7'b0111111;
            4'b0001: Segments <= 7'b0000110;
            4'b0010: Segments <= 7'b1011011;
            4'b0011: Segments <= 7'b1001111;
            4'b0100: Segments <= 7'b1100110;

            default: Segments = 7'b0000000;
        endcase
    end

endmodule
