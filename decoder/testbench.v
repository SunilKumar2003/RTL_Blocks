`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.01.2025 15:59:19
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
    
    
    initial 
    begin
    #5 S=4'd8;
    #5 S=4'd5;
    #5 S=4'd3;
    #5 S=4'd0;
    #5 S=4'd4;
    #5 $finish
    
    
    end
endmodule
