`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.02.2026 14:59:10
// Design Name: 
// Module Name: sqrt
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



module sqrt(
    input [7:0] in,
    output reg [7:0] out,
    input clk,
    input rst
);

reg [11:0] g;

wire s;
wire [11:0] r;
wire [11:0] o;
wire [11:0] rem;

comp c(.a(g[7:1]), .b(in[7:1]), .s(s));
add  a(.a({4'd0,out}), .b(g), .cin(1'b0), .s(r));

div d(
    .dividend({in,8'd0}),
    .divisor(g),
    .quotient(o),
    .remainder(rem)
);

always @(posedge clk or negedge rst) begin
    if(!rst) begin
        out <= 8'd0;
        g   <= {in,4'd0};
    end
    else if(!s) begin
        g   <= r >> 1;
        out <= o[7:0];
    end
end

endmodule

    

module div(
    input  [15:0] dividend,
    input  [11:0] divisor,
    output [11:0] quotient,
    output [11:0] remainder
);

wire [11:0] R [0:16];
wire [11:0] S [0:15];
wire [11:0] D [0:15];
wire B [0:15];
wire [12:0] b [0:15];

assign R[0] = 12'd0;

genvar k,i;

generate
for(k=0;k<16;k=k+1) begin: STAGE

    assign S[k] = {R[k][10:0], dividend[15-k]};
    assign b[k][0] = 1'b0;

    for(i=0;i<12;i=i+1) begin: SUBS
        sub u (S[k][i], divisor[i], b[k][i], 1'b0, D[k][i], b[k][i+1]);
    end

    assign B[k]   = b[k][12];
    assign R[k+1] = B[k] ? S[k] : D[k];

end
endgenerate


assign quotient = {
    ~B[4], ~B[5], ~B[6], ~B[7],
    ~B[8], ~B[9], ~B[10],~B[11],
    ~B[12],~B[13],~B[14],~B[15]
};

assign remainder = R[16];

endmodule


module sub(input n, input d, input bin, input se,output s, output bout
    );
    wire[7:0]i;
    wire dif;
    xor(i[0],n,d);
    not(i[1],n);
    and(i[2],d,i[1]);
    xor(dif,i[0],bin);
    not(i[3],i[0]);
    and(i[4],i[3],bin);
    or(bout,i[2],i[4]);
    
    and(i[5],se,n);
    not(i[6],se);
    and(i[7],i[6],dif);
    or(s,i[5],i[7]);
    
      
endmodule

module add(input [11:0]a, input [11:0]b, input cin, output [11:0]s

    );
    wire [10:0]cr;
    fa u1(.a(a[0]),.b(b[0]),.cin(cin),.s(s[0]),.c(cr[0]));
    fa u2(.a(a[1]),.b(b[1]),.cin(cr[0]),.s(s[1]),.c(cr[1]));
    fa u3(.a(a[2]),.b(b[2]),.cin(cr[1]),.s(s[2]),.c(cr[2]));
    fa u4(.a(a[3]),.b(b[3]),.cin(cr[2]),.s(s[3]),.c(cr[3]));
    fa u5(.a(a[4]),.b(b[4]),.cin(cr[3]),.s(s[4]),.c(cr[4]));
    fa u6(.a(a[5]),.b(b[5]),.cin(cr[4]),.s(s[5]),.c(cr[5]));
    fa u7(.a(a[6]),.b(b[6]),.cin(cr[5]),.s(s[6]),.c(cr[6]));
    fa u8(.a(a[7]),.b(b[7]),.cin(cr[6]),.s(s[7]),.c(cr[7]));
    fa u9(.a(a[8]),.b(b[8]),.cin(cr[7]),.s(s[8]),.c(cr[8]));
    fa u10(.a(a[9]),.b(b[9]),.cin(cr[8]),.s(s[9]),.c(cr[9]));
    fa u11(.a(a[10]),.b(b[10]),.cin(cr[9]),.s(s[10]),.c(cr[10]));
    fa u12(.a(a[11]),.b(b[11]),.cin(cr[10]),.s(s[11]));
endmodule



module fa(input a, input b,input cin, output s, output c
    );
    wire is,ic1,ic2;
    xor (is,a,b);
    xor (s,is,cin);
    and (ic1,is,cin);
    and (ic2,a,b);
    or (c,ic1,ic2);
       
endmodule

module comp(input [6:0]a, input [6:0]b, output s
    );
    wire i[6:0];
    xnor(i[0],a[0],b[0]);
    xnor(i[1],a[1],b[1]);
    xnor(i[2],a[2],b[2]);
    xnor(i[3],a[3],b[3]);
    xnor(i[4],a[4],b[4]);
    xnor(i[5],a[5],b[5]);
    xnor(i[6],a[6],b[6]);
    and(s,i[0],i[1],i[2],i[3],i[4],i[5],i[6]);
    
    endmodule