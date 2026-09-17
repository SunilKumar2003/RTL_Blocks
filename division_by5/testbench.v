`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.02.2025 15:14:08
// Design Name: 
// Module Name: testbench
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


module testbench(

    );
    reg x,clk,reset;
    wire z;
    code DUT(x,clk,reset,z);
    
    initial 
    begin 
    clk = 1'b0;
    reset = 1'b1;
    #5 reset = 1'b0;
    end 
    
    always #5 clk =~clk;
    
    initial 
    begin 
    x=1'b1;
    #12 x=1'b0;
    #5 x = 1'b1;#5 x = 1'b0;#5 x = 1'b1;#5 x = 1'b1;#5 x = 1'b1;#5 x = 1'b1;#5 x = 1'b1;
    #5 x = 1'b1;#5 x = 1'b1;#5 x = 1'b0;#5 x = 1'b1;#5 x = 1'b1;#5 x = 1'b1;#5 x = 1'b1;
    #5 $finish;
    end
   
endmodule
