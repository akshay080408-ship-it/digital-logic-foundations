`timescale 1ns/1ps
module t_flip_flop_tb;
reg clk,t,r; wire q;
t_flip_flop dut(.clk(clk),.t(t),.r(r),.q(q));
initial clk=0; always #5 clk=~clk;
initial begin
$dumpfile("t_flip_flop.vcd"); $dumpvars(0,t_flip_flop_tb);
t=0; r=1; @(negedge clk); r=0; t=1;
repeat(3) @(negedge clk); t=0; @(negedge clk); r=1;
@(negedge clk); $finish;
end
initial $monitor("t=%0t clk=%b t=%b r=%b q=%b",$time,clk,t,r,q);
endmodule
