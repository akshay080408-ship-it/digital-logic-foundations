`timescale 1ns/1ps
module d_flip_flop_tb;
    reg clk,d,en,rst;
    wire q;
    integer pass_count,fail_count;
    d_flip_flop dut(.clk(clk),.d(d),.en(en),.rst(rst),.q(q));
    initial clk=0;
    always #5 clk=~clk;
    task check_output(input expected);
    begin
        if(q!==expected) begin fail_count=fail_count+1; $display("FAIL got=%b expected=%b",q,expected); end
        else begin pass_count=pass_count+1; $display("PASS q=%b",q); end
    end
    endtask
    initial begin
        $dumpfile("d_flip_flop.vcd"); $dumpvars(0,d_flip_flop_tb);
        pass_count=0; fail_count=0; rst=1; en=0; d=0;
        @(posedge clk); #1; check_output(0);
        @(negedge clk); rst=0; en=1; d=1;
        @(posedge clk); #1; check_output(1);
        @(negedge clk); en=0; d=0;
        @(posedge clk); #1; check_output(1);
        @(negedge clk); rst=1;
        @(posedge clk); #1; check_output(0);
        $display("PASS=%0d FAIL=%0d",pass_count,fail_count);
        if(fail_count!=0) $fatal(1,"TEST FAILED");
        $finish;
    end
endmodule
