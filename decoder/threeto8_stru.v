`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.01.2025 16:00:39
// Design Name: 
// Module Name: threeto8_stru
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


module threeto8_stru(out,in,sel

    );
    input in;
    input[2:0] sel;
    output[7:0] out;
    
    and G1(out[0],~sel[2],~sel[1],~sel[0]);
    and G2(out[1],~sel[2],~sel[1],sel[0]);
    and G3(out[2],~sel[2],sel[1],~sel[0]);
    and G4(out[3],~sel[2],sel[1],sel[0]);
    and G5(out[4],sel[2],~sel[1],~sel[0]);
    and G6(out[5],sel[2],~sel[1],sel[0]);
    and G7(out[6],sel[2],sel[1],~sel[0]);
    and G8(out[7],sel[2],sel[1],sel[0]);
    
        
endmodule
