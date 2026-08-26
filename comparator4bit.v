module comparator4bit(
input wire[3:0] a,
input wire[3:0] b,
output wire GT,LT,EQ
);
assign GT = a>b;
assign LT = a<b;
assign EQ = a==b;
endmodule