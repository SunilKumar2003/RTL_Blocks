`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.01.2026 15:07:42
// Design Name: 
// Module Name: tb
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

module tb(

    );
    
    reg clk,rst;
    wire[3:0] y;
    
    top DUT(clk,rst, y);
    
    initial clk =1'b0;
    always #5 clk = ~clk;
    
    initial 
    begin
    rst=0;
    #5 rst=1;
    #5 rst = 0;
    #500 $finish;
     end
    
endmodule
