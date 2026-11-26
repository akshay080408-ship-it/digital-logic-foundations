`timescale 1ns/1ps
module counter4_updown_tb;
    reg clk,rst,en,load,dir;
    reg [3:0]data;
    wire [3:0]count;
    integer i,j,k,pass_count,fail_count,test_no;
    reg [3:0]expected;
    counter4_updown dut(.clk(clk),.rst(rst),.en(en),.load(load),.dir(dir),.data(data),.count(count));
    initial clk=0;
    always #5 clk=~clk;
    task check_output;
    begin
        test_no=test_no+1;
        if(count!==expected) begin
            fail_count=fail_count+1;
            $display("FAIL: Test=%0d got=%b expected=%b",test_no,count,expected);
        end else pass_count=pass_count+1;
    end
    endtask
    initial begin
        $dumpfile("counter4_updown.vcd");
        $dumpvars(0,counter4_updown_tb);
        test_no=0; pass_count=0; fail_count=0;
        rst=1; en=0; load=0; dir=0; data=0; expected=0;
        @(posedge clk); #1; check_output();
        for(i=0;i<16;i=i+1) begin
            for(j=0;j<16;j=j+1) begin
                @(negedge clk);
                rst=(j>>3)&1; load=(j>>2)&1; en=(j>>1)&1; dir=j&1; data=i;
                if(rst) expected=0;
                else if(load) expected=data;
                else if(en && dir) expected=expected+1'b1;
                else if(en && !dir) expected=expected-1'b1;
                @(posedge clk); #1; check_output();
            end
        end
        @(negedge clk); rst=0; load=1; en=1; dir=0; data=14; expected=14;
        @(posedge clk); #1; check_output();
        @(negedge clk); load=0; dir=1;
        for(k=0;k<3;k=k+1) begin expected=expected+1'b1; @(posedge clk); #1; check_output(); @(negedge clk); end
        dir=0;
        for(k=0;k<3;k=k+1) begin expected=expected-1'b1; @(posedge clk); #1; check_output(); @(negedge clk); end
        en=0; rst=0; load=0;
        @(posedge clk); #1; check_output();
        @(negedge clk); rst=1; expected=0;
        @(posedge clk); #1; check_output();
        @(negedge clk); rst=0; load=1; data=9; expected=9;
        @(posedge clk); #1; check_output();
        @(negedge clk); rst=1; en=1; load=0; expected=0;
        @(posedge clk); #1; check_output();
        $display("TOTAL=%0d PASS=%0d FAIL=%0d",test_no,pass_count,fail_count);
        if(fail_count!=0) $fatal(1,"TEST FAILED");
        else $display("VERIFICATION PASSED");
        $finish;
    end
endmodule
