`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.02.2026 16:32:44
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


module tb_sqrt_newton_q4_4();

    // Inputs
    reg clk;
    reg rst;
    reg start;
    reg [7:0] N;

    // Outputs
    wire [7:0] root;
    wire done;

    // Instantiate the Unit Under Test (UUT)
    sqrt_newton_q4_4 uut (
        .clk(clk), 
        .rst(rst), 
        .start(start), 
        .N(N), 
        .root(root), 
        .done(done)
    );

    // Clock generation (100MHz)
    always #5 clk = ~clk;

    initial begin
        // Initialize Inputs
        clk = 0;
        rst = 1;
        start = 0;
        N = 0;

        // Reset the system
        #20;
        rst = 0;
        #10;

        // Test Case 1: Sqrt(16)
        // Input N=16 (Integer 16)
        // Expected result: 4.0 -> In Q4.4 that is 4 * 16 = 64 (0100_0000)
        N = 8'd16; 
        start = 1;
        #10;
        start = 0;
        
    
        #20;

        // Test Case 2: Sqrt(2)
        // Input N=2
        // Expected result: ~1.414 -> In Q4.4: 1.414 * 16 = 22.6 (Approx 23 or 1.4375)
        N = 8'd2;
        start = 1;
        #10;
        start = 0;

        wait(done);
        $display("Input: %d, Root (Q4.4): %d (Hex: %h)", N, root, root);
        
        #100;
        $finish;
    end
      
endmodule