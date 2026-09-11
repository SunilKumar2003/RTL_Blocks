`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.02.2026 15:26:46
// Design Name: 
// Module Name: ha
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


module ha(
    input  ain, bin,
    output s, c  // Do NOT put 'reg' here
);
    // Gate primitives automatically drive 's' and 'c' as wires
    xor (s, ain, bin); 
    and (c, ain, bin); 
endmodule
