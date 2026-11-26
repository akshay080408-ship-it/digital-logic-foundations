`timescale 1ns/1ps
module counter8_enable_tb;
    reg clk,en,rst;
    wire [7:0] count;
    integer i,j,k,pass_count,fail_count,priority_fail_count;
    reg [7:0] expected;
    counter8_enable dut(.clk(clk),.en(en),.rst(rst),.count(count));
    initial clk=0;
    always #5 clk=~clk;
    task check_output;
    begin
        if(count!==expected) begin
            fail_count=fail_count+1;
            if(rst && en) priority_fail_count=priority_fail_count+1;
            $display("FAIL: got=%b expected=%b rst=%b en=%b",count,expected,rst,en);
        end else pass_count=pass_count+1;
    end
    endtask
    initial begin
        $dumpfile("counter8_enable.vcd");
        $dumpvars(0,counter8_enable_tb);
        pass_count=0; fail_count=0; priority_fail_count=0; expected=0; rst=1; en=0;
        for(i=0;i<256;i=i+1) begin
            for(j=0;j<4;j=j+1) begin
                @(negedge clk); rst=1; en=0;
                @(posedge clk); #1; expected=0; check_output();
                @(negedge clk); rst=0; en=1;
                for(k=0;k<i;k=k+1) begin
                    @(posedge clk); #1; expected=expected+1'b1; check_output();
                end
                @(negedge clk); rst=(j>>1)&1; en=j&1;
                if(rst) expected=0; else if(en) expected=expected+1'b1;
                @(posedge clk); #1; check_output();
            end
        end
        $display("TOTAL=%0d PASS=%0d FAIL=%0d PRIORITY_FAIL=%0d",pass_count+fail_count,pass_count,fail_count,priority_fail_count);
        if(fail_count!=0) $fatal(1,"TEST FAILED");
        else $display("VERIFICATION PASSED");
        $finish;
    end
endmodule
