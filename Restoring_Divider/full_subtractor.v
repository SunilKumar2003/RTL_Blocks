`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.08.2026 15:13:55
// Design Name: 
// Module Name: full_subtractor
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

module divider_pe(input n,d,bi,sel,output bout,diff);
    
    wire t1;
    full_subtractor fs(n,d,bi,t1,bout);
    mux m(t1,n,sel,diff);

endmodule


module full_subtractor(
    input  a,    // Minuend
    input  b,    // Subtrahend
    input  bi,   // Borrow In
    output  sub, // Difference/Subtracted output
    output  bout // Borrow Out
);

   assign sub  = a ^ b ^ bi;
   assign bout = (~a & b) | (~(a ^ b) & bi);

endmodule

module mux(input a,b,sel,output y);

    assign y = sel?b:a;

endmodule


