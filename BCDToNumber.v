`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:15:43 12/20/2024 
// Design Name: 
// Module Name:    BCDToNumber 
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
module BCDToNumber(
	 input [3:0]BCD,
	 output Number
    );

	 case(BCD) begin
			4'b0100:
				Number = 3;
			4'b0011:
				Number = 2;
			4'b0010:
				Number = 1;
			4'b0001:
				Number = 0;
	 end

endmodule
