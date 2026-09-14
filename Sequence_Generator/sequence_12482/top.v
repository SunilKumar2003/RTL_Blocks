`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.01.2026 15:24:17
// Design Name: 
// Module Name: top
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


module top(input clk,input rst,output  wire [3:0] s

    );
    
    wire [2:0] o;
    
    mod_six m0(clk,rst,o);
    
    assign s[0] = ~(o[0]|o[1]|o[2]);
    assign s[1] = ~o[1]&o[0];
    assign s[2] = ~o[0] &(o[2]^o[1]);
    assign s[3] = ~o[2]& o[1] &o[0];
    
    
endmodule
