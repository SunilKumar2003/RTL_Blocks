`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.01.2025 15:41:16
// Design Name: 
// Module Name: three_to_eight_decoder
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module three_to_eight_decoder(out,sel

    );
    input[2:0] sel;
    output[7:0] out;
    
    assign out[sel] = 1'b1;
endmodule
