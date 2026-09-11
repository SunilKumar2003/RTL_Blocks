`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.02.2026 15:26:04
// Design Name: 
// Module Name: fa
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


module fa(input a,b,cin,output s,cout);
    wire t1,t2,t3;
    xor (t1,a,b);
    xor (s,t1,cin);
    and (t2,t1,cin);
    and (t3,a,b);
    or (cout,t2,t3);
endmodule
