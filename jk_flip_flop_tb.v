`timescale 1ns/1ps
module jk_flip_flop_tb;
    reg clk,j,k;
    wire q;
    jk_flip_flop dut(.clk(clk),.j(j),.k(k),.q(q));
    initial clk=0;
    always #5 clk=~clk;
    initial begin
        $dumpfile("jk_flip_flop.vcd"); $dumpvars(0,jk_flip_flop_tb);
        j=0; k=0;
        @(negedge clk); j=1; k=0;
        @(negedge clk); j=0; k=1;
        @(negedge clk); j=1; k=1;
        @(negedge clk); j=0; k=0;
        #2; $finish;
    end
    initial $monitor("t=%0t clk=%b j=%b k=%b q=%b",$time,clk,j,k,q);
endmodule
