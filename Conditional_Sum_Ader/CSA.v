`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.09.2026 01:23:54
// Design Name: 
// Module Name: CSA
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


module CSA_8(input [7:0]a, input [7:0]b, output [8:0]sum);

wire c1, c2, c3, c4, c5, c6, c7;
wire c10, c11, s10, s11;
wire c20, c21, s20, s21;
wire c30, c31, s30, s31;
wire c40, c41, s40, s41;
wire c50, c51, s50, s51;
wire c60, c61, s60, s61;
wire c70, c71, s70, s71;

ha HA0(a[0], b[0], c1, sum[0]);

cc CC1(a[1], b[1], c10, c11, s10, s11);
mux MUX_S1(sum[1], s10, s11, c1);
mux MUX_C1(c2, c10, c11, c1);

cc CC2(a[2], b[2], c20, c21, s20, s21);
mux MUX_S2(sum[2], s20, s21, c2);
mux MUX_C2(c3, c20, c21, c2);

cc CC3(a[3], b[3], c30, c31, s30, s31);
mux MUX_S3(sum[3], s30, s31, c3);
mux MUX_C3(c4, c30, c31, c3);

cc CC4(a[4], b[4], c40, c41, s40, s41);
mux MUX_S4(sum[4], s40, s41, c4);
mux MUX_C4(c5, c40, c41, c4);

cc CC5(a[5], b[5], c50, c51, s50, s51);
mux MUX_S5(sum[5], s50, s51, c5);
mux MUX_C5(c6, c50, c51, c5);

cc CC6(a[6], b[6], c60, c61, s60, s61);
mux MUX_S6(sum[6], s60, s61, c6);
mux MUX_C6(c7, c60, c61, c6);

cc CC7(a[7], b[7], c70, c71, s70, s71);
mux MUX_S7(sum[7], s70, s71, c7);
mux MUX_C7(sum[8], c70, c71, c7);

endmodule


module cc(input a,input b, output c0, output c1, output s0, output s1);

and g1(c0, a, b);
or g2(c1, a, b);
xor g3(s0, a, b);
xnor g4(s1, a, b);

endmodule


module ha(input a,input b, output c, output s);

and g5(c, a, b);
xor g6(s, a, b);

endmodule


module mux(output Y, input a, input b, input S);


wire Sbar, T1, T2;

not g7(Sbar, S);
and g8(T1, a, Sbar);
and g9(T2, b, S);
or g10(Y, T1, T2);

endmodule