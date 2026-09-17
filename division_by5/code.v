`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.02.2025 15:01:44
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


module code(x,clk,reset,z

    );
    input x,clk,reset;
    output reg z;
    parameter S0=0,S1=1,S2=2,S3=3,S4=4;
    reg[2:0] PS,NS;
    always @(posedge clk or posedge reset)
    if (reset) PS<=S0;
    else PS<=NS;
    
    always @(PS,x)
        case(PS)
        S0:
        begin
        z= x ? 0:1;
        NS= x ? S1:S0;
        end 
        S1:
        begin
        z= x ? 0:0;
        NS= x ? S3:S2;
        end
        S2:
        begin
        z= x ? 1:0;
        NS= x ? S0:S4;
        end
        S3:
        begin
        z= x ? 0:0;
        NS= x ? S2:S1;
        end
        S4:
        begin
        z= x ? 0:0;
        NS= x ? S4:S3;
        end
        endcase 
   
   
endmodule
