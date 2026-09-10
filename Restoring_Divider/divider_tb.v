`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.08.2026 19:35:20
// Design Name: 
// Module Name: divider_tb
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


module divider_tb(

    );
    
    reg[6:0] n;
    reg[3:0] d;
    wire[3:0] q,r;
    divider_top DUT(n,d, q, r);
    
    initial begin
    n=7'd50;
    d=4'd10;
    #10;
    n=7'd127;
    d=4'd8;
    #10;
    n=7'd127;
    d=4'd15;
    #10;
     n=7'd120;
    d=4'd10;
    #10
    n=7'd20;
    d=4'd10;
    #10;
    n=7'd20;
    d=4'd4;
   
    #10;
    $finish;
    end
    
endmodule
