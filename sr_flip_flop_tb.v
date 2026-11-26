`timescale 1ns/1ps
module sr_flip_flop_tb;
reg clk,s,r; wire q;
sr_flip_flop dut(.clk(clk),.s(s),.r(r),.q(q));
initial clk=0; always #5 clk=~clk;
initial begin
$dumpfile("sr_flip_flop.vcd"); $dumpvars(0,sr_flip_flop_tb);
s=0; r=0; @(negedge clk); s=1; r=0;
@(negedge clk); s=0; r=1; @(negedge clk); s=1; r=1;
@(negedge clk); $finish;
end
initial $monitor("t=%0t clk=%b s=%b r=%b q=%b",$time,clk,s,r,q);
endmodule
