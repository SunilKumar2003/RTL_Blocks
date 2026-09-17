`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.02.2025 15:16:34
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
    reg clk, x, reset; wire z;
    seq_detector SEQ (x, clk, reset, z);
    
    initial
    begin 
    clk=1'b0;
    reset = 1'b1;
    #1 reset = 1'b0;
    end
    
    always #5 clk = ~clk;
    
    initial 
    begin 
    #2 x = 0;
    #10 x = 1;#10 x = 0;#10 x = 0;#10 x = 1;#10 x = 1;#10 x = 0;
    #10 x = 1;#10 x = 0;#10 x = 0;#10 x = 1;#10 x = 1;#10 x = 0;
    #10 x = 1;#10 x = 0;#10 x = 1;#10 x = 1;#10 x = 0;
    #10 $finish;
    end
    
endmodule
