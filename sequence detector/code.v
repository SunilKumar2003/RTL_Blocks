`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.02.2025 15:05:24
// Design Name: 
// Module Name: code
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


module seq_detector(x, clk, reset, z

    );
    input x, clk, reset;
    output reg z;
    parameter A=0, B=1, C=2, D=3,E=4,F=5;
    reg [2:0] PS, NS;
    always @(posedge clk or posedge reset)
    if (reset) PS <= A;
    else PS <= NS;
    always @(PS,x)
        case(PS)
           A : begin 
           z = x ? 0 :0;
           NS = x ? B:A;
           end
           B : begin 
           z = x ? 0 :0;
           NS = x ? B:C;
           end
           C : begin 
           z = x ? 0 :0;
           NS = x ? B:D;
           end
           D : begin 
           z = x ? 0 :0;
           NS = x ? E:A;
           end
           E : begin 
           z = x ? 0 :0;
           NS = x ? F:C;
           end
           F : begin
           z = x ? 0 :1;
           NS = x ? B:C; 
           end
           endcase
            
    
endmodule
