`timescale 1ns/1ps
module quiet_counter_tb;
    reg clk,rst,loud;
    wire [1:0] quiet_count;
    quiet_counter dut(.clk(clk),.rst(rst),.loud(loud),.quiet_count(quiet_count));
    initial clk=0;
    always #5 clk=~clk;
    initial begin
        $dumpfile("quiet_counter.vcd"); $dumpvars(0,quiet_counter_tb);
        rst=1; loud=0;
        @(negedge clk); rst=0;
        repeat(4) @(negedge clk);
        loud=1; @(negedge clk); loud=0;
        repeat(3) @(negedge clk);
        $finish;
    end
    initial $monitor("t=%0t clk=%b rst=%b loud=%b quiet_count=%b",$time,clk,rst,loud,quiet_count);
endmodule
