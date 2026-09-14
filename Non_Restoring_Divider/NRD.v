`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.09.2026 21:24:08
// Design Name: 
// Module Name: NRD
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


module NRD(input [7:0]n, input [3:0]d, output [4:0]q, output [7:0]rem

    );
    wire [3:0]as;
    wire [2:0]ac;
    wire [4:0]bs;
    wire [3:0]bc;
    wire [5:0]cs;
    wire [4:0]cc;
    wire [6:0]ds;
    wire [5:0]dc;
    wire [6:0]ec;
    
    pe a1(n[4], d[0], 1, 1, as[0], ac[0]);
    pe a2(n[5], d[1], ac[0], 1, as[1], ac[1]);
    pe a3(n[6], d[2], ac[1], 1, as[2], ac[2]);
    pe a4(n[7], d[3], ac[2], 1, as[3], q[4]);
    
    pe b1(n[3], d[0], q[4], q[4], bs[0], bc[0]);
    pe b2(as[0], d[1], bc[0], q[4], bs[1], bc[1]);
    pe b3(as[1], d[2], bc[1], q[4], bs[2], bc[2]);
    pe b4(as[2], d[3], bc[2], q[4], bs[3], bc[3]);
    pe b5(as[3], 0, bc[3], q[4], bs[4], q[3]);
    
    pe c1(n[2], d[0], q[3], q[3], cs[0], cc[0]);
    pe c2(bs[0], d[1], cc[0], q[3], cs[1], cc[1]);
    pe c3(bs[1], d[2], cc[1], q[3], cs[2], cc[2]);
    pe c4(bs[2], d[3], cc[2], q[3], cs[3], cc[3]);
    pe c5(bs[3], 0, cc[3], q[3], cs[4], cc[4]);
    pe c6(bs[4], 0, cc[4], q[3], cs[5], q[2]);
    
    pe d1(n[1], d[0], q[2], q[2], ds[0], dc[0]);
    pe d2(cs[0], d[1], dc[0], q[2], ds[1], dc[1]);
    pe d3(cs[1], d[2], dc[1], q[2], ds[2], dc[2]);
    pe d4(cs[2], d[3], dc[2], q[2], ds[3], dc[3]);
    pe d5(cs[3], 0, dc[3], q[2], ds[4], dc[4]);
    pe d6(cs[4], 0, dc[4], q[2], ds[5], dc[5]);
    pe d7(cs[5], 0, dc[5], q[2], ds[6], q[1]);
    
    pe e1(n[0], d[0], q[1], q[1], rem[0], ec[0]);
    pe e2(ds[0], d[1], ec[0], q[1], rem[1], ec[1]);
    pe e3(ds[1], d[2], ec[1], q[1], rem[2], ec[2]);
    pe e4(ds[2], d[3], ec[2], q[1], rem[3], ec[3]);
    pe e5(ds[3], 0, ec[3], q[1], rem[4], ec[4]);
    pe e6(ds[4], 0, ec[4], q[1], rem[5], ec[5]);
    pe e7(ds[5], 0, ec[5], q[1], rem[6], ec[6]);
    pe e8(ds[6], 0, ec[6], q[1], rem[7], q[0]);
    
endmodule

module pe(input a,input b,input cin,input add_sub,output s,output cout

    );

    wire x1,x2,x3,x4;

    xor g1(x1,b,add_sub);
    xor g2(x2,a,x1);
    xor g3(s,x2,cin);
    and g4(x3,a,x1);
    and g5(x4,x2,cin);
    or g6(cout,x3,x4);

endmodule
