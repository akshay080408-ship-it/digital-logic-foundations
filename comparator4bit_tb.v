`timescale 1ns/1ps
module comparator4bit_tb;
    reg [3:0]a,b;
    wire GT,LT,EQ;
comparator4bit uut(
    .a(a),
    .b(b),
    .GT(GT),
    .LT(LT),
    .EQ(EQ)
);
initial begin
    $dumpfile("comparator4bit.vcd");
    $dumpvars(0,comparator4bit_tb);
    a = 4'b0101; b = 4'b0011; #10;  
    a = 4'b0010; b = 4'b0111; #10;  
    a = 4'b1010; b = 4'b1010; #10;  
    a = 4'b1111; b = 4'b0000; #10;  
end
initial
    $monitor("time=%0t a=%b b=%b | GT=%b LT=%b EQ=%b",$time,a,b,GT,LT,EQ);
 endmodule