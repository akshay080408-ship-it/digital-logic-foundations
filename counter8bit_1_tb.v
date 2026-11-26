`timescale 1ns/1ps
module counter8_tb;
    reg clk,rst;
    wire [7:0] count;
    integer i,pass_count,fail_count;
    reg [7:0] expected;
    counter8 dut(.clk(clk),.rst(rst),.count(count));
    initial clk=0;
    always #5 clk=~clk;
    task check_output;
    begin
        if(count!==expected) begin
            fail_count=fail_count+1;
            $display("FAIL: got=%b expected=%b",count,expected);
        end else pass_count=pass_count+1;
    end
    endtask
    initial begin
        $dumpfile("counter8.vcd"); $dumpvars(0,counter8_tb);
        pass_count=0; fail_count=0; rst=1; expected=0;
        @(posedge clk); #1; check_output();
        @(negedge clk); rst=0;
        for(i=1;i<=256;i=i+1) begin
            @(posedge clk); #1; expected=i[7:0]; check_output();
        end
        $display("TOTAL=%0d PASS=%0d FAIL=%0d",pass_count+fail_count,pass_count,fail_count);
        if(fail_count!=0) $fatal(1,"TEST FAILED");
        else $display("VERIFICATION PASSED");
        $finish;
    end
endmodule
