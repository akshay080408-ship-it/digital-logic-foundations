`timescale 1ns/1ps
module alu4bit_tb;
    reg [3:0]a,b;
    reg [1:0]sel;
    wire [3:0]result;
    wire cout;
    alu4bit uut(
        .a(a),.b(b),.sel(sel),
        .result(result),.cout(cout)
    );
initial begin
  $dumpfile("alu4bit.vcd");
  $dumpvars(0,alu4bit_tb);
  a=4'b1000 ; b= 4'b1111 ; sel=2'b00; #10;
  a=4'b0000 ; b= 4'b1111 ; sel=2'b01; #10;
  a=4'b1111 ; b= 4'b0001 ; sel=2'b10; #10;
  a=4'b1001 ; b= 4'b1001 ; sel=2'b11; #10;
  a=4'b0011 ; b= 4'b0101 ; sel=2'b01; #10;
  $finish;
  end
    initial
          $monitor("t=%0t a=%b b=%b sel=%b | result=%b cout=%b", $time , a,b,sel,result,cout);
    endmodule