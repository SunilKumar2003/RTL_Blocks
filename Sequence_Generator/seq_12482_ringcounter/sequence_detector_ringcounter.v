`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.01.2026 16:52:29
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


module top(input clk,input rst,output [3:0] y

    );
    
    wire t0,t1,t2,t3,t4;
    wire e;
    
    assign t0 = ~y[3]&~y[2]&~y[0]&(e~^y[2]);
    assign t1 = ~y[3]&~y[1]&((~e&~y[2]&y[0])|(e&y[2]&~y[0]));
    assign t2 = ~e & ~y[2]&~y[0]&(y[1]^y[3]);
    assign t3 = ~e&~y[3]&y[2]&~y[1]&~y[0];
    assign t4 = ~y[1]&~y[0]&((~e&y[3]&~y[2])| (e&~y[3]&y[2]));
    
    dff m0(clk,t0,rst,y[0]);
    dff m1(clk,t1,rst,y[1]);
    dff m2(clk,t2,rst,y[2]);
    dff m3(clk,t3,rst,y[3]);
    
    dff m4(clk,t4,rst,e);
    
    
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


