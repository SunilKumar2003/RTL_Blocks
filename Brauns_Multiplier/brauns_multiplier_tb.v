`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.09.2026 11:06:00
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
    reg [5:0] a,b;
    wire [11:0] y;
    multiplier DUT(a,b,y);
    
    initial 
    begin
    #10;
    a=5'd5;b=5'd5;
    #10;
    a=5'd31;b=5'd31;
    #10;
    a=5'd15;b=5'd12;
    #10;
    a=5'd10;b=5'd10;
    #10
    $finish;
    end
endmodule
