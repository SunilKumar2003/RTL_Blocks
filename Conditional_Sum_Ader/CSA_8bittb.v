`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.09.2026 02:00:01
// Design Name: 
// Module Name: CSA_8bittb
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


module tb_CSA_8;

reg [7:0] a;
reg [7:0] b;
wire [8:0] sum;

CSA_8 uut(a, b, sum);

initial begin

a = 8'b00000000; b = 8'b00000000; #10;

a = 8'b00000001; b = 8'b00000001; #10;

a = 8'b00000101; b = 8'b00000011; #10;

a = 8'b00001111; b = 8'b00000001; #10;

a = 8'b00101010; b = 8'b00010101; #10;

a = 8'b01111111; b = 8'b00000001; #10;

a = 8'b11111111; b = 8'b00000001; #10;

a = 8'b11111111; b = 8'b11111111; #10;

$finish;

end

initial begin
$monitor("Time = %0t | a = %b | b = %b | sum = %b", $time, a, b, sum);
end

endmodule