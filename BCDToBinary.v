`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:09:41 12/20/2024 
// Design Name: 
// Module Name:    BCDToBinary 
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
module BCDToBinary(
    input [3:0]BCD,
    output reg [1:0]Binary
    );
	 
	 case(BCD) begin
			4'b0100:
				Binary <= 2'b11;
			4'b0011:
				Binary <= 2'b10;
			4'b0010:
				Binary <= 2'b01;
			4'b0001:
				Binary <= 2'b00;


endmodule
