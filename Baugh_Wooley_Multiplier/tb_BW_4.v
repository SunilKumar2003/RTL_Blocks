`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.09.2026 02:18:44
// Design Name: 
// Module Name: tb_BW_4
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


module tb_BW_4;

reg [3:0] a;
reg [3:0] b;
wire [7:0] p;

BW_4 uut(a, b, p);

initial begin

a = 4'b0000; b = 4'b0000; #10;

a = 4'b0001; b = 4'b0001; #10;

a = 4'b0010; b = 4'b0011; #10;

a = 4'b0101; b = 4'b0011; #10;

a = 4'b0111; b = 4'b0111; #10;

a = 4'b1111; b = 4'b0001; #10;

a = 4'b1110; b = 4'b0011; #10;

a = 4'b1101; b = 4'b1101; #10;

a = 4'b1000; b = 4'b0001; #10;

a = 4'b1000; b = 4'b1111; #10;

a = 4'b1000; b = 4'b1000; #10;

$finish;

end

initial begin
$monitor("Time = %0t | a = %b | b = %b | product = %b", $time, a, b, p);
end

endmodule