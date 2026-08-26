`timescale 1ns/1ps
module ripple_carry_adder4bit_tb;
    reg [3:0]a,b;
    reg cin;
    wire [3:0]sum;
    wire cout;
    ripple_carry_adder4bit uut(
        .a(a),.b(b),.cin(cin),
        .sum(sum),.cout(cout)
    );
initial begin
  $dumpfile("ripple_carry_adder4bit.vcd");
  $dumpvars(0,ripple_carry_adder4bit_tb);
  cin=1'b0;
  a=4'b1000 ; b= 4'b1111 ; #10;
  a=4'b0000 ; b= 4'b1111 ; #10;
  a=4'b1111 ; b= 4'b0001 ; #10;
  a=4'b1001 ; b= 4'b1001 ; #10;
  $finish;
  end
    initial
          $monitor("t=%0t a=%b b=%b Cin=%b | sum=%b cout=%b", $time , a,b,cin,sum,cout);
    endmodule