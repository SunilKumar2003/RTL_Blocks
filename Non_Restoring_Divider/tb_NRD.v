`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.09.2026 01:31:26
// Design Name: 
// Module Name: tb_NRD
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


`timescale 1ns / 1ps

module tb_NRD;

reg [7:0] n;
reg [3:0] d;
wire [4:0] q;
wire [7:0] rem;

NRD uut(n, d, q, rem);

initial begin

n = 8'd0;   d = 4'd5;  #100;
n = 8'd1;   d = 4'd1;  #100;
n = 8'd8;   d = 4'd2;  #100;
n = 8'd20;  d = 4'd5;  #100;
n = 8'd15;  d = 4'd3;  #100;
n = 8'd25;  d = 4'd4;  #100;
n = 8'd57;  d = 4'd7;  #100;
n = 8'd100; d = 4'd10; #100;
n = 8'd127; d = 4'd15; #100;
n = 8'd255; d = 4'd15; #100;
n = 8'd32;  d = 4'd9;  #100;
n = 8'd64;  d = 4'd8;  #100;
n = 8'd31;  d = 4'd15; #100;
n = 8'd17;  d = 4'd8;  #100;
n = 8'd200; d = 4'd13; #100;

$finish;

end

initial begin
$monitor("Time=%0t | Dividend=%3d | Divisor=%2d | Quotient=%2d | Remainder=%3d", $time, n, d, q, rem);
end

endmodule