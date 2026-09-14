`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.01.2026 14:57:36
// Design Name: 
// Module Name: main
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



module mod_six(input clk,input wire rst_ext,output [2:0] o

    );
    
    wire t1,t2,t3,r,rst;
    assign t1 = o[0] ^o[1];
    assign t2 = o[2] ^(o[0]&o[1]);
    assign rst = (o[2] & ~o[1] & o[0])|rst_ext ;
   
    
    dff do(clk,~o[0],rst,o[0]);
    dff d1(clk,t1,rst,o[1]);
    dff d2(clk,t2,rst,o[2]);
    
    
endmodule

module dff(input clk,input d,input rst,output reg q);
    
    always @(posedge clk)
    begin 
    if (rst == 1'b1)
    q<=1'b0;
    else
    q<=d;
    end
endmodule