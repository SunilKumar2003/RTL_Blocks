`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.03.2025 11:33:32
// Design Name: 
// Module Name: GCD_datapath
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


module GCD_datapath(gt,lt,eq,ldA,ldB,sel1,sel2,sel_in,data_in,clk

    );
    input ldA,ldB,sel1,sel2,sel_in,clk;
    input [15:0] data_in;
    output gt,lt,eq;
    wire [15:0] Aout,Bout,X,Y,Bus,SubOut;
    
    PIPO A(Aout,Bus,ldA,clk);
    PIPO B(Bout,Bus,ldB,clk);
    MUX MUX_1(X,Aout,Bout,sel1);
    MUX MUX_2(Y,Aout,Bout,sel2);
    MUX MUX_load(Bus,data_in,SubOut,sel_in);
    SUB SB(SubOut,X,Y);
    COMPARE CMP(lt,gt,eq,Aout,Bout);
    
endmodule


module PIPO(dout,din,load,clk
    );
    input [15:0] din;
    output reg [15:0] dout;
    input load,clk;
    
    always @(posedge clk)
        if(load) dout<=din;
endmodule 

module MUX(dout,da,db,select
    );
    input [15:0] da,db;
    output [15:0] dout;
    input select;
     
    assign dout = select ? db : da;
 endmodule 