`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.02.2026 17:04:03
// Design Name: 
// Module Name: tb
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


module tb_top;

    reg clk;
    reg rst;
    wire [3:0] y;

    top dut (
        .clk(clk),
        .rst(rst),
        .y(y)
    );

    // Clock: 10 ns period
    always #5 clk = ~clk;

    initial begin
        clk = 0;
        rst = 1;          // 1️⃣ assert reset
        #20;              // wait for a few clocks
        rst = 0;          // 2️⃣ deassert reset

        #200;
        $finish;
    end

endmodule
