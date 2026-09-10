`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.08.2026 15:34:42
// Design Name: 
// Module Name: divider_top
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


module divider_top(
    input [6:0] n,
    input [3:0] d,
    output [3:0] q,
    output [3:0] r

    );
    wire [3:0] b0;
    wire [3:0]df0;
    // divider_pe(input n,d,bi,sel,output bout,diff);
    //ROW :0
    divider_pe pe03(n[3],d[0],1'b0,b0[3],b0[0],df0[0]);
    divider_pe pe02(n[4],d[1],b0[0],b0[3],b0[1],df0[1]);
    divider_pe pe01(n[5],d[2],b0[1],b0[3],b0[2],df0[2]);
    divider_pe pe00(n[6],d[3],b0[2],b0[3],b0[3],df0[3]);
    assign q[3] = ~b0[3];
    
    //ROW1
    wire [3:0] df1;
    wire[4:0] b1;
    wire t;
    divider_pe pe14(n[2]  ,d[0],1'b0,b1[4],b1[0],df1[0]);
    divider_pe pe13(df0[0],d[1],b1[0],b1[4],b1[1],df1[1]);
    divider_pe pe12(df0[1],d[2],b1[1],b1[4],b1[2],df1[2]);
    divider_pe pe11(df0[2],d[3],b1[2],b1[4],b1[3],df1[3]);
    divider_pe pe10(df0[3],1'b0,b1[3],b1[4],b1[4],t);
    assign q[2]=~b1[4];
    
    //ROW2
    wire [4:0] df2;
    wire[4:0] b2;
 
    divider_pe pe25(n[1],d[0],1'b0,b2[4],b2[0],df2[0]);
    divider_pe pe24(df1[0],d[1],b2[0],b2[4],b2[1],df2[1]);
    divider_pe pe23(df1[1],d[2],b2[1],b2[4],b2[2],df2[2]);
    divider_pe pe22(df1[2],d[3],b2[2],b2[4],b2[3],df2[3]);
    divider_pe pe21(df1[3],1'b0,b2[3],b2[4],b2[4],df2[4]);
    assign q[1]=~b2[4];
    
    //ROW3   
     wire [3:0] b3;
    divider_pe pe36(n[0],d[0],1'b0,b3[3],b3[0],r[0]);
    divider_pe pe35(df2[0],d[1],b3[0],b3[3],b3[1],r[1]);
    divider_pe pe34(df2[1],d[2],b3[1],b3[3],b3[2],r[2]);
    divider_pe pe33(df2[2],d[3],b3[2],b3[3],b3[3],r[3]);
    assign q[0] = ~b3[3];
    
endmodule
