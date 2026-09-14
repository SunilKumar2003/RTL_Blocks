`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.09.2026 02:17:54
// Design Name: 
// Module Name: BW_4
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


module BW_4(input [3:0]a, input [3:0]b, output [7:0]p);

wire pp00, pp10, pp20, pp30;
wire pp01, pp11, pp21, pp31;
wire pp02, pp12, pp22, pp32;
wire pp03, pp13, pp23, pp33;

wire c1, c2a, c2b, s2;
wire s31, s32, s33, c31a, c31b, c31c, c31d;
wire s41, s42, c41a, c41b, c41c;
wire s51, c51a, c51b;
wire s61, c61a, c62b;
wire c7;

wire a3bar, a2bar, a1bar, a0bar, b3bar, b2bar, b1bar, b0bar;

not n1(a3bar, a[3]);
not n2(b3bar, b[3]);
not n3(a2bar, a[2]);
not n4(b2bar, b[2]);
not n5(a1bar, a[1]);
not n6(b1bar, b[1]);
not n7(a0bar, a[0]);
not n8(b0bar, b[0]);

and g1(pp00, a[0], b[0]);

and g2(pp10, a[1], b[0]);
and g3(pp20, a[2], b[0]);
and g4(pp30, a[3], b0bar);

and g5(pp01, a[0], b[1]);
and g6(pp11, a[1], b[1]);
and g7(pp21, a[2], b[1]);
and g8(pp31, a[3], b1bar);

and g9(pp02, a[0], b[2]);
and g10(pp12, a[1], b[2]);
and g11(pp22, a[2], b[2]);
and g12(pp32, a[3], b2bar);

and g13(pp03, a0bar, b[3]);
and g14(pp13, a1bar, b[3]);
and g15(pp23, a2bar, b[3]);
and g16(pp33, a[3], b[3]);

buf g17(p[0], pp00);

ha H1(pp10, pp01, c1, p[1]);

ha H2(pp20, pp11, c2a, s2);
fa F1(s2, c1, pp02, c2b, p[2]);

ha H3(pp30, pp21, c31a, s31);
fa F2(s31, pp12, c2a, c31b, s32);
fa F3(s32, c2b, pp03, c31c, s33);
fa F4(s33, a[3], b[3], c31d, p[3]);

fa F5(pp31, pp22, c31a, c41a, s41);
fa F6(s41, c31b, pp13, c41b, s42);
fa F7(s42, c31c, c31d, c41c, p[4]);

fa F8(pp32, pp23, c41a, c51a, s51);
fa F9(s51, c41b, c41c, c51b, p[5]);

fa F10(pp33, a3bar, b3bar, c61a, s61);
fa F11(s61, c51a, c51b, c61b, p[6]);

fa F12(1'b1, c61a, c61b, c7, p[7]);

endmodule


module ha(input a, input b, output c, output s);

xor g1(s, a, b);
and g2(c, a, b);

endmodule


module fa(input a, input b, input cin, output cout, output s);

wire x1, x2, x3;

xor g3(x1, a, b);
xor g4(s, x1, cin);
and g5(x2, a, b);
and g6(x3, x1, cin);
or g7(cout, x2, x3);

endmodule